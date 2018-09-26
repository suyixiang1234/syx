<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<html >
	<head>
		<meta charset="utf-8" />
		<title>login</title>
		<meta name="description" content="User login page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- basic styles -->
		<link href="static/UI_new/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/UI_new/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/UI_new/css/font-awesome.min.css" />
		<link rel="stylesheet" href="static/login/bootstrap.min.css" />
		<link rel="stylesheet" href="static/login/css/camera.css" />
		<link rel="stylesheet" href="static/login/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="static/login/matrix-login.css" />
		<link href="static/login/font-awesome.css" rel="stylesheet" />
		
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/UI_ne/css/chosen.css" />
		<link rel="stylesheet" href="static/UI_ne/css/ace.min.css" />
		<link rel="stylesheet" href="static/UI_ne/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/UI_ne/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/UI_ne/js/jquery-1.7.2.js"></script>
		
		<script type="text/javascript" src="static/js/jquery-1.5.1.min.js"></script>
		<!--[if IE 7]>
		  <link rel="stylesheet" href="css/font-awesome-ie7.min.css" />
		<![endif]-->
		<!-- page specific plugin styles -->
		
		<!-- ace styles -->
		<link rel="stylesheet" href="static/UI_new/css/ace.min.css" />
		<link rel="stylesheet" href="static/UI_new/css/ace-responsive.min.css" />
		<!--[if lt IE 9]>
		  <link rel="stylesheet" href="css/ace-ie.min.css" />
		<![endif]-->
	</head>
	<body class="login-layout" style="background-image:url(static/login/images/bg2.jpg);background-size:cover; background-repeat:repeat-x">
	
		<div class="container-fluid" id="main-container">
			<div id="main-content">
				<div class="row-fluid">
					<div class="span12">
						
<div class="login-container">
<div class="row-fluid">
	<div class="center">
		<h1><i class="icon-leaf green"></i> <span class="red"></span> <span class="white">system</span></h1>
		<h4 class="blue">&copy; Company Name</h4>
	</div>
