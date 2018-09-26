package com.fh.event.event.user;

import com.fh.event.event.BaseEvent;
import com.fh.util.PageData;
/**
 * 注册事件
 * @author Csb
 *
 */
@SuppressWarnings({ "rawtypes", "serial", "unchecked" })
public class RegisterEvent extends BaseEvent {
	public RegisterEvent(Object source, PageData pd) {
		super(source, pd);
	}
}