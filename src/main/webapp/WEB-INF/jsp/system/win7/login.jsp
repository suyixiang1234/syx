<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta charset="utf-8" />
		<title>login</title>
		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="renderer" content="webkit">
		<!-- basic styles -->
		<link href="static/UI_win7/css/bt.css" rel="stylesheet" />
			<!-- <link href="http://www.eakroko.de/neat/css/jquery.fancybox.css" rel="stylesheet" /> -->
		<link href="static/UI_win7/css/login2.css" rel="stylesheet" />
	
		<script type="text/javascript" src="static/UI_win7/lib/jquery/jquery-1.8.0.min.js"></script>
		<script type="text/javascript" src="static/UI_win7/lib/jquery/plug/jquery.placeholder.js"></script>
		<script src="static/UI_win7/js/login.js"></script>
		
		
	  	<script>
    	 var yz = "yes";
	 	</script> 
	 
	  	<style>
	  
	    .login_body {
		    background: url(http://www.eakroko.de/neat/img/bg2.png) repeat;
		}
	  
		body {
			background-color: #FEFEFE;
		}
		
		/* .wrap {
			width: 960px;
			margin: 100px auto;
			font-size: 125%;
		}
		
		.row {
			margin: 30px 0;
		} */
	    </style>
		
		<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
  		<script src="//code.jquery.com/jquery-1.9.1.js"></script>
  		<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
  		<link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">
		
		</head>
		<body class="login_body">
	
					<div class="wrap">
						<h2>欢迎进入5188社区</h2>
						<h4>Welcome to the login 5188</h4>
						<form action="#" autocomplete="off" method="post" class="validate" novalidate="novalidate"   name="loginForm" id="loginForm">
						<div class="alert alert-error">
							<strong>注 ! </strong>请认真输入您的账户和密码.
						</div>
						<div class="login">
							<div class="email">
								<label for="user">账户：</label><div class="email-input"><div class="control-group"><div class="input-prepend"><span class="add-on"><i class="icon-envelope"></i></span><input type="text" name="loginname" id="loginname" class="{required:true}"></div></div></div>
							</div>
							<div class="pw">
								<label for="pw">密码：</label><div class="pw-input"><div class="control-group"><div class="input-prepend"><span class="add-on"><i class="icon-lock"></i></span><input type="password"  name="password" id="password" class="{required:true}"></div></div></div>
							</div>
							<div class="remember">
								<label class="checkbox">
									-确认输入无误后点击如下登入按钮-
								</label>
							</div>
						</div>
						<div class="submit">
						<!-- 	<a href="#">Lost password?</a> -->
							<a class="btn btn-red5"   id="to-recover">登入</a>
						</div>
						<div class="login social">
							<div class="btn-row">
								<a href="#" class="btn btn-social btn-twitter"><img src="img/twitter.png" alt="">Sign in with Twitter</a>
								<a href="#" class="btn btn-social btn-fb"><img src="img/facebook.png" alt="">Sign in with Facebook</a>
							</div>
							<div class="btn-row">
								<a href="#" class="btn btn-social btn-dr"><img src="img/dribble.png" alt="">Sign in with Dribble</a>
								<a href="#" class="btn btn-social btn-fo"><img src="img/forrst.png" alt="">Sign in with Forrst</a>
							</div>
						</div>
						<input type="hidden" name="language" id="language" value="0" placeholder="account">
						<input type="hidden" name="code" id="code" value="000" placeholder="account">
						
						<div class="gt_input">
							<input type="hidden" class="challenge"  name="geetest_challenge">
							<input type="hidden" class="validate" name="geetest_validate">
							<input type="hidden" class="seccode" name="geetest_seccode">
						</div>
						
						</form>
						<div id="dialog"  style="z-index:9999">
							<div id="captcha"></div>
						</div>
						
						<div class="social-shadow-hider"></div>
						<div class="social-toggle">
							<a href="#" class="toggle-social">由@5188提供技术支持 <b class="caret"></b></a>
						</div>
					</div>
  
				<!-- 
				<div class="base-bg">
					<img src="static/hplus/img/login-background.jpg">
				</div> 
				-->
 
 			<script src="http://static.geetest.com/static/tools/gt.js"></script>
 
 			<script type="text/javascript">
 			 $(function(){
			 $("#to-recover").click(function(){
			 $("#captcha").empty();
		  	var handler = function (captchaObj) {
		         // 将验证码加到id为captcha的元素里
		         captchaObj.appendTo("#captcha");
		     };
		    $.ajax({
		        // 获取id，challenge，success（是否启用failback）
		        url: "appuser/StartCaptchaServlet",
		        type: "get",
		        dataType: "json", // 使用jsonp格式
		        success: function (data) {
		            // 使用initGeetest接口
		            // 参数1：配置参数，与创建Geetest实例时接受的参数一致
		            // 参数2：回调，回调的第一个参数验证码对象，之后可以使用它做appendTo之类的事件
		            initGeetest({
		                gt: data.gt,
		                challenge: data.challenge,
		                product: "embed", // 产品形式
		                offline: !data.success
		            }, handler);
		        }
		    });
		    
		    
			$("#dialog").dialog({
		        autoOpen: true,   
		        modal: true,      
				width:344,
				height:325,
				title:'请先完成下方验证',
				
				buttons: {
					"确定": function() {
						$(".challenge").attr("value",$(".geetest_challenge").val());
						$(".validate").attr("value",$(".geetest_validate").val());
						$(".seccode").attr("value",$(".geetest_seccode").val()); 
						$( this ).dialog( "close" );
						severCheck();
						//$("#form").submit();
				},
								
					"取消": function() {
						$( this ).dialog( "close" );
							}
						}
			});
	 })
 })
</script>
 
 
 

	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
	
	<%--
	<div id="ind_video" closerate="4" playrate="-2" style="position: fixed;_position: absolute;text-align: left;overflow: visible;bottom :0;left:0;display:block; z-index:999;"><div id="dyb_loadding_3" style="position: absolute; top: 206px; left: 0px; width: 100%; text-align: center; display: none;"><img src="http://img.daiyanbao.com/img/loadding.gif"><br><span style="font-family:'Microsoft YaHei',SimHei,FangSong; font-size:16px;color:#5e5e5e;text-decoration: none;"><a href="http://www.daiyanbao.com/" target="_blank" style="font-family:'Microsoft YaHei',SimHei,FangSong; font-size:16px;color:#5e5e5e;text-decoration: none;">代言宝</a>加载中</span></div><div id="dyb_sub_3"></div><object type="application/x-shockwave-flash" data="//res.daiyanbao.com/flash/md1_1_3.swf?v=1_1_3&amp;i=3&amp;a=admin&amp;b=dyb%2F20141023daoyanbao.com-home&amp;c=288&amp;d=480&amp;cs_e=64&amp;cs_f=0.7&amp;cs_g=0&amp;cs_h=-10" width="288" height="480" id="dyb_content_3"><param name="flashvars" value="i=3&amp;a=admin&amp;b=dyb%2F20141023daoyanbao.com-home&amp;c=288&amp;d=480&amp;cs_e=64&amp;cs_f=0.7&amp;cs_g=0&amp;cs_h=-10"><param name="wmode" value="Transparent"><param name="allowScriptAccess" value="always"></object><div id="dyb_close_3" style="position: absolute; bottom: 0px; right: 0px; width: 80px; height: 36px; text-align: center; font-size: 12px; font-family: 'Microsoft YaHei', SimHei, FangSong; color: rgb(94, 94, 94); cursor: pointer;">关闭X</div></div>
	--%>
	</body>
</html>
