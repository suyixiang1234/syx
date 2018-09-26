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
		<link href="/static/UI_win7/css/login.css" rel="stylesheet" />
		<script type="text/javascript" src="/static/UI_win7/lib/jquery/jquery-1.8.0.min.js"></script>
		<script type="text/javascript" src="/static/UI_win7/lib/jquery/plug/jquery.placeholder.js"></script>
		<script src="/static/UI_win7/js/login.js"></script>
	</head>
	
	<body>
	<div class="login">

	<!-- <div class="login-title">SNS NNN</div> -->
	<div class="login-form" style="margin-top:10px">
		<form action="" method="post" name="RegisterUserForm" id="RegisterUserForm">
			<input type="hidden" name="ROLE_ID" id="role_id" value="55896f5ce3c0494fa6850775a4e29ff6"/>
			<div class="form-rows">
				<label></label>
				<input type="text" name="USERNAME" id="USERNAME" placeholder="帐号" title="帐号">
			</div>
			<div class="form-rows">
				<label></label>
				<input type="password"  name="password" id="password" placeholder="密码">
			</div>
			<div class="form-rows">
				<label></label>
				<input type="password"  name="password1" id="password1" placeholder="确认密码">
			</div>
			<div class="form-rows">
				<label></label>
				<input type="password"  name="pwd2" id="pwd2" placeholder="交易密码">
			</div>
			<div class="form-rows">
				<label></label>
				<input type="password"  name="pwd22" id="pwd22" placeholder="确认交易密码">
			</div>
			<div class="form-rows">
				<label></label>
				<input type="text"  name="tuijian" id="tuijian" placeholder="推荐人" value="${pd.tuijian}">
			</div>
			<div class="form-rows">
				<label></label>
				<input name="rcode" id="rcode"  style="width:120px;float:left">
				<img src="" id="rcodeImg" class="rq-code">
			</div>
			<div class="form-rows">
				<a  onclick="register()" id="to-recover" class="login-btn">注&nbsp;&nbsp;&nbsp;册</a>
			</div>
		</form>
	</div>
	</div>

	<script type="text/javascript" src="/static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="/static/js/jquery.cookie.js"></script>
	<script type="text/javascript">
	
	var isClick=true;
	function register(){ 
			if($("#USERNAME").val()==""){
			$("#USERNAME").tips({
				side:3,
	            msg:'请输入用户',
	            bg:'#FF5080',
	            time:3
	        });
			$("#USERNAME").focus();
			return false;
			}
		
			
			if($("#password").val()==""){
				$("#password").tips({
					side:3,
		            msg:'密码不能为空',
		            bg:'#FF5080',
		            time:3
		        });
				$("#password").focus();
				return false;
			}else{
				if($("#password").val().length < 6){
						$("#password").tips({
							side:3,
				            msg:'密码位数必须大于6',
				            bg:'#FF5080',
				            time:3
				        });
				 $("#password").focus();
					return false;
				 }
			}
			
			
			if($("#pwd2").val()==""){
				$("#pwd2").tips({
					side:3,
		            msg:'密码不能为空',
		            bg:'#FF5080',
		            time:3
		        });
				$("#pwd2").focus();
				return false;
			}else{
				if($("#pwd2").val().length < 6){
						$("#pwd2").tips({
							side:3,
				            msg:'密码位数必须大于6',
				            bg:'#FF5080',
				            time:3
				        });
				 $("#pwd2").focus();
					return false;
				 }
			}
		
			
			if($("#password").val()!=$("#password1").val()){
				$("#password1").tips({
					side:3,
		            msg:'两次密码不相同',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#password1").focus();
				return false;
			}
			
			
			if($("#pwd2").val()!=$("#pwd22").val()){
				$("#pwd22").tips({
					side:3,
		            msg:'两次密码不相同',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#pwd22").focus();
				return false;
			}
			

			if ($("#tuijian").val() == "") {
					$("#tuijian").tips({
						side : 1,
						msg : '推荐人不得为空',
						bg : '#AE81FF',
						time : 3
					});
					$("#tuijian").focus();
					return false;
			}
		
			if ($("#rcode").val() == "") {
					$("#rcode").tips({
						side : 1,
						msg : '验证码不得为空',
						bg : '#AE81FF',
						time : 3
					});
					$("#rcode").focus();
					return false;
			}
		  
				
			var url="/appuser/saveU.do";   
			var formData = $("#RegisterUserForm").serialize();
			    
			    if(!isClick){
					return;
				}
				isClick=false;
			    $.ajax({   
			        type : "POST",   
			        url : url,   
			        processData : true,   
			        data : formData,   
			        success : function(data) { 
			            if("success" == data.result){
			            		isClick=true;
								alert("您已成功注册!");
							    window.location.href="/";
							    
						}else if("notuijian" == data.result){
							isClick=true;
							$("#tuijian").tips({
								side : 1,
								msg : "推荐人不存在",
								bg : '#FF5080',
								time : 3
							});
							$("#tuijian").focus();
						}else if("nouser" == data.result){
							isClick=true;
							$("#USERNAME").tips({
								side : 1,
								msg : "该用户名已经注册",
								bg : '#FF5080',
								time : 3
							});
							$("#USERNAME").focus();
						}else if("codeerror" == data.result){
							isClick=true;
							$("#code").tips({
								side : 1,
								msg : "验证码输入有误",
								bg : '#FF5080',
								time : 3
							});
							$("#code").focus();
						}else{
							isClick=true;
							alert("数据异常!");
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
	
	
	//计算推荐奖金
	function jszhitui(USER_ID){
		var url="/appuser/jszhitui.do?XUSER_ID="+USER_ID;   
		$.ajax({   
		        type : "GET",   
		        url : url,   
		        processData : true,   
		        //data : formData,   
		        success : function(data) { 
		            if("success" == data.result){
					}else{
					}
		        }   
		    });   
		
	}
	
	
	</script>
	
	
	
	<%--<div id="ind_video" closerate="4" playrate="-2" style="position: fixed;_position: absolute;text-align: left;overflow: visible;bottom :0;left:0;display:block; z-index:999;"><div id="dyb_loadding_3" style="position: absolute; top: 206px; left: 0px; width: 100%; text-align: center; display: none;"><img src="http://img.daiyanbao.com/img/loadding.gif"><br><span style="font-family:'Microsoft YaHei',SimHei,FangSong; font-size:16px;color:#5e5e5e;text-decoration: none;"><a href="http://www.daiyanbao.com/" target="_blank" style="font-family:'Microsoft YaHei',SimHei,FangSong; font-size:16px;color:#5e5e5e;text-decoration: none;">代言宝</a>加载中</span></div><div id="dyb_sub_3"></div><object type="application/x-shockwave-flash" data="//res.daiyanbao.com/flash/md1_1_3.swf?v=1_1_3&amp;i=3&amp;a=admin&amp;b=dyb%2F20141023daoyanbao.com-home&amp;c=288&amp;d=480&amp;cs_e=64&amp;cs_f=0.7&amp;cs_g=0&amp;cs_h=-10" width="288" height="480" id="dyb_content_3"><param name="flashvars" value="i=3&amp;a=admin&amp;b=dyb%2F20141023daoyanbao.com-home&amp;c=288&amp;d=480&amp;cs_e=64&amp;cs_f=0.7&amp;cs_g=0&amp;cs_h=-10"><param name="wmode" value="Transparent"><param name="allowScriptAccess" value="always"></object><div id="dyb_close_3" style="position: absolute; bottom: 0px; right: 0px; width: 80px; height: 36px; text-align: center; font-size: 12px; font-family: 'Microsoft YaHei', SimHei, FangSong; color: rgb(94, 94, 94); cursor: pointer;">关闭X</div></div>
	--%></body>
</html>
