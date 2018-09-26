package com.fh.service.system.appuser;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;

@Service("appuserService")
@SuppressWarnings("unchecked")
public class AppuserService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	// ======================================================================================

	/**
	 * 通过id获取数据
	 */
	public PageData findByUiId(PageData pd) throws Exception {
		return (PageData) dao.findForObject("AppuserMapper.findByUiId", pd);
	}

	/**
	 * 通过loginname获取数据
	 */
	public PageData findByUId(PageData pd) throws Exception {
		return (PageData) dao.findForObject("AppuserMapper.findByUId", pd);
	}

	/**
	 * 通过邮箱获取数据
	 */
	public PageData findByUE(PageData pd) throws Exception {
		return (PageData) dao.findForObject("AppuserMapper.findByUE", pd);
	}

	/**
	 * 通过编号获取数据
	 */
	public PageData findByUN(PageData pd) throws Exception {
		return (PageData) dao.findForObject("AppuserMapper.findByUN", pd);
	}

	/**
	 * 保存用户
	 */
	public void saveU(PageData pd) throws Exception {
		dao.save("AppuserMapper.saveU", pd);
	}

	/**
	 * 修改用户
	 */
	public void editU(PageData pd) throws Exception {
		dao.update("AppuserMapper.editU", pd);
	}
	
	/**
	 * 修改用户
	 */
	public void editU2(PageData pd) throws Exception {
		dao.update("AppuserMapper.editU2", pd);
	}


	/**
	 * 奖励
	 */
	public void editU3(PageData pd) throws Exception {
		dao.update("AppuserMapper.editU3", pd);
	}

	
	/**
	 * 修改手机号
	 */
	public void editU4(PageData pd) throws Exception {
		dao.update("AppuserMapper.editU4", pd);
	}
	
	/**
	 * 修改密码
	 */
	public void editU5(PageData pd) throws Exception {
		dao.update("AppuserMapper.editU5", pd);
	}
	
	
	/**
	 * 修改交易密码
	 */
	public void editU6(PageData pd) throws Exception {
		dao.update("AppuserMapper.editU6", pd);
	}

	

	/**
	 * 删除用户
	 */
	public void deleteU(PageData pd) throws Exception {
		dao.delete("AppuserMapper.deleteU", pd);
	}

	/**
	 * 批量删除用户
	 */
	public void deleteAllU(String[] USER_IDS) throws Exception {
		dao.delete("AppuserMapper.deleteAllU", USER_IDS);
	}

	/**
	 * 用户列表(全部)
	 */
	public List<PageData> listAllUser(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("AppuserMapper.listAllUser", pd);
	}
	

	/**
	 * 获取下线
	 */
	public List<Map> listAllXUser(PageData pd) throws Exception {
		return (List<Map>) dao.findForList("AppuserMapper.listAllXUser", pd);
	}
	

	/**
	 * 用户列表(用户组)
	 */
	public List<PageData> listPdPageUser(Page page) throws Exception {
		return (List<PageData>) dao.findForList("AppuserMapper.userlistPage", page);
	}

	/**
	 * 保存用户IP
	 */
	public void saveIP(PageData pd) throws Exception {
		dao.update("AppuserMapper.saveIP", pd);
	}

	/**
	 * 登录判断
	 */
	public PageData getUserByNameAndPwd(PageData pd) throws Exception {
		return (PageData) dao.findForObject("AppuserMapper.getUserInfo", pd);
	}

	/**
	 * 跟新登录时间
	 */
	public void updateLastLogin(PageData pd) throws Exception {
		dao.update("AppuserMapper.updateLastLogin", pd);
	}

}
