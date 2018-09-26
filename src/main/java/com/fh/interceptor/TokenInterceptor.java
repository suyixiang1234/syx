package com.fh.interceptor;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.fh.service.system.appuser.AppuserService;
import com.fh.service.system.role.RoleService;
import com.fh.util.PageData;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * app token 验证登录拦截器
 * @author 苏奕祥
 *
 */
public class TokenInterceptor implements HandlerInterceptor{
	
	private List<String> allowList; // 放行的URL列表
	@Resource(name="roleService")
	private RoleService roleService;
	
	@Resource(name="appuserService")
	private AppuserService appuserService;
	
	//读取redis模板
	@Resource(name="jedisTemplate")
	public RedisTemplate redisTemplate;

	
/*	public static JedisPool pool;
	static {
		JedisPoolConfig config = new JedisPoolConfig();
		config.setMaxActive(Integer.valueOf(bundle.getString("redis.pool.maxActive")));
		config.setMaxTotal(10000);
		config.setMaxIdle(200);
		//config.setMaxWait(Long.valueOf(bundle.getString("redis.pool.maxWait")));
		config.setTestOnBorrow(true);
		config.setTestOnReturn(true);
		pool = new JedisPool(config, "106.14.104.21", 6379, 100000, "wanzhong123",2);
		
	}*/

	//获取用户信息
/*	public static PageData getCurrentMember(HttpServletRequest request) {
		Jedis redis = TokenInterceptor.pool.getResource();
		String token = request.getParameter("token");
		byte[] value = redis.get(token.getBytes());
		Object object = SerializeUtil.unserialize(value);
		PageData member = (PageData) object;
		TokenInterceptor.pool.returnResource(redis);//释放连接池
		return member;
	}*/

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
				JSONObject jsonObj = new JSONObject();
				Boolean flag = true;
				String token = request.getParameter("token");
				//Jedis  redis = TokenInterceptor.pool.getResource();
				//String method=request.getRequestURL().toString();
			
				if (token!=null) {
						 //读取radis缓存
					    ValueOperations<String,PageData> operation = redisTemplate.opsForValue();
					    PageData user = operation.get(token);
						if (user == null) {
							flag = false;
							jsonObj.put("status", 2);
							jsonObj.put("result", new JSONObject());
							jsonObj.put("message", "在其它终端登录被强制下线或已退出，请重新登入");
							render(response, "application/json;charset=UTF-8", jsonObj.toString());
						}else{
							
						}
					
				}else{
					flag = false;
					jsonObj.put("status", 2);
					jsonObj.put("result", new JSONObject());
					jsonObj.put("message", "请求异常，token返回空");
					render(response, "application/json;charset=UTF-8", jsonObj.toString());
				}
				
				return flag;
	}



	public List<String> getAllowList() {
		return allowList;
	}

	public void setAllowList(List<String> allowList) {
		this.allowList = allowList;
	}
	
	
	
	/**
	 * 发送内容。使用UTF-8编码。
	 * @param response
	 * @param contentType
	 * @param text
	 */
	public static void render(HttpServletResponse response, String contentType,
			String text) {
		response.setContentType(contentType);
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		try {
			response.getWriter().write(text);
		} catch (IOException e) {
		}
	}



	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}



	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	

	

}
