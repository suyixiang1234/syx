
package com.fh.controller.app.appuser;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.event.eventPublisher.user.RegisterEventPubLisher;
import com.fh.service.system.appuser.AppuserApiService;
import com.fh.service.system.versions.VersionsService;
import com.fh.util.AppUtil;
import com.fh.util.PageData;

@Controller
@RequestMapping(value="/apps")
public class IntAppuserController extends BaseController {
    
	@Resource(name="appuserApiService")
	private AppuserApiService appuserApiService;
	
	
	//读取redis模板
	@Resource(name="jedisTemplate")
	public RedisTemplate redisTemplate;
		
	
	//读取dubbo服务端暴露的接口
	//@Resource(name="interfaceAllService")
	//public InterfaceAllService interfaceAllService;
	
	
	//注册监听事件
	@Resource(name="registerEventPubLisher")
	public RegisterEventPubLisher registerEventPubLisher;
	
	@Resource(name = "versionsService")
	private VersionsService versionsService;
	
	
	/**
	 * 检测新版本
	 * 
	 * @param version_code
	 *            当前安装的app版本号
	 * @param phone_type
	 *            设备类型：1：ios；0：Android；
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/check_version")
	public Object checkVersion(HttpServletRequest request) {
		try {
			return versionsService.checkVersion(this.getPageData());
		} catch (Exception e) {
			logger.error(e.toString(), e);
			return AppUtil.getResult(0, "出现错误", null);
		}
	}
	public  Map mapCopy(Map pMap,Map rMap){
		if(rMap == null){
			rMap = new HashMap();
		}
		if(pMap == null){
			return rMap;
		}
		Iterator it = pMap.entrySet().iterator();
		while(it.hasNext()){
			Map.Entry entry = (Map.Entry) it.next();
			Object key = entry.getKey();
			rMap.put(key, pMap.get(key) != null ? pMap.get(key):"");
			
		}
		
		return rMap;
	}
	
	
	/**
	 * 去新增用户页面
	 */
	@RequestMapping(value="/ftc/{tujian}")
	public ModelAndView gohtml(@PathVariable("tujian") String tujian){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd.put("tj", tujian);
			mv.setViewName("tj");
			mv.addObject("pd", this.mapCopy(pd, new HashMap()));
			
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/test")
	@ResponseBody
	public Object test(HttpServletRequest request){
		logBefore(logger, " 接口测试");
		PageData pd = new PageData();
		try {
			 pd.put("name","苏奕祥");
			
			 //测试redis
			 ValueOperations<String,PageData> operation = redisTemplate.opsForValue();
			 operation.set("ssssss", pd, 60, TimeUnit.SECONDS);
			 
			// 测试监听器
			registerEventPubLisher.pushListener(pd);
			 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return AppUtil.returnObject(new PageData(), pd);
	}
	
	@RequestMapping(value="/test1")
	@ResponseBody
	public Object test1(HttpServletRequest request){
		logBefore(logger, " 接口测试");
		PageData pd = new PageData();
		try {
			
			 ValueOperations<String,PageData> operation = redisTemplate.opsForValue();
			 pd = operation.get("suyi");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return AppUtil.returnObject(new PageData(), pd);
	}
	
	/**
	 * 注册接口
	 */
	@RequestMapping(value = "/register")
	@ResponseBody
	public Object register(HttpServletRequest request) {
		try {
			logBefore(logger, "注册");
			return appuserApiService.register(this.getPageData(), request);
		} catch (Exception e) {
			e.printStackTrace();
			return AppUtil.getResult(0, "注册失败", null);
		}
	}
	
	/**
	 * 登录接口
	 */
	@RequestMapping(value = "/login")
	@ResponseBody
	public Object login(HttpServletRequest request) {
		try {
			logBefore(logger, "登录");
			return appuserApiService.login(this.getPageData(), request);
		} catch (Exception e) {
			e.printStackTrace();
			return AppUtil.getResult(0, "登录失败", null);
		}
	}

	/**
	 * 退出接口
	 */
	@RequestMapping(value = "/yz_quit")
	@ResponseBody
	public Object quit(HttpServletRequest request) {
		try {
			logBefore(logger, "退出");
			return appuserApiService.quit(this.getPageData(), request);
		} catch (Exception e) {
			return AppUtil.getResult(0, "退出失败", null);
		}
	}
	
}
	
