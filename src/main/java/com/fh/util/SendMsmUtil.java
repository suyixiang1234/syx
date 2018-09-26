package com.fh.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

/**
 * 
 * 文件作用：http接口使用实例
 *  http://www.yunsms.cn/ 
 * 
 * 
 * 100 发送成功 101 验证失败 102 短信不足 103 操作失败 104 非法字符 105 内容过多 106 号码过多 107 频率过快 108
 * 号码内容空 109 账号冻结 110 禁止频繁单条发送 111 系统暂定发送 112 有错误号码 113 定时时间不对 114 账号被锁，10分钟后登录
 * 115 连接失败 116 禁止接口发送 117 绑定IP不正确 120 系统升级
 */

public class SendMsmUtil {
	
	private static final String BASEURL = "http://http.yunsms.cn/";
	private static final String ACCOUNT = "216550";  
	private static final String PASSWORD = "mbsc38";

	/**
	 * 发送短信（指定帐号密码）
	 * @param phone=15359303204
	 * @param content=你好，验证码：1019【云短信】
	 * @param account=帐号
	 * @param password=密码
	 * @return=100
	 */
	public static String send(String phone, String content,String account,String password) {
		if(phone==null || phone.length()!=11 || account ==null){
			System.out.println("短信发送失败：手机号："+phone+",内容："+content);
			return null;
		}
		// 创建StringBuffer对象用来操作字符串
		StringBuffer sb = new StringBuffer("tx/?");
		// 向StringBuffer追加用户名
		sb.append("uid=" + account);
		// 向StringBuffer追加密码（密码采用MD5 32位 小写）
		sb.append("&pwd=" + MD5.md5(password));
		// 向StringBuffer追加手机号码
		sb.append("&mobile="+phone);
		sb.append("&encode=utf8");
		// 向StringBuffer追加消息内容转URL标准码
		try {
			sb.append("&content=" + URLEncoder.encode(content,"UTF-8"));
			return request(sb.toString());
		} catch (UnsupportedEncodingException e) {
			return null;
		}
	}
	
	/**
	 * 发送短信（默认帐号密码）
	 * @param phone=15359303204
	 * @param content=你好，验证码：1019【云短信】
	 * @return=100
	 */
	public static String send(String phone, String content) {
		return send(phone, content,ACCOUNT,PASSWORD);
	}
	/**
	 * 查已发送条数
	 * @param account
	 * @param password
	 * @return
	 */
	public static String getSendNum(String account,String password) {
		String result = request("mm/?uid=" + account+"&pwd=" + MD5.md5(password)+"&cmd=send");
		if(result!=null&&result.indexOf("||")!=-1){
			String sendNum=result.split("\\|\\|")[1];
			System.out.println("已发送条数为："+sendNum);
			return sendNum;
		}
		return result;
	}
	/**
	 * 查剩余条数
	 * @param account
	 * @param password
	 * @return
	 */
	public static String getMoney(String account,String password) {
		String result = request("mm/?uid=" + account+"&pwd=" + MD5.md5(password));
		if(result!=null&&result.indexOf("||")!=-1){
			String sendNum=result.split("\\|\\|")[1];
			System.out.println("剩余条数为："+sendNum);
			return sendNum;
		}
		return result;
	}
	
	/**
	 * 查已发送条数
	 * @return
	 */
	public static String getSendNum() {
		return getSendNum(ACCOUNT,PASSWORD);
	}
	/**
	 * 查剩余条数
	 * @return
	 */
	public static String getMoney() {
		return getMoney(ACCOUNT,PASSWORD);
	}
	/**
	 * 请求接口
	 * @param urlString
	 * @return
	 */
	public static String request(String urlString) {
		String requsetUrl = BASEURL+urlString;
		String inputline="000";
		try {
			// 创建url对象
			URL url = new URL(requsetUrl);
			// 打开url连接
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			// 设置url请求方式 ‘get’ 或者 ‘post’
			connection.setRequestMethod("POST");
			// 发送
			BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
			// 返回发送结果
			inputline = in.readLine();
			// 返回结果为‘100’ 发送成功
			System.out.println("短信接口请求结果:" + inputline+"，请求："+requsetUrl);
		} catch (Exception e) {
			System.out.println("短信发送失败，请求地址："+requsetUrl+"。异常:"+e.getMessage());
		}
		return inputline;
	}
	
	/**
	 * @param args
	 * @throws IOException
	 */
	public static void main(String[] args){
		SendMsmUtil.send("17305922515","您好【卓联信息科技】");
		getMoney();
		getSendNum();
	}

}