</div>
<div class="space-6"></div>
<div class="row-fluid">
<div class="position-relative">
	<div id="login-box" style="position: absolute;background: #fff;opacity:0.8;" class="visible widget-box no-border">
		<div class="widget-body">
		 <div class="widget-main">
			<h4 class="header lighter bigger"><i class="icon-coffee green"></i>请输入账户和密码</h4>
			<div class="space-6"></div>
			<form action="" method="post" name="loginForm"
				id="loginForm">
				 <fieldset>
					<label>
						<span class="block input-icon input-icon-right">
							<input type="text" class="span12" 	name="loginname" id="loginname" value=""
								placeholder="请输入用户名"/>
							<i class="icon-user"></i>
						</span>
					</label>
					<label>
						<span class="block input-icon input-icon-right">
							<input type="password" class="span12" name="password" id="password" placeholder="请输入密码"
								value=""  />
							<i class="icon-lock"></i>
						</span>
					</label>
					
					<label>
							<div style="float: left;">
							<i><img  style="height:30px;widht:30px"  src="static/login/yan.png" /></i>
						    </div>
							<div style="float: left;" class="codediv">
								<input type="text" name="code" id="code" class="span12"
									style="height:16px; padding-top:0px;" />
							</div>
							<div style="float: left;">
								<i><img style="height:31px;" id="codeImg" alt="点击更换"
									title="点击更换" src="" /></i>
							</div>
					</label>
						
						<label >
							<input  name="form-field-checkbox" id="saveid" type="checkbox"
							onclick="savePaw();" style="padding-top:0px;">
							<span class="lbl"> 记住密码</span>
						</label>
					<div class="row-fluid">
				</p>
						<a onclick="severCheck();"><button onclick="return false;" class="span4 btn btn-small btn-primary"><i class="icon-key"></i>
						<font color="#fff">登录</font></button></a>
					</div>
					<div class="space">
					</div>
				  </fieldset>
			</form>
		 </div><!--/widget-main-->
		
		 <div class="toolbar clearfix">
			<div>
				<a href="#" onclick="show_box2('forgot-box'); return false;" class="forgot-password-link"><i class="icon-arrow-left"></i>忘记密码</a>
			</div>
			<div>
				<a href="#" onclick="show_box('signup-box'); return false;" class="user-signup-link">注册会员 <i class="icon-arrow-right"></i></a>
			</div>
		 </div>
		</div><!--/widget-body-->
	</div><!--/login-box-->
	
	<div id="forgot-box" style="position: absolute;background: #fff;opacity:0.85;" class="widget-box no-border" >
		<div class="widget-body">
		 <div class="widget-main">
			<h4 class="header red lighter bigger"><i class="icon-key"></i>请输入以下验证，重置密码</h4>
			<div class="space-6"></div>
			<p>
				输入以下相应的信息
			</p>
			<form>
				 <fieldset>
				    <label>
						<span class="block input-icon input-icon-right">
							<input type="text"  name="USERNAME" id="acountName" class="span12" placeholder="请输入账户名" />
							<i class="icon-user"></i>
						</span>
					</label>
					
					<label>
					<span class="block input-icon input-icon-right">
					<select  name="quests" id="quests" data-placeholder="" style="width: 303px;">
								<option value="">请选择设置的密保问题</option>
								<option value="您的出生地">您的出生地</option>
								<option value="父亲名字">父亲名字</option>
								<option value="母亲名字">母亲名字</option>
								<option value="您父亲的生日">您父亲的生日</option>
								<option value="您母亲的生日">您母亲的生日</option>
								<option value="记忆最深刻的一个人">记忆最深刻的一个人</option>
					</select>
					</span>
					</label>
			         <label>
						<span class="block input-icon input-icon-right">
							<input type="text" class="span12" name="questsa" id="questsa" placeholder="请输入密保答案" />
							<i class="icon-unlock"></i>
						</span>
					</label>
					
					<label>
						<span class="block input-icon input-icon-right">
							<input type="password" name="pwd0" id="pwd0" class="span12" placeholder="重置密码" />
							<i class="icon-lock"></i>
						</span>
					</label>
					<label>
						<span class="block input-icon input-icon-right">
							<input type="password" name="pwd1" id="pwd1" class="span12" placeholder="确认密码" />
							<i class="icon-retweet"></i>
						</span>
					</label>
							<label>
							<div style="float: left;">
							<i><img  style="height:30px;widht:30px"  src="static/login/yan.png" /></i>
						    </div>
							<div style="float: left;" class="codediv">
								<input type="text" name="code" id="code2" class="span12"
									style="height:16px; padding-top:0px;" />
							</div>
							<div style="float: left;">
								<i><img style="height:31px;" id="codeImg2" alt="点击更换"
									title="点击更换" src="" /></i>
							</div>
					</label>
					<div class="row-fluid">
						<a onclick="editPassword();">	<button onclick="return false;" class="span5 offset7 btn btn-small btn-danger"><i class="icon-lightbulb"></i> 提交</button></a
					</div>
				  </fieldset>
			</form>
		 </div><!--/widget-main-->
		 <div class="toolbar center">
			<a href="#" onclick="show_box1('login-box'); return false;" class="back-to-login-link">返回登录页 <i class="icon-arrow-right"></i></a>
		 </div>
		</div><!--/widget-body-->
	</div><!--/forgot-box-->
	
	<div id="signup-box" style="position: absolute;background: #fff;opacity:0.85;" class="widget-box no-border" >
		<div class="widget-body">
		 <div class="widget-main">
			<h4 class="header green lighter bigger"><i class="icon-group blue"></i>会员注册页</h4>
			<div class="space-6"></div>
			<p>
				输入注册详细信息:
			</p>
			<form action="" name="RegisterUserForm" id="RegisterUserForm" method="post">
			<input type="hidden" name="USER_ID" id="user_id" value=""/>
			<input type="hidden" name="ROLE_ID" id="role_id" value="0b4ec5a911144b72ba48afec4d33e79b"/>
			<input type="hidden" name="NUMBER" id="NUMBER" value="12"/>
				 <fieldset >
					<label>
						<span class="block input-icon input-icon-right">
							<input type="text"  name="USERNAME" id="loginname" class="span12" placeholder="账户" />
							<i class="icon-user"></i>
						</span>
					</label>
					<label>
						<span class="block input-icon input-icon-right">
							<input type="password" name="PASSWORD" id="passwords" onBlur="yanzPassword()"  class="span12" placeholder="登录密码" />
							<i class="icon-lock"></i>
						</span>
					</label>
					<label>
						<span class="block input-icon input-icon-right">
							<input type="password" name="chkpwd" id="chkpwd" onBlur="yanPassword()" class="span12" placeholder="确认登录密码" />
							<i class="icon-retweet"></i>
						</span>
					</label>
					
					<label>
						<span class="block input-icon input-icon-right">
							<input type="password"  name="pwd2" id="password2"  onBlur="yanzPassword1()" class="span12" minlength="6" placeholder="二级密码" />
							<i class="icon-lock"></i> 
						</span>
					</label>
					
					<label>
						<span class="block input-icon input-icon-right">
							<input type="password" name="chkpwd2" id="chkpwd2" onBlur="yanPassword2()"  minlength="6" class="span12" placeholder="确认二级密码" />
							<i class="icon-retweet"></i>
						</span>
					</label>
					
					<label>
					
					<span class="block input-icon input-icon-right">
					<select  name="mbq" id="mbq" data-placeholder="请选择密保问题" style="width: 303px;">
							<option value="">--请选择密保问题--</option>
							
								<option  value="您的出生地">您的出生地</option>
							
								<option value="父亲名字">父亲名字</option>
							
								<option value="母亲名字">母亲名字</option>
							
								<option value="您父亲的生">您父亲的生日</option>
								
								<option value="您母亲的生日">您母亲的生日</option>
							
								<option value="记忆最深刻的一个人">记忆最深刻的一个人</option>
							
						</select>
