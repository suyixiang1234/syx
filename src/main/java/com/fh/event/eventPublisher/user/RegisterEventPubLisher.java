package com.fh.event.eventPublisher.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

import com.fh.event.event.BaseEvent;
import com.fh.event.event.user.RegisterEvent;
import com.fh.util.PageData;

/**
 * 注册事件发布器
 * 
 * @author Csb
 *
 */
@Component
public class RegisterEventPubLisher {
	@Autowired
	private ApplicationContext applicationContext;

	/**
	 * 发布事件
	 * 
	 * @param pd
	 */
	public void pushListener(PageData pd) {
		applicationContext.publishEvent(new RegisterEvent(this, pd));
	}

}