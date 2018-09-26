
package com.fh.controller.html;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alipay.util.AlipayNotify;
import com.alipay.util.AlipaySubmit;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.event.eventPublisher.user.RegisterEventPubLisher;
import com.fh.service.information.pictures.PicturesService;
import com.fh.service.system.appuser.AppuserApiService;
import com.fh.service.system.appuser.AppuserService;
import com.fh.service.system.menu.MenuService;
import com.fh.service.xnb.banks.BanksService;
import com.fh.service.xnb.chongzhi.ChongzhiService;
import com.fh.service.xnb.coins.CoinsService;
import com.fh.service.xnb.news.NewsService;
import com.fh.service.xnb.reward.RewardService;
import com.fh.service.xnb.tixian.TixianService;
import com.fh.service.xnb.trade.TradeService;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.MD5;
import com.fh.util.PageData;
import com.fh.util.SendMsmUtil;
import com.fh.util.Tools;
import com.unionpay.acp.sdk.AcpService;
import com.unionpay.acp.sdk.DemoBase;
import com.unionpay.acp.sdk.LogUtil;
import com.unionpay.acp.sdk.SDKConfig;

/** 
 * @项目名称: 测试前端控制类
 * @类名: HtmlController 
 * @描述: TODO
 * @作者: syx
 * @创建时间: 2018年4月12日 下午3:32:09 
 * @修改人：
 * @修改时间：
 * @修改备注： 
 */
/**
 * @项目名称: xnb
 * @类名: HtmlController
 * @描述: TODO
 * @作者: Administrator
 * @创建时间: 2018年9月10日 下午3:31:51 @修改人： @修改时间： @修改备注：
 */
@Controller
@RequestMapping(value = "/html")
public class HtmlController extends BaseController {

	@Resource(name = "appuserApiService")
	private AppuserApiService appuserApiService;

	// 读取redis模板
	@Resource(name = "jedisTemplate")
	public RedisTemplate redisTemplate;

// 读取dubbo服务端暴露的接口
// @Resource(name="interfaceAllService")
// public InterfaceAllService interfaceAllService;

	// 注册监听事件
	@Resource(name = "registerEventPubLisher")
	public RegisterEventPubLisher registerEventPubLisher;

	@Resource(name = "menuService")
	private MenuService menuService;

	@Resource(name = "picturesService")
	private PicturesService picturesService;

	@Resource(name = "newsService")
	private NewsService newsService;

	@Resource(name = "coinsService")
	private CoinsService coinsService;

	@Resource(name = "tradeService")
	private TradeService tradeService;
	
	@Resource(name="appuserService")
	private AppuserService appuserService;
	
	@Resource(name="tixianService")
	private TixianService tixianService;
	
	@Resource(name="rewardService")
	private RewardService rewardService;
	
