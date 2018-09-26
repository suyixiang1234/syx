package com.fh.service.system.appuser;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.event.eventPublisher.user.RegisterEventPubLisher;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.MD5;
import com.fh.util.PageData;
import com.fh.util.UuidUtil;

@Service("appuserApiService")
@SuppressWarnings({ "unchecked", "rawtypes" })
public class AppuserApiService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	// 注册监听事件
	@Resource(name = "registerEventPubLisher")
	public RegisterEventPubLisher registerEventPubLisher;

	/** redis模板 */
	@Resource(name = "jedisTemplate")
	public RedisTemplate redisTemplate;

	/** 更新登录时间 */
	public void updateLastLogin(PageData pd) throws Exception {
		dao.update("AppuserApiMapper.updateLastLogin", pd);
	}

	/** 登录判断 */
	public PageData getUserByLogin(PageData pd) throws Exception {
		return (PageData) dao.findForObject("AppuserApiMapper.getUserByLogin", pd);
	}

	/** 保存用户IP */
	public void saveIP(PageData pd) throws Exception {
		dao.update("AppuserApiMapper.saveIP", pd);
	}

	/** 修改用户 */
	public void edit(PageData pd) throws Exception {
		dao.update("AppuserApiMapper.edit", pd);
	}

	/** 通过id获取数据 */
	public PageData findByUserid(PageData pd) throws Exception {
		return (PageData) dao.findForObject("AppuserApiMapper.findByUserid", pd);
	}
	
	/** 验证交易密码 */
	public PageData findByRz(PageData pd) throws Exception {
		return (PageData) dao.findForObject("AppuserApiMapper.findByRz", pd);
	}
	

	/** 通过邮箱获取数据 */
	public PageData findByEmail(PageData pd) throws Exception {
		return (PageData) dao.findForObject("AppuserApiMapper.findByEmail", pd);
	}
	
	
	/** 通过shouj获取数据 */
	public PageData findByPhone(PageData pd) throws Exception {
		return (PageData) dao.findForObject("AppuserApiMapper.findByPhone", pd);
	}
	
	

	/** 通过编号获取数据 */
	public PageData findByNumber(PageData pd) throws Exception {
		return (PageData) dao.findForObject("AppuserApiMapper.findByNumber", pd);
	}

	/** 通过loginname获取数据 */
	public PageData findByUserame(PageData pd) throws Exception {
		return (PageData) dao.findForObject("AppuserApiMapper.findByUserame", pd);
	}

	/** 保存用户 */
	public void save(PageData pd) throws Exception {
		dao.save("AppuserApiMapper.save", pd);
	}

	/** 用户列表(用户组) */
	public List<PageData> userlistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("AppuserApiMapper.userlistPage", page);
	}

	/**
	 * 用户列表(按关系查询) 待修改
	 * 
	 * @param pd
	 *            传递参数 <br>
	 *            pd.type 搜索类别：0=查询下级；1=查询某一级；2=查询n级以内包含n级(&lt;n)； <br>
	 *            3=查询n级以外包含n级(&gt;n)；4=查询m-n级包含m和n(m&lt;=floor&lt;=n)； <br>
	 *            pd.user_id 用户ID <br>
	 *            pd.floors type值为1，2，3时必传 <br>
	 *            pd.floors_start 范围查询开始级数，type值为4时必传 <br>
	 *            pd.floors_end 范围查询结束级数，type值为4时必传 <br>
	 *            pd.keyword 关键字查询
	 */
	public Object listUserFloors(PageData pd) throws Exception {
		Page page = new Page();
		page.setCurrentPage(Integer.valueOf(pd.get("pageno") == null ? "1" : pd.get("pageno") + ""));
		page.setShowCount(Integer.valueOf(pd.get("showCount") == null ? "10" : pd.get("showCount") + ""));
		page.setPd(pd);
		List<PageData> list = (List<PageData>) dao.findForList("AppuserApiMapper.userFloorslistPage", page);
		return AppUtil.getPageResult(1, "请求成功", list, page.getTotalPage(), page.getCurrentPage());
	}

	/** 登录 */
	public Object login(PageData pd, HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		ValueOperations<String, Object> jedis = redisTemplate.opsForValue();
		pd.put("password", MD5.md5(pd.getString("password")));
		PageData user = this.getUserByLogin(pd);
		if (user == null) {
			return AppUtil.getResult(0, "账户或密码有误或被冻结", map);
		} else {
		  /*String session = MD5.md5(pd.getString("username") + pd.getString("password") + "usernamepassword" + ",fh,");
			String token = UUID.randomUUID().toString().replaceAll("-", "") + pd.getString("username") + "fx"+ pd.getString("password");// 生成随机token
			token = MD5.md5(token);// MD5加密混淆
			// 登录之前踢掉上一次登录会话
			String token_old = (String) jedis.get(session);
			if (token_old != null) {
				redisTemplate.delete(token_old);
			}
			map.put("username", user.getString("username"));
			map.put("phone", user.getString("phone"));
			map.put("user_id", user.getString("user_id"));
			map.put("token", token);
			map.put("role_id", user.getString("role_id"));
			String head_image = user.get("head_image") + "";// 头像路径转换
			if ((user.get("head_image") + "").indexOf("http://") == -1) {
				String path = request.getContextPath();
				String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
						+ path + "/";
				head_image = basePath + Const.FILEPATHIMG + head_image;
			}
			map.put("head_image", head_image);
			map.put("ios_hend_password", user.getString("ios_hend_password"));
			map.put("android_hend_password", user.getString("android_hend_password"));
			map.put("hand_pass_status", (Integer) user.get("hand_pass_status"));
			map.put("connect_name", user.getString("name"));
			*/
			// 使用radis缓存登录信息以及token
			//jedis.set(token, map, 30, TimeUnit.DAYS);
			//jedis.set(session, token);
			
			//shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();  
			Session session = currentUser.getSession();
			session.setAttribute(Const.SESSION_WEBUSER, user);
			return AppUtil.getResult(1, "登录成功", map);
		}
	}

	/**
	 * 退出登录
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Object quit(PageData pd, HttpServletRequest request) throws Exception {
		String token = request.getParameter("token");
		redisTemplate.delete(token);
		return AppUtil.getResult(1, "退出成功", null);
	}

	/**
	 * 注册
	 * @param pageData
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public Object register(PageData pd, HttpServletRequest request) throws Exception {
		String dynamicCode = "" + (int) ((Math.random() * 9 + 1) * 100000);
		pd.put("USER_ID", UuidUtil.get32UUID());	
		pd.put("RIGHTS", dynamicCode);//推荐id					
		pd.put("LAST_LOGIN", "");				
		pd.put("IP", "");	
		pd.put("STATUS", "1");	
		pd.put("IP", "");	
		pd.put("START_TIME", DateUtil.getTime());	
		pd.put("PASSWORD", MD5.md5(pd.getString("PASSWORD")));
		dao.save("AppuserMapper.saveU", pd);
		// 注册事件监听器
		registerEventPubLisher.pushListener(pd);
		
		
		
		return AppUtil.getResult(1, "注册成功", null);
	}
	
	
	/**
	 * 认证
	 * @param pageData
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public Object register1(PageData pd, HttpServletRequest request) throws Exception {
		pd.put("PASSWORD2", MD5.md5(pd.getString("PASSWORD2")));
		dao.update("AppuserMapper.editRz", pd);
		return AppUtil.getResult(1, "认证成功", null);
	}


}
