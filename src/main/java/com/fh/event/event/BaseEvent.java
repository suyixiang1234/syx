package com.fh.event.event;

import org.springframework.context.ApplicationEvent;

public class BaseEvent<T> extends ApplicationEvent {
	/**
	 * 测试监听事件
	 */
	private static final long serialVersionUID = 1L;

	private T t;

	/**
	 * @param source 事件对象
	 * @param t 需要传递的对象
	 */
	public BaseEvent(Object source, T t) {
		super(source);
		this.t = t;
	}
	
	/**
	 * @return 获取传递的对象
	 */
	public T getObject() {
		return this.t;
	}

	/**
	 * @param t 设置传递的对象
	 */
	public void setObject(T t) {
		this.t = t;
	}
}