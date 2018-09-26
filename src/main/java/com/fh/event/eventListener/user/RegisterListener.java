package com.fh.event.eventListener.user;

import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import com.fh.event.event.BaseEvent;
import com.fh.event.event.user.RegisterEvent;
import com.fh.util.PageData;
/**
 * 注册事件监听方法
 * @author Csb
 *
 */
@Component
public class RegisterListener implements ApplicationListener<RegisterEvent> {

	/**
	 * 执行注册事件
	 */
	public void onApplicationEvent(RegisterEvent event) {
		PageData pd = (PageData) event.getObject();
		System.out.println(pd.toString());
	}

}