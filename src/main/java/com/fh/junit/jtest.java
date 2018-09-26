/*package com.fh.junit;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.fbs.service.InterfaceAllService;

import junit.framework.TestCase;



public class jtest extends TestCase {
	
	
	//客户端单元测试类
	public void testMain() {
		System.out.println("junit单元测试开始..............");
		
		ApplicationContext ac = new FileSystemXmlApplicationContext("classpath:application.xml"); 
		InterfaceAllService interfaceAllService = (InterfaceAllService) ac.getBean("interfaceAllService");
	
		Map map = new HashMap(); 
		
		try {
			System.out.println(interfaceAllService.getName());
			System.out.println(interfaceAllService.getSex());
			System.out.println(interfaceAllService.getTestRedis());
			System.out.println(interfaceAllService.getTest(map));
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	
		System.out.println("junit单元测试结束..............");
	
		try {
			System.in.read();
		} catch (IOException e) {		
			e.printStackTrace();
		}  
		
		
		
	}
	

}
*/