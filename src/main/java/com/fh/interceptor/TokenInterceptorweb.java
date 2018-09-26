package com.fh.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fh.util.Const;
import com.fh.util.PageData;
/**
* @author 苏奕祥
* @version 1.6
 */
public class TokenInterceptorweb extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		//shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		PageData user = (PageData)session.getAttribute(Const.SESSION_WEBUSER);
		if(user!=null){
			return true;		
		}else{
			//登陆过滤
			response.sendRedirect(request.getContextPath() + Const.WEB_LOGIN);
			return false;	
		}
	}
	
}