	@Resource(name="chongzhiService")
	private ChongzhiService chongzhiService;
	
	
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
	 * 支付宝提交订单页
	 * @throws Exception 
	 */
	@RequestMapping(value = "/subAccount")
	public void subaccount(String order_id,HttpServletRequest request, HttpServletResponse response) throws Exception {
	
				//PageData pd = new PageData();
				//pd.put("order_id", order_id);
				//pd = orderService.findById(pd);
				String price = 1+"";
				
		        //支付类型
				String payment_type = "1";
				//必填，不能修改
				StringBuffer p = request.getRequestURL();
				int endp = p.length() - "/subAccount".length();
				String path = p.toString().substring(0, endp);
				
				//服务器异步通知页面路径
				String notify_url =path+"/notify_url.do";
				//需http://格式的完整路径，不能加?id=123这类自定义参数
	
				//页面跳转同步通知页面路径
				String return_url =path+"/return_url.do";
				//需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/
	
				//商户订单号
				String out_trade_no = "1365584774";
				//商户网站订单系统中唯一订单号，必填
				String total_fee;
				String subject; 
				//订单名称
				subject ="测试";
				total_fee =price;
				//必填
	
				//订单描述
				String body ="";
				//商品展示地址
				String show_url ="" ;
				//需以http://开头的完整路径，例如：http://www.商户网址.com/myorder.html
	
				//防钓鱼时间戳
				String anti_phishing_key = "";
				//若要使用请调用类文件submit中的query_timestamp函数
	
				//客户端的IP地址
				String exter_invoke_ip = "";
				//非局域网的外网IP地址，如：221.0.0.1
				
				//超时时间
				String it_b_pay ="";
	
				DateUtil.getTime();
				
				//钱包token
				String extern_token = "";
				//把请求参数打包成数组 create_direct_pay_by_user   pc端
				Map<String, String> sParaTemp = new HashMap<String, String>();
				//sParaTemp.put("service", "create_direct_pay_by_user");
				//sParaTemp.put("service", "alipay.wap.create.direct.pay.by.user");
				 
				String keys = "wgpo0g5x7e1yg7qi8x84io1btwnp695d";
				//keys =keys.toUpperCase(); 
				String Sign ="pay_memberid=11130&pay_orderid="+order_id+"&pay_applydate="+DateUtil.getTime()+"&pay_notifyurl="+
				               notify_url+"&pay_callbackurl="+return_url+"&pay_amount=1"+keys+"";
				Sign = MD5.md5(Sign);
				Sign = Sign.toUpperCase();
				
				sParaTemp.put("pay_memberid", "11130");
				sParaTemp.put("pay_orderid", order_id);
				sParaTemp.put("pay_applydate", DateUtil.getTime());
				sParaTemp.put("pay_notifyurl", notify_url);
				sParaTemp.put("pay_callbackurl", return_url);
				sParaTemp.put("pay_amount", price);
				sParaTemp.put("pay_md5sign", Sign);
				sParaTemp.put("pay_passcode", "1063");
				//sParaTemp.put("apikey", keys);
			
				try {
					String json = AlipaySubmit.buildRequest(sParaTemp, "get", "确认");
					response.setContentType("text/html");
					response.setCharacterEncoding("utf-8");
					PrintWriter out;
					out = response.getWriter();
					System.out.println(json);
					out.write(json);
					out.flush();
					out.close();
				} catch (IOException e) {
				}
	 }
	
	
	
	
	
	
	/**
	 * 支付宝notify_url
	 * @throws Exception 
	 */
	@RequestMapping(value = "/notify_url")
	public void notify_url(
			HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		
			//获取支付宝POST过来反馈信息
			Map<String,String> params = new HashMap<String,String>();
			/*Map requestParams = request.getParameterMap();
			for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
				//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
				//valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
				params.put(name, valueStr);
			}
		*/
			//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
			//商户订单号
	
			String out_trade_id = new String(request.getParameter("out_trade_id").getBytes("ISO-8859-1"),"UTF-8");
	
			//支付宝交易号
	
			String paymoney = new String(request.getParameter("paymoney").getBytes("ISO-8859-1"),"UTF-8");
	
			//交易状态
			String orderstatus = new String(request.getParameter("orderstatus").getBytes("ISO-8859-1"),"UTF-8");
			
			//交易状态
			String sign = new String(request.getParameter("sign").getBytes("ISO-8859-1"),"UTF-8");
	
			//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
	
			if(true){
	
	          PageData order = new PageData();
	          order.put("pay_statue","已付款");//支付时间
				
	          
			  System.out.println("=============success=============");
	          render(response, "application/json;charset=UTF-8", "success");
			
			}else{//验证失败
			  render(response, "application/json;charset=UTF-8", "fail");
			//out.println("fail");
		}
		
				
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
	
	
	
	
	
	
	
	/**
	 * 请求支付入口
	 * 
	 * @return
	 */
	@RequestMapping(value = "/upay")
	public  void upay(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		resp.setContentType("text/html; charset="+ DemoBase.encoding);
		
		//前台页面传过来的
		/*String merId = req.getParameter("merId");
		String txnAmt = req.getParameter("txnAmt");
		String orderId = req.getParameter("orderId");
		String txnTime = req.getParameter("txnTime");*/
		
		String merId = "777290058162167";
		String txnAmt = "1000";
		String orderId = "20180912102854";
		String txnTime = "20180912102859";
		
		
		Map<String, String> requestData = new HashMap<String, String>();
		
		/***银联全渠道系统，产品参数，除了encoding自行选择外其他不需修改***/
		requestData.put("version", DemoBase.version);   			  //版本号，全渠道默认值
		requestData.put("encoding", DemoBase.encoding); 			  //字符集编码，可以使用UTF-8,GBK两种方式
		requestData.put("signMethod", SDKConfig.getConfig().getSignMethod()); //签名方法
		requestData.put("txnType", "01");               			  //交易类型 ，01：消费
		requestData.put("txnSubType", "01");            			  //交易子类型， 01：自助消费
		requestData.put("bizType", "000201");           			  //业务类型，B2C网关支付，手机wap支付
		requestData.put("channelType", "07");           			  //渠道类型，这个字段区分B2C网关支付和手机wap支付；07：PC,平板  08：手机
		
		/***商户接入参数***/
		requestData.put("merId", merId);    	          			  //商户号码，请改成自己申请的正式商户号或者open上注册得来的777测试商户号
		requestData.put("accessType", "0");             			  //接入类型，0：直连商户 
		requestData.put("orderId",orderId);             //商户订单号，8-40位数字字母，不能含“-”或“_”，可以自行定制规则		
		requestData.put("txnTime", txnTime);        //订单发送时间，取系统时间，格式为YYYYMMDDhhmmss，必须取当前时间，否则会报txnTime无效
		requestData.put("currencyCode", "156");         			  //交易币种（境内商户一般是156 人民币）		
		requestData.put("txnAmt", txnAmt);             			      //交易金额，单位分，不要带小数点
		//requestData.put("reqReserved", "透传字段");        		      //请求方保留域，如需使用请启用即可；透传字段（可以实现商户自定义参数的追踪）本交易的后台通知,对本交易的交易状态查询交易、对账文件中均会原样返回，商户可以按需上传，长度为1-1024个字节。出现&={}[]符号时可能导致查询接口应答报文解析失败，建议尽量只传字母数字并使用|分割，或者可以最外层做一次base64编码(base64编码之后出现的等号不会导致解析失败可以不用管)。		
		
		requestData.put("riskRateInfo", "{commodityName=测试商品名称}");
		
		//前台通知地址 （需设置为外网能访问 http https均可），支付成功后的页面 点击“返回商户”按钮的时候将异步通知报文post到该地址
		//如果想要实现过几秒中自动跳转回商户页面权限，需联系银联业务申请开通自动返回商户权限
		//异步通知参数详见open.unionpay.com帮助中心 下载  产品接口规范  网关支付产品接口规范 消费交易 商户通知
		requestData.put("frontUrl", DemoBase.frontUrl);
		
		//后台通知地址（需设置为【外网】能访问 http https均可），支付成功后银联会自动将异步通知报文post到商户上送的该地址，失败的交易银联不会发送后台通知
		//后台通知参数详见open.unionpay.com帮助中心 下载  产品接口规范  网关支付产品接口规范 消费交易 商户通知
		//注意:1.需设置为外网能访问，否则收不到通知    2.http https均可  3.收单后台通知后需要10秒内返回http200或302状态码 
		//    4.如果银联通知服务器发送通知后10秒内未收到返回状态码或者应答码非http200，那么银联会间隔一段时间再次发送。总共发送5次，每次的间隔时间为0,1,2,4分钟。
		//    5.后台通知地址如果上送了带有？的参数，例如：http://abc/web?a=b&c=d 在后台通知处理程序验证签名之前需要编写逻辑将这些字段去掉再验签，否则将会验签失败
		requestData.put("backUrl", DemoBase.backUrl);

		// 订单超时时间。
		// 超过此时间后，除网银交易外，其他交易银联系统会拒绝受理，提示超时。 跳转银行网银交易如果超时后交易成功，会自动退款，大约5个工作日金额返还到持卡人账户。
		// 此时间建议取支付时的北京时间加15分钟。
		// 超过超时时间调查询接口应答origRespCode不是A6或者00的就可以判断为失败。
		requestData.put("payTimeout", new SimpleDateFormat("yyyyMMddHHmmss").format(new Date().getTime() + 15 * 60 * 1000));
		
		//////////////////////////////////////////////////
		//
		//       报文中特殊用法请查看 PCwap网关跳转支付特殊用法.txt
		//
		//////////////////////////////////////////////////
		
		/**请求参数设置完毕，以下对请求参数进行签名并生成html表单，将表单写入浏览器跳转打开银联页面**/
		Map<String, String> submitFromData = AcpService.sign(requestData,DemoBase.encoding);  //报文中certId,signature的值是在signData方法中获取并自动赋值的，只要证书配置正确即可。
		
		String requestFrontUrl = SDKConfig.getConfig().getFrontRequestUrl();  //获取请求银联的前台地址：对应属性文件acp_sdk.properties文件中的acpsdk.frontTransUrl
		String html = AcpService.createAutoFormHtml(requestFrontUrl, submitFromData,DemoBase.encoding);   //生成自动跳转的Html表单
		
		LogUtil.writeLog("打印请求HTML，此为请求报文，为联调排查问题的依据："+html);
		//将生成的html写到浏览器中完成自动跳转打开银联支付页面；这里调用signData之后，将html写到浏览器跳转到银联页面之前均不能对html中的表单项的名称和值进行修改，如果修改会导致验签不通过
		resp.getWriter().write(html);
	
		
		
	}
	
	
	
	

	// 获取会员信息
	public void getUserInfo(PageData pd) {
		try {
			PageData user = (PageData) this.getSession().getAttribute(Const.SESSION_WEBUSER);
			pd.put("user_id", user.getString("USER_ID"));
			pd.put("RIGHTS", user.getString("RIGHTS"));
			user = appuserApiService.findByUserid(pd);
			
			pd.put("moneys", user.get("moneys"));
			pd.put("PHONE", user.getString("PHONE"));
			pd.put("RIGHTS", user.getString("RIGHTS"));
			pd.put("USERNAME", user.getString("USERNAME"));
			pd.put("is_rz", user.get("is_rz"));
			//判断是否有币值
			PageData pds = tradeService.findByCountUser(pd);
			if (pds == null) {
				pd.put("counts",0);
			}else{
				pd.put("counts",pds.get("t_counts"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//判断是否超过资产总量
	public Boolean getDuMoney(PageData pd) {
		boolean tamp = false;
		BigDecimal prices = (BigDecimal) this.getSession().getAttribute(pd.get("coins_id"));
		Double price = prices.doubleValue();
		pd.put("price",price);
		Double t_counts = Double.parseDouble(pd.getString("t_counts"));
		double pt = price*t_counts;
		PageData user = (PageData) this.getSession().getAttribute(Const.SESSION_WEBUSER);
		pd.put("user_id", user.getString("USER_ID"));
		pd.put("pt", pt);
		try {
			user = appuserApiService.findByUserid(pd);
			BigDecimal  moneys =  (BigDecimal) user.get("moneys");
			if (pt<0) {
				tamp = true;
			}
			if (pt>moneys.doubleValue()) {
				tamp = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tamp;
	}
	

	//判断是否认证（设置交易密码）
	public Boolean isRz(PageData pd) {
		boolean tamp = false;
		PageData user = (PageData) this.getSession().getAttribute(Const.SESSION_WEBUSER);
		pd.put("user_id", user.getString("USER_ID"));
		pd.put("paypassword",  MD5.md5(pd.getString("paypassword")));
		try {
			PageData rz = appuserApiService.findByRz(pd);
			if (rz==null) {
				tamp = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tamp;
	}
	
	
	//判断是否超过资产总量（提现）
	 public Boolean getDuMoneyTx(PageData pd) {
			boolean tamp = false;
			double price = Double.parseDouble(pd.getString("tmoneys"));
			double rates = Double.parseDouble(Tools.readTxtFile(Const.BAOJING));//提現手续费比例
			PageData user = (PageData) this.getSession().getAttribute(Const.SESSION_WEBUSER);
			pd.put("user_id", user.getString("USER_ID"));
			pd.put("pt", price);
			pd.put("moneyss", price*(1-rates));
			pd.put("rates", rates);
			
			try {
				user = appuserApiService.findByUserid(pd);
				BigDecimal  moneys =  (BigDecimal) user.get("moneys");
				if (price<0) {
					tamp = true;
				}
				if (price>moneys.doubleValue()) {
					tamp = true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return tamp;
	}
	
	
	//判断是否超过币值总量
	public Boolean getDuBizhi(PageData pd) {
			boolean tamp = false;
			BigDecimal prices = (BigDecimal) this.getSession().getAttribute(pd.get("coins_id"));
			Double price = prices.doubleValue();
			pd.put("price",price);
			double t_counts = Double.parseDouble(pd.getString("t_counts"));//数量
			double rates = Double.parseDouble(Tools.readTxtFile(Const.TOPIC));//手续费比例
			double pt = (price*t_counts)*(1-rates);
			PageData user = (PageData) this.getSession().getAttribute(Const.SESSION_WEBUSER);
			pd.put("user_id", user.getString("USER_ID"));
			pd.put("pt", pt);
			pd.put("rates", rates);
			try {
				//判断是否有币值
				PageData pds = tradeService.findByCountUser(pd);
				if (pt<0) {
					tamp = true;
				}
				if (pds == null) {
					tamp = true;
					pd.put("counts",0);
				}else{
					BigDecimal  c =  (BigDecimal) pds.get("t_counts");
					if (t_counts>c.doubleValue()) {
						tamp = true;
					}
					pd.put("counts",pds.get("t_counts"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return tamp;
		}
	

	/**
	 * 后台登录页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admins")
	public ModelAndView admins() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); // 读取系统名称
		mv.setViewName("system/admin/login4");
		mv.addObject("pd", this.mapCopy(pd, new HashMap()));
		return mv;
	}

	/**
	 * 登录页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login")
	public ModelAndView login() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); // 读取系统名称
		
		mv.setViewName("login");
		mv.addObject("pd", this.mapCopy(pd, new HashMap()));
		return mv;
	}

	/**
	 * 登录接口
	 */
	@RequestMapping(value = "/login_s")
	@ResponseBody
	public Object login_s(HttpServletRequest request) {
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
	@RequestMapping(value = "/logout")
	@ResponseBody
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		try {
			logBefore(logger, "退出");
			this.getSession().removeAttribute(Const.SESSION_WEBUSER);
			//登陆过滤
			response.sendRedirect(request.getContextPath() + Const.WEB_LOGIN);
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
	

	/**
	 * 注册
	 * 
	 * @return
	 */
	@RequestMapping(value = "/register")
	public ModelAndView register() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); // 读取系统名称
		mv.setViewName("register");
		mv.addObject("pd", this.mapCopy(pd, new HashMap()));
		return mv;
	}
	
	

	/**
	 * 实名认证
	 * 
	 * @return
	 */
	@RequestMapping(value = "/yz_register_sm")
	public ModelAndView yz_register_sm() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); // 读取系统名称
		mv.setViewName("register1");
		mv.addObject("pd", this.mapCopy(pd, new HashMap()));
		return mv;
	}
	
	
	/**
	 * 实名认证提交
	 */
	@RequestMapping(value = "/yz_register_submit")
	@ResponseBody
	public Object yz_register_submit(HttpServletRequest request) {
		try {
			PageData pd = new PageData();
			pd = this.getPageData();
			logBefore(logger, "实名认证");
			//this.getUserInfo(pd);
			PageData user = (PageData) this.getSession().getAttribute(Const.SESSION_WEBUSER);
			pd.put("user_id", user.getString("USER_ID"));
			return appuserApiService.register1(pd, request);
		} catch (Exception e) {
			e.printStackTrace();
			return AppUtil.getResult(0, "认证异常", null);
		}
	}
	
	

	/**
	 * 注册接口
	 */
	@RequestMapping(value = "/register_save")
	@ResponseBody
	public Object register_save(HttpServletRequest request) {
		try {
			logBefore(logger, "注册");
			String Sms_Code = (String) request.getSession().getAttribute(Const.SESSION_SECURITY_SMS_CODE);
			String moble_verify = this.getPageData().getString("moble_verify");
			
			PageData ps = appuserApiService.findByEmail(this.getPageData());
			
			if (ps != null) {
				return AppUtil.getResult(0, "用戶名已注册，请换个！", null);
			}
		
			PageData pss = appuserApiService.findByPhone(this.getPageData());
			if (pss != null) {
				this.getSession().removeAttribute(Const.SESSION_SECURITY_SMS_CODE);
				return AppUtil.getResult(0, "该手机号已注册,请换个手机号！", null);
			}
			
			
			if (Sms_Code == null || moble_verify == null) {
				return AppUtil.getResult(0, "短信验证码不能为空", null);
			}
			
			if (Sms_Code == null || moble_verify == null) {
				return AppUtil.getResult(0, "短信验证码不能为空", null);
			}
			if (!Sms_Code.equals(moble_verify)) {
				return AppUtil.getResult(0, "短信验证码有误", null);
			}
			this.getSession().removeAttribute(Const.SESSION_SECURITY_SMS_CODE);
			return appuserApiService.register(this.getPageData(), request);
		} catch (Exception e) {
			e.printStackTrace();
			return AppUtil.getResult(0, "注册失败", null);
		}
	}

	/**
	 * 发送短信验证
	 * 
	 * @return
	 */
	@RequestMapping(value = "/sendSms")
	@ResponseBody
	public Object sendSms(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		try {
			String code = (String) getSession().getAttribute(Const.SESSION_SECURITY_CODE);
			if (code == null || pd.getString("code") == null) {
				return AppUtil.getResult(0, "验证码不能为空", null);
			}
			
			if (!code.equalsIgnoreCase(pd.getString("code"))) {
				return AppUtil.getResult(0, "输入验证码有误", null);
			}

			// 随机生成的动态码
			String dynamicCode = "" + (int) ((Math.random() * 9 + 1) * 100000);
			String msg = SendMsmUtil.send(pd.getString("PHONE"),
					"尊敬的用户，您的本次验证码是：" + dynamicCode + "，5分钟内有效，请勿告诉他人您的验证码。" + "【FTC】");
			if ("100".equals(msg)) {
				getSession().setAttribute(Const.SESSION_SECURITY_SMS_CODE, dynamicCode); // 获取session中的验证码
				System.out.println("验证码：" + dynamicCode);
				return AppUtil.getResult(1, "获取成功", map);
			} else {
				return AppUtil.getResult(0, "获取短信失败", map);
			}

		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			map.put("result", result);
			logAfter(logger);
		}
		return AppUtil.getResult(1, "获取成功", map);
	}

	/**
	 * @方法名: 首页
	 * @描述: TODO
	 * @return
	 * @返回类型: ModelAndView @修改人： @修改时间： @修改备注：
	 */
	@RequestMapping(value = "/index")
	public ModelAndView test() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			// 轮播管理
			List<Map> plist = picturesService.listAll(pd);
			// 资讯列表r
			List<Map> nlist = newsService.listAll(pd);
			// 币值列表
			List<Map> blist = coinsService.listAll(pd);
			
			mv.addObject("plist", plist);
			mv.addObject("nlist", nlist);
			mv.addObject("blist", blist);
			mv.addObject("pd", this.mapCopy(pd, new HashMap()));
			mv.setViewName("index1");   // 页面模板路径完整路径： /WEB-INF/html/test.html
										// （如有二级目录
										// mv.setViewName("member/index");）
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 资产明细
	 */
	@RequestMapping(value = "/yz_finance")
	public ModelAndView finance() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			this.getUserInfo(pd);
			mv.addObject("financeList", tradeService.listAllByCoin(pd));
			mv.addObject("pd", this.mapCopy(pd, new HashMap()));
			mv.setViewName("finance");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * (财务中心)提现
	 */
	@RequestMapping(value = "/yz_mytx")
	public ModelAndView mytx() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			this.getUserInfo(pd);
			mv.addObject("myBankList", banksService.listAll(pd));
			mv.addObject("pd", this.mapCopy(pd, new HashMap()));
			mv.setViewName("mytx");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * (财务中心)充值
	 */
	@RequestMapping(value = "/yz_mycz")
	public ModelAndView mycz() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			this.getUserInfo(pd);
			mv.addObject("pd", this.mapCopy(pd, new HashMap()));
			mv.setViewName("mycz");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	/**
	 * (财务中心)充值确认
	 */
	@RequestMapping(value = "/yz_mycz_next")
	public ModelAndView yz_mycz_next() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			
			
			pd.put("userName", Tools.readTxtFile(Const.userName));		
			pd.put("passWord", Tools.readTxtFile(Const.passWord));	
			pd.put("EMAIL", Tools.readTxtFile(Const.EMAIL));
			pd.put("SMS1", Tools.readTxtFile(Const.SMS1));
			
			// 随机生成的动态码
			String dynamicCode = "" + (int) ((Math.random() * 9 + 1) * 100000);
			pd.put("no", dynamicCode);
			mv.addObject("pd", this.mapCopy(pd, new HashMap()));
			mv.setViewName("mycz_next");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	
	/**
	 * (财务中心)充值提交
	 */
	@RequestMapping(value = "/yz_mycz_save")
	public ModelAndView yz_mycz_save() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			if (pd.getString("moneys")!=null) {
				PageData user = (PageData) this.getSession().getAttribute(Const.SESSION_WEBUSER);
				pd.put("user_id", user.getString("USER_ID"));
				pd.put("chongzhi_id", this.get32UUID());	//主键
				pd.put("statues", "审核中");	//状态
				pd.put("times", DateUtil.getTime());	//提交时间
				chongzhiService.save(pd);
			}
			
			mv.addObject("pd", this.mapCopy(pd, new HashMap()));
			mv.setViewName("mycz_next2");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	

	/**
	 * 个人中心
	 */
	@RequestMapping(value = "/yz_user")
	public ModelAndView user() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			this.getUserInfo(pd);
			mv.addObject("pd", this.mapCopy(pd, new HashMap()));
			mv.setViewName("user");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 交易中心
	 */
	@RequestMapping(value = "/trade")
	public ModelAndView trade() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			if (this.getSession().getAttribute(Const.SESSION_WEBUSER) == null) {
				pd.put("login_statue", "no");
			} else {
				this.getUserInfo(pd);// 获取会员信息
				pd.put("login_statue", "yes");
			}
			Page page = new Page();
			page.setShowCount(20);
			
			String dynamicCode = "" + (int) ((Math.random() * 9 + 1) * 10);
			
			String sjj = 0.01+dynamicCode;
			float sj = 0.01f+Float.parseFloat(sjj);
			pd.put("sj", sj);
			page.setPd(pd);
			mv.addObject("tradeList", tradeService.list1(page));
			mv.addObject("pd", this.mapCopy(pd, new HashMap()));
			mv.addObject("coins", coinsService.findById(pd));
			mv.setViewName("trade");
			
			//价格放入内存
			this.getSession().setAttribute(pd.getString("coins_id"), coinsService.findById(pd).get("money"));
			
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 买入
	 */
	@RequestMapping(value = "/yz_trade_save")
	@ResponseBody
	public Object yz_trade_save(HttpServletRequest request) {
		try {
			logBefore(logger, "买入");
			Map<String, Object> map = new HashMap<String, Object>();
			PageData pd = new PageData();
			pd = this.getPageData();
		
			if (this.isRz(pd)) {
				return AppUtil.getResult(0, "提交失败，您还未认证或交易密码有误！", map);
			}
			
			if (this.getDuMoney(pd)) {
				return AppUtil.getResult(0, "提交失败，余额不足请尽快充值", map);
			}
			
			this.getUserInfo(pd);
			pd.put("trade_id", this.get32UUID());
			pd.put("times", DateUtil.getTime());
			tradeService.save(pd);
			return AppUtil.getResult(1, "提交成功", map);
		} catch (Exception e) {
			e.printStackTrace();
			return AppUtil.getResult(0, "异常", null);
		}
	}
	
	
	/**
	 * 卖出
	 */
	@RequestMapping(value = "/yz_trade_maic")
	@ResponseBody
	public Object yz_trade_sell(HttpServletRequest request) {
		try {
			logBefore(logger, "卖出");
			Map<String, Object> map = new HashMap<String, Object>();
			PageData pd = new PageData();
			pd = this.getPageData();
		
			if (this.isRz(pd)) {
				return AppUtil.getResult(0, "提交失败，您还未认证或交易密码有误！", map);
			}
			
			if (this.getDuBizhi(pd)) {
				return AppUtil.getResult(0, "提交失败，币值不足", map);
			}
			
			this.getUserInfo(pd);
			pd.put("trade_id", this.get32UUID());
			pd.put("times", DateUtil.getTime());
			tradeService.saveMc(pd);
			return AppUtil.getResult(1, "提交成功", map);
		} catch (Exception e) {
			e.printStackTrace();
			return AppUtil.getResult(0, "异常", null);
		}
	}

	

	/**
	 * 成交记录
	 */
	@RequestMapping(value = "/yz_mycj")
	public ModelAndView mycj() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			this.getUserInfo(pd);
			mv.addObject("clist", coinsService.listAll(pd));
			mv.addObject("tlist", tradeService.listAllByUserId(pd));
			mv.addObject("pd", this.mapCopy(pd, new HashMap()));
			mv.setViewName("mycj");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 推荐用户
	 */
	@RequestMapping(value = "/yz_mytj")
	public ModelAndView mytj() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			this.getUserInfo(pd);
			mv.addObject("pd", this.mapCopy(pd, new HashMap()));
			mv.setViewName("mytj");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 我的推荐
	 */
	@RequestMapping(value = "/yz_mywd")
	public ModelAndView mywd() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			this.getUserInfo(pd);
			mv.addObject("myTjList", appuserService.listAllXUser(pd));
			mv.addObject("pd", this.mapCopy(pd, new HashMap()));
			mv.setViewName("mywd");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 我的奖励
	 */
	@RequestMapping(value = "/yz_myjp")
	public ModelAndView myjp() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			PageData user = (PageData) this.getSession().getAttribute(Const.SESSION_WEBUSER);
			pd.put("user_id", user.getString("RIGHTS"));
		    mv.addObject("rewardList", rewardService.listAll(pd));
			mv.addObject("pd", this.mapCopy(pd, new HashMap()));
			mv.setViewName("myjp");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 网站公告
	 */
	@RequestMapping(value = "/article")
	public ModelAndView article() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			// 资讯列表
			List<Map> nlist = newsService.listAll(pd);
			mv.addObject("nlist", nlist);
			mv.addObject("pd", this.mapCopy(pd, new HashMap()));
			mv.setViewName("article");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	
	/**
	 * 网站公告 详情
	 */
	@RequestMapping(value = "/article_detail")
	public ModelAndView article_detail() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			Map pds =newsService.findById(pd);
			mv.addObject("pd", this.mapCopy(pd, new HashMap()));
			mv.addObject("pds", pds);
			mv.setViewName("articleDetail");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	

	/**
	 * 实名认证
	 */
	@RequestMapping(value = "/realauth")
	public ModelAndView realauth() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		try {
			mv.addObject("pd", this.mapCopy(pd, new HashMap()));
			mv.setViewName("realauth");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	/**
	 * 实名认证
	 */
	@RequestMapping(value = "/setting")
	public ModelAndView setting() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.addObject("pd", this.mapCopy(pd, new HashMap()));
			mv.setViewName("setting");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	/**
	 * 手机修改
	 */
	@RequestMapping(value = "/yz_moble")
	public ModelAndView moble() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			this.getUserInfo(pd);
			mv.addObject("pd", this.mapCopy(pd, new HashMap()));
			mv.setViewName("moble");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	
	/**
	 * 修改手机
	 */
	@RequestMapping(value = "/yz_moble_save")
	@ResponseBody
	public Object yz_moble_save(HttpServletRequest request) {
		try {
			logBefore(logger, "修改手机");
			Map<String, Object> map = new HashMap<String, Object>();
			PageData pd = new PageData();
			pd = this.getPageData();
		
			String Sms_Code = (String) request.getSession().getAttribute(Const.SESSION_SECURITY_SMS_CODE);
			String moble_verify = this.getPageData().getString("moble_verify");
			if (Sms_Code == null || moble_verify == null) {
				return AppUtil.getResult(0, "短信验证码有误", null);
			}
			if (!Sms_Code.equals(moble_verify)) {
				return AppUtil.getResult(0, "短信验证码有误", null);
			}
			this.getSession().removeAttribute(Const.SESSION_SECURITY_SMS_CODE);
			this.getUserInfo(pd);
		
			appuserService.editU4(pd);
			
			return AppUtil.getResult(1, "修改成功", map);
		} catch (Exception e) {
			e.printStackTrace();
			return AppUtil.getResult(0, "异常", null);
		}
	}
	
	
	/**
	 * 修改密码
	 */
	@RequestMapping(value = "/yz_pw_save")
	@ResponseBody
	public Object yz_pw_save(HttpServletRequest request) {
		try {
			logBefore(logger, "修改密码");
			Map<String, Object> map = new HashMap<String, Object>();
			PageData pd = new PageData();
			pd = this.getPageData();
		
			String Sms_Code = (String) request.getSession().getAttribute(Const.SESSION_SECURITY_SMS_CODE);
			String moble_verify = this.getPageData().getString("moble_verify");
			if (Sms_Code == null || moble_verify == null) {
				return AppUtil.getResult(0, "短信验证码有误", null);
			}
			if (!Sms_Code.equals(moble_verify)) {
				return AppUtil.getResult(0, "短信验证码有误", null);
			}
			this.getSession().removeAttribute(Const.SESSION_SECURITY_SMS_CODE);
			this.getUserInfo(pd);
		
			pd.put("PASSWORD", MD5.md5(pd.getString("PASSWORD")));
			
			appuserService.editU5(pd);
			
			return AppUtil.getResult(1, "修改成功", map);
		} catch (Exception e) {
			e.printStackTrace();
			return AppUtil.getResult(0, "异常", null);
		}
	}
	
	
	/**
	 * 修改交易密码
	 */
	@RequestMapping(value = "/yz_pww_save")
	@ResponseBody
	public Object yz_pww_save(HttpServletRequest request) {
		try {
			logBefore(logger, "修改手机");
			Map<String, Object> map = new HashMap<String, Object>();
			PageData pd = new PageData();
			pd = this.getPageData();
		
			String Sms_Code = (String) request.getSession().getAttribute(Const.SESSION_SECURITY_SMS_CODE);
			String moble_verify = this.getPageData().getString("moble_verify");
			if (Sms_Code == null || moble_verify == null) {
				return AppUtil.getResult(0, "短信验证码有误", null);
			}
			if (!Sms_Code.equals(moble_verify)) {
				return AppUtil.getResult(0, "短信验证码有误", null);
			}
			this.getSession().removeAttribute(Const.SESSION_SECURITY_SMS_CODE);
			this.getUserInfo(pd);
		
			pd.put("PASSWORD2", MD5.md5(pd.getString("PAYPASSWORD")));
			appuserService.editU6(pd);
			
			return AppUtil.getResult(1, "修改成功", map);
		} catch (Exception e) {
			e.printStackTrace();
			return AppUtil.getResult(0, "异常", null);
		}
	}
	
	
	
	
	/**
	 * 银行卡号
	 */
	@RequestMapping(value = "/bank")
	public ModelAndView bank() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			PageData user = (PageData) this.getSession().getAttribute(Const.SESSION_WEBUSER);
			pd.put("user_id", user.getString("USER_ID"));
			mv.addObject("myBankList", banksService.listAll(pd));
			mv.addObject("pd", this.mapCopy(pd, new HashMap()));
			mv.setViewName("bank");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	/**
	 * 登录密码
	 */
	@RequestMapping(value = "/yz_password")
	public ModelAndView password() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.addObject("pd", this.mapCopy(pd, new HashMap()));
			mv.setViewName("password");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	/**
	 * 交易密码
	 */
	@RequestMapping(value = "/yz_paypassword")
	public ModelAndView paypassword() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.addObject("pd", this.mapCopy(pd, new HashMap()));
			mv.setViewName("paypassword");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	

	/**
	 * 充值記錄
	 */
	@RequestMapping(value = "/yz_myjl")
	public ModelAndView yz_myjl() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			PageData user = (PageData) this.getSession().getAttribute(Const.SESSION_WEBUSER);
			pd.put("user_id", user.getString("USER_ID"));
			mv.addObject("clist", chongzhiService.listAll(pd));
			mv.addObject("pd", this.mapCopy(pd, new HashMap()));
			mv.setViewName("myjl2");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	
	
	/**
	 * 提现
	 */
	@RequestMapping(value = "/yz_tx_save")
	@ResponseBody
	public Object yz_tx_save(HttpServletRequest request) {
		try {
			logBefore(logger, "提现");
			Map<String, Object> map = new HashMap<String, Object>();
			PageData pd = new PageData();
			pd = this.getPageData();
		
			String Sms_Code = (String) request.getSession().getAttribute(Const.SESSION_SECURITY_SMS_CODE);
			String moble_verify = this.getPageData().getString("moble_verify");
			if (Sms_Code == null || moble_verify == null) {
				return AppUtil.getResult(0, "短信验证码有误", null);
			}
			if (!Sms_Code.equals(moble_verify)) {
				return AppUtil.getResult(0, "短信验证码有误", null);
			}
			this.getSession().removeAttribute(Const.SESSION_SECURITY_SMS_CODE);
			if (this.getDuMoneyTx(pd)) {
				return AppUtil.getResult(0, "提交失败，超出余额", map);
			}
		
			this.getUserInfo(pd);
			pd.put("tixian_id", this.get32UUID());	//主键
			pd.put("times", DateUtil.getTime());
			tixianService.save(pd);
			return AppUtil.getResult(1, "已提交申请，请耐心等待", map);
		} catch (Exception e) {
			e.printStackTrace();
			return AppUtil.getResult(0, "异常", null);
		}
	}
	
	
	
	/**
	 * 添加银行卡
	 */
	@RequestMapping(value = "/yz_add_bank")
	@ResponseBody
	public Object yz_add_bank(HttpServletRequest request) {
		try {
			logBefore(logger, "添加银行卡");
			Map<String, Object> map = new HashMap<String, Object>();
			PageData pd = new PageData();
			pd = this.getPageData();
			PageData user = (PageData) this.getSession().getAttribute(Const.SESSION_WEBUSER);
			pd.put("user_id", user.getString("USER_ID"));
			pd.put("banks_id", this.get32UUID());	//主键
			pd.put("times", DateUtil.getTime());	//创建时间
			banksService.save(pd);
			return AppUtil.getResult(1, "添加成功", map);
		} catch (Exception e) {
			e.printStackTrace();
			return AppUtil.getResult(0, "异常", null);
		}
	}

	
	
	/**
	 * 提现记录
	 */
	@RequestMapping(value = "/yz_txRecordList")
	public ModelAndView yz_txRecordList() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			PageData user = (PageData) this.getSession().getAttribute(Const.SESSION_WEBUSER);
			pd.put("user_id", user.getString("USER_ID"));
			mv.addObject("myTxList", tixianService.listAll(pd));
			mv.addObject("pd", this.mapCopy(pd, new HashMap()));
			mv.setViewName("myjl");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	
	
	
	@Resource(name="banksService")
	private BanksService banksService;
}