<!-- 						<input type="text"  class="span12" name="mbq" placeholder="设置密保问题" /> -->
<!-- 						<i class="icon-edit"></i> -->
					</span>
				
					</label>
					
					<label>
						<span class="block input-icon input-icon-right">
							<input type="text" class="span12" name="mba" id="mba" placeholder="设置密保答案" />
							<i class="icon-unlock"></i>
						</span>
					</label>
					
					<label>
						<span class="block input-icon input-icon-right">
							<input type="email" name="NAME" id="NAME" class="span12" placeholder="姓名" />
							<i class="icon-envelope"></i>
						</span>
					</label>
					
					<label>
						<span class="block input-icon input-icon-right">
							<input type="email" name="EMAIL" id="EMAIL" class="span12" placeholder="输入邮箱" />
							<i class="icon-envelope"></i>
						</span>
					</label>
					
					<label>
						<span class="block input-icon input-icon-right">
							<input  type="text"  name="PHONE" id="PHONE" class="span12" placeholder="输入手机号" />
							<i class="icon-envelope"></i>
						</span>
					</label>
				
					<label>
						<span class="block input-icon input-icon-right">
							<input type="text" class="span12"  name="bankname" id="bankname"  placeholder="请输入户名" />
							<i class="icon-group"></i>
						</span>
					</label>
					
					<label>
						<span class="block input-icon input-icon-right">
							<input type="text" class="span12"  name="bank" id="bank"  placeholder="开户行地址" />
							<i class="icon-group"></i>
						</span>
					</label>
					
					<label>
						<span class="block input-icon input-icon-right">
							<input type="text"  class="span12" name="bankc" id="bankc" placeholder="银行卡号" />
							<i class="icon-barcode"></i>
						</span>
					</label>
					
					<label>
						<span class="block input-icon input-icon-right">
							<input type="text"  class="span12" name="zfb" id="zfb" placeholder="支付宝号" />
							<i class="icon-barcode"></i>
						</span>
					</label><%--
				
					
					<label>
						<select  name="bank" id="bank" data-placeholder="请选择职位" style="width: 303px;">
							<option value="">--请选择机构--</option>
							
								<option value="建设银行">建设银行</option>
							
								<option value="农业银行">农业银行</option>
							
								<option value="中国银行">中国银行</option>
							
								<option value="工商银行">工商银行</option>
								
								<option value="招商银行">招商银行</option>
							
								<option value="支付宝">支付宝</option>
							
						</select>

					</label>
					
					--%><label>
							<div style="float: left;">
							<i><img  style="height:30px;widht:30px"  src="static/login/yan.png" /></i>
						    </div>
							<div style="float: left;" class="codediv">
								<input type="text" name="code" id="code1" class="span12"
									style="height:16px; padding-top:0px;" />
							</div>
							<div style="float: left;">
								<i><img style="height:31px;" id="codeImg1" alt="点击更换"
									title="点击更换" src="" /></i>
							</div>
					</label>
					
					<label>
						<input type="checkbox"><span class="lbl"> I accept the <a href="#">User Agreement</a></span>
					</label>
					
					<div class="space-24"></div>
					<div class="row-fluid">
						<button type="reset" class="span6 btn btn-small"><i class="icon-refresh"></i>重置</button>
						<button type="button" class="span6 btn btn-small btn-success"  onclick="register()">注册 <i class="icon-arrow-right icon-on-right"></i></button>
					</div>
				  </fieldset>
			</form>
		</div>
		<div class="toolbar center">
			<a href="#" onclick="show_box1('login-box'); return false;" class="back-to-login-link"><i class="icon-arrow-left"></i> 返回登录页</a>
		</div>
	 </div><!--/widget-body-->
	</div><!--/signup-box-->
