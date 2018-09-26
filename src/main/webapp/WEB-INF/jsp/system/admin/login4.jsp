<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
%>

<!DOCTYPE html >
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<title>登陆</title>
<link href="<%=basePath%>static/loginkj/css/bootstrap.min.css" title="" rel="stylesheet" />
<link title="orange" href="<%=basePath%>static/loginkj/css/login.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=basePath%>static/js/jquery-1.5.1.min.js"></script>
</head>

<body>
  
  <div style="height:1px;"></div>
  <div class="login">
     <header>
	    <h1>数字货币【LKB】后台管理中心</h1>
	 </header>
	 <div class="sr">
	   
		    <div class="name">
				<label>
				<i class="sublist-icon glyphicon glyphicon-user"></i>
				</label>
				<input type="text" name="loginname" id="loginname"  placeholder="这里输入登录名" class="name_inp">
			</div>
			 <div class="name">
				<label>
				<i class="sublist-icon glyphicon glyphicon-pencil"></i>
				</label>
				<input type="password" name="password" id="password"  placeholder="这里输入登录密码" class="name_inp">
			</div>
			<button onclick="severCheck();"  class="dl">登陆</button>
	
	 </div>
  </div>

<script type="text/javascript">
	
		//服务器校验
		function severCheck(){
			if(true){
				
				var loginname = $("#loginname").val();
				var password = $("#password").val();
				var code = "qq313596790fh"+loginname+",fh,"+password+"QQ978336446fh"+",fh,"+$("#code").val();
				$.ajax({
					type: "POST",
					url: '<%=basePath%>login_login',
			    	data: {KEYDATA:code,tm:new Date().getTime()},
					dataType:'json',
					cache: false,
					success: function(data){
						if("success" == data.result){
							saveCookie();
							window.location.href="<%=basePath%>adminInfo/lkb";
						}else if("usererror" == data.result){
							 alert("用户名或密码有误");
							
						}else if("codeerror" == data.result){
							
						}else{
							
						}
					}
				});
			}
		}
	
		$(document).ready(function() {
			changeCode();
			$("#codeImg").bind("click", changeCode);
		});

		$(document).keyup(function(event) {
			if (event.keyCode == 13) {
				$("#to-recover").trigger("click");
			}
		});

		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}

		function changeCode() {
			$("#codeImg").attr("src", "code.do?t=" + genTimestamp());
		}

		//客户端校验
		function check() {

			if ($("#loginname").val() == "") {

				$("#loginname").tips({
					side : 2,
					msg : '用户名不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#loginname").focus();
				return false;
			} else {
				$("#loginname").val(jQuery.trim($('#loginname').val()));
			}

			if ($("#password").val() == "") {

				$("#password").tips({
					side : 2,
					msg : '密码不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#password").focus();
				return false;
			}
			if ($("#code").val() == "") {

				$("#code").tips({
					side : 1,
					msg : '验证码不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#code").focus();
				return false;
			}

			$("#loginbox").tips({
				side : 1,
				msg : '正在登录 , 请稍后 ...',
				bg : '#68B500',
				time : 10
			});

			return true;
		}

		function savePaw() {
			if (!$("#saveid").attr("checked")) {
				$.cookie('loginname', '', {
					expires : -1
				});
				$.cookie('password', '', {
					expires : -1
				});
				$("#loginname").val('');
				$("#password").val('');
			}
		}

		function saveCookie() {
			if ($("#saveid").attr("checked")) {
				$.cookie('loginname', $("#loginname").val(), {
					expires : 7
				});
				$.cookie('password', $("#password").val(), {
					expires : 7
				});
			}
		}
		function quxiao() {
			$("#loginname").val('');
			$("#password").val('');
		}
		
		jQuery(function() {
			var loginname = $.cookie('loginname');
			var password = $.cookie('password');
			if (typeof(loginname) != "undefined"
					&& typeof(password) != "undefined") {
				$("#loginname").val(loginname);
				$("#password").val(password);
				$("#saveid").attr("checked", true);
				$("#code").focus();
			}
		});
	</script>
</body>
</html>
