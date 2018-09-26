<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- jsp文件头和头部 -->
	<%@ include file="../admin/top.jsp"%> 
	
	</head> 
<body>
<div class="container-fluid" id="main-container">
<div id="page-content" class="clearfix">
  <div class="row-fluid">
 	<div class="span12">
		<div class="widget-box">
			<div class="widget-header widget-header-blue widget-header-flat wi1dget-header-large">
				<h4 class="lighter">Mqtt标签推送数据监听测试<a href="<%=basePath%>appuser/mqtt_client" target="_blank">》【点击启动监听】</a></h4>
			</div>
			<div class="widget-body">
			 <div class="widget-main">
					<div class="step-content row-fluid position-relative">
						<div style="float: left;">
							<span class="input-icon">
							
							</span>
						</div>
					</div>
					<div class="step-content row-fluid position-relative">
					实时数据返回：
					 <span id="sdata"></span>
					<!-- <textarea id="json-field" hidden title="返回结果" class="autosize-transition span12" style="width:890px;height:300px"></textarea> -->
				 	</div>
				 <input type="hidden" name="S_TYPE" id="S_TYPE" value="启动"/>
			 </div><!--/widget-main-->
			</div><!--/widget-body-->
		</div>
	</div>
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
	
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only"></i>
		</a>
		
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='<%=basePath%>static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="<%=basePath%>static/js/bootstrap.min.js"></script>
		<script src="<%=basePath%>static/js/ace-elements.min.js"></script>
		<script src="<%=basePath%>static/js/ace.min.js"></script>
		<!-- 引入 -->
		<!--MD5-->
		<script type="text/javascript" src="<%=basePath%>static/js/jQuery.md5.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="<%=basePath%>static/js/jquery.tips.js"></script>
		<!--引入属于此页面的js -->
		<script type="text/javascript" src="<%=basePath%>static/js/myjs/interfaceTest.js"></script>
	    <script src="http://cdn.sockjs.org/sockjs-0.3.min.js"></script>
		<script type="text/javascript">
		$(function() {
			var websocket;
			var id;//
			var playerCardNumber;//
			var dealerCardNumber;//
			var gameStatus = 5;//
			var conuts = 1;//测试初始数据
			var flat = 1;//判断是否准备
			websocket = new WebSocket("ws://192.168.1.19:8080/FHM/echo");
			websocket.onopen = function() {
				 console.log("1144444444441");
				//连接成功
				websocket.send("111");
			};
			websocket.onmessage = function(evnt) {
				 var data = evnt.data;
				 console.log(data);
				 console.log("111111111");
				 if(data[0]=="o") {
					 $("#sdata").append("<p>"+data.slice(1)+"<p>"); 
				   //$("#sdata").html(data.slice(1));//解析服务器在线人数
				  }
				 if(data[0]=="b") {
					 $("#sdata1").append("<p>"+data.slice(1)+"<p>"); 
				   //$("#sdata").html(data.slice(1));//解析服务器在线人数
				  }
				 if(data[0]=="y") {
					 alert(data.slice(1));
					
				   //$("#sdata").html(data.slice(1));//解析服务器在线人数
				  }
			};

			websocket.onerror = function(evnt) {
			};
			websocket.onclose = function(evnt) {
			};
		
		});
		
		</script>
		
		
		
		
	</body>
</html>