</div><!--/position-relative-->
</div>
</div>
					</div><!--/span-->
				</div><!--/row-->
			</div>
		</div><!--/.fluid-container-->
		<!-- basic scripts -->
		<script src="static/UI_new/1.9.1/jquery.min.js"></script>
		<script type="text/javascript">
		window.jQuery || document.write("<script src='static/UI_new/js/jquery-1.9.1.min.js'>\x3C/script>");
		</script>
		<!-- page specific plugin scripts -->
		<script type="text/javascript">
		function yanzPassword(){
		if($("#passwords").val().length < 6){
						$("#passwords").tips({
							side:3,
				            msg:'密码位数必须大于6',
				            bg:'#FF5080',
				            time:2
				        });
				 		$("#passwords").focus();
				 }
		}
		function yanzPassword1(){
		if($("#password2").val().length < 6){
						$("#password2").tips({
							side:3,
				            msg:'密码位数必须大于6',
				            bg:'#FF5080',
				            time:2
				        });
				 $("#password2").focus();
				 }
		}
		function ismail(mail){
		return(new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
		}
		function register(){ 
			if($("#passwords").val()==""){
				$("#passwords").tips({
					side:3,
		            msg:'密码不能为空',
		            bg:'#FF5080',
		            time:3
		        });
				$("#passwords").focus();
			}else{
				if($("#passwords").val().length < 6){
						$("#passwords").tips({
							side:3,
				            msg:'密码位数必须大于6',
				            bg:'#FF5080',
				            time:3
				        });
				 $("#passwords").focus();
				 }
			}
			
		    if($("#password2").val()==""){
				$("#password2").tips({
					side:3,
		            msg:'密码不能为空',
		            bg:'#FF5080',
		            time:3
		        });
				$("#password2").focus();
			}else{
				if($("#password2").val().length < 6){
						$("#password2").tips({
							side:3,
				            msg:'密码位数必须大于6',
				            bg:'#FF5080',
				            time:3
				        });
				 $("#password2").focus();
				 return false;
				 }
			}
			
			if($("#mbq").val()==""){
				$("#mbq").tips({
					side:3,
		            msg:'请选择密保问题',
		            bg:'#FF5080',
		            time:3
		        });
				$("#mbq").focus();
				return false;
			}
			
			if($("#mba").val()==""){
				$("#mba").tips({
					side:3,
		            msg:'请选择密保答案',
		            bg:'#FF5080',
		            time:3
		        });
				$("#mba").focus();
				return false;
			}
			
				if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入姓名',
		            bg:'#FF5080',
		            time:3
		        });
				$("#NAME").focus();
				return false;
			}
			
			
		   if($("#EMAIL").val()!=""){
				if(!ismail($("#EMAIL").val())){
				$("#EMAIL").tips({
					side:3,
		            msg:'邮箱格式不正确',
		            bg:'#FF5080',
		            time:3
		        });
				$("#EMAIL").focus();
				return false;
				//return false;
			   }
			}
		
			var myreg = /^(((13[0-9]{1})|159)+\d{8})$/;
			if($("#PHONE").val()==""){
				$("#PHONE").tips({
					side:3,
		            msg:'输入手机号',
		            bg:'#FF5080',
		            time:3
		        });
				$("#PHONE").focus();
				return false;
			}else if($("#PHONE").val().length != 11 && !myreg.test($("#PHONE").val())){
				$("#PHONE").tips({
					side:3,
		            msg:'手机号格式不正确',
		            bg:'#FF5080',
		            time:3
		        });
				$("#PHONE").focus();
				return false;
			}
			
			
			if($("#bankc").val()==""){
				$("#bankc").tips({
					side:3,
		            msg:'不能为空',
		            bg:'#FF5080',
		            time:3
		        });
				$("#bankc").focus();
				return false;
			}
			
			
			if($("#bank").val()==""){
				$("#bank").tips({
					side:3,
		            msg:'请输入开户行地址',
		            bg:'#FF5080',
		            time:3
		        });
				$("#bank").focus();
				return false;
			}
			
			
			if($("#bankname").val()==""){
				$("#bankname").tips({
					side:3,
		            msg:'请输入账户名',
		            bg:'#FF5080',
		            time:3
		        });
				$("#name").focus();
			}
			
		
				if ($("#code1").val() == "") {
	
					$("#code1").tips({
						side : 1,
						msg : '验证码不得为空',
						bg : '#AE81FF',
						time : 3
					});
	
					$("#code1").focus();
					return false;
				}
		  
			    var url="user/saveU.do";   
			    var formData = $("#RegisterUserForm").serialize();   
			    $.ajax({   
			        type : "POST",   
			        url : url,   
			        processData : true,   
			        data : formData,   
			        success : function(data) { 
			            if("success" == data.result){
							saveCookie();
							alert("您已成功注册!");
							window.location.href="/FHMYSQL";
						}else if("usererror" == data.result){
							$("#loginname").tips({
								side : 1,
								msg : "用户名或密码有误",
								bg : '#FF5080',
								time : 3
							});
							$("#loginname").focus();
						}else if("codeerror" == data.result){
							$("#code1").tips({
								side : 1,
								msg : "验证码输入有误",
								bg : '#FF5080',
								time : 3
							});
							$("#code1").focus();
						}else{
							$("#loginname").tips({
								side : 1,
								msg : "该用户已被注册",
								bg : '#FF5080',
								time : 3
							});
							$("#loginname").focus();
						}
			        
			        
			          
			            //if(responseData=="false"){   
			             //   alert("抱歉，哦！")   
			                //   
			             //   window.location.href="/jfysc/jfsell/asksell.jspx";   
			          //  }else{   
			                //   
			                //responseData=encodeURI(encodeURI(responseData));   
			              //  window.location.href="/FHMYSQL";   
			           // }   
			        }   
			    });   
			}  
		
		
		
		
		//服务器校验
		function severCheck(){
			if(check()){
				var loginname = $("#loginname").val();
				var password = $("#password").val();
				var code = "qq313596790fh"+loginname+",fh,"+password+"QQ978336446fh"+",fh,"+$("#code").val();
				$.ajax({
					type: "POST",
					url: 'login_login',
			    	data: {KEYDATA:code,tm:new Date().getTime()},
					dataType:'json',
					cache: false,
					success: function(data){
						if("success" == data.result){
							saveCookie();
							window.location.href="main/index";
						}else if("usererror" == data.result){
							$("#loginname").tips({
								side : 1,
								msg : "用户名或密码有误",
								bg : '#FF5080',
								time : 3
							});
							$("#loginname").focus();
						}else if("codeerror" == data.result){
							$("#code").tips({
								side : 1,
								msg : "验证码输入有误",
								bg : '#FF5080',
								time : 3
							});
							$("#code").focus();
						}else if("nullcode" == data.result){
							$("#code").tips({
								side : 1,
								msg : "验证码不能为空",
								bg : '#FF5080',
								time : 3
							});
							$("#code").focus();
						}else{
							$("#loginname").tips({
								side : 1,
								msg : "验证码不能为空",
								bg : '#FF5080',
								time : 3
							});
							$("#code").focus();
						}
					}
				});
			}
		}
	
	   //忘记密码-修改密码
		function editPassword(){
		        var code = $("#code2").val();
				if ($("#code2").val() == "") {
	
					$("#code2").tips({
						side : 1,
						msg : '验证码不得为空',
						bg : '#AE81FF',
						time : 3
					});
					$("#code2").focus();
					return false;
				}
				var loginname = $("#acountName").val();
				var mbq = $("#quests").val();
				var mba = $("#questsa").val();
				var password = $("#pwd0").val();
				$.ajax({
					type: "POST",
					url: 'editPassword',
			    	data: {code:code,loginname:loginname,password:password,mbq:mbq,mba:mba,tm:new Date().getTime()},
					dataType:'json',
					cache: false,
					success: function(data){
						if("yes" == data.result){
							window.location.href="main/index";
						}else if("codeerror" == data.result){
							$("#code2").tips({
								side : 1,
								msg : "验证码有误",
								bg : '#FF5080',
								time : 3
							});
							$("#code2").focus();
						}else{
							$("#acountName").tips({
								side : 1,
								msg : "输入信息有误",
								bg : '#FF5080',
								time : 3
							});
							$("#loginname").focus();
						}
					}
				});
		}
	
	
	
		
	     $(document).ready(function() {
			$("#codeImg1").bind("click", changeCode1);
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



		function changeCode1() {
			$("#codeImg1").attr("src", "code.do?t=" + genTimestamp());
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

/*
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
*/
			$("#loginname").tips({
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
	
		
		function yanPassword(){
			if($("#passwords").val()!=$("#chkpwd").val()){
			 $("#chkpwd").tips({
				side:3,
	            msg:'两次密码不相同',
	            bg:'#AE81FF',
	            time:3
	        });
			
		}
		
		}
			function yanPassword2(){
			if($("#password2").val()!=$("#chkpwd2").val()){
			 $("#chkpwd2").tips({
				side:3,
	            msg:'两次密码不相同',
	            bg:'#AE81FF',
	            time:3
	        });
			
		}
		
		}
		
	</script>
	<script>
		//TOCMAT重启之后 点击左侧列表跳转登录首页 
		if (window != top) {
			top.location.href = location.href;
		}
	</script>
		<!-- inline scripts related to this page -->
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="static/UI_new/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
	
	
<script type="text/javascript">
//单选框
$(".chzn-select").chosen(); 
$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
function show_box(id) {
 $('.widget-box.visible').removeClass('visible');
 $('#'+id).addClass('visible');
	  	   $(document).ready(function() {
			changeCode1();
		});
}

function show_box1(id) {
 $('.widget-box.visible').removeClass('visible');
 $('#'+id).addClass('visible');
	  	   $(document).ready(function() {
			changeCode();
		});
}

function show_box2(id) {
 $('.widget-box.visible').removeClass('visible');
 $('#'+id).addClass('visible');
	  	   $(document).ready(function() {
			changeCode2();
		});
}
</script>
	</body>
</html>
