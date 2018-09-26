<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
	<!-- 页面头部 -->
	<%@ include file="head.jsp"%>
</head>
<body>

<div class="swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-helper"></div><!--用于桌面右键区域，滑动区域-->
		<div class="swiper-slide">&nbsp;
			<div id="basediv" class="basediv">
				<%@ include file="menu.jsp"%>
			</div>
			<div class="win-notice swiper-no-swiping" style="top:250px;left:100px;">
				<h1>资料卡</h1>
				<div class="notice-content">
					<p>账户名：${user.USERNAME}</p>
					<p>姓名：${user.NAME}</p>
					<p>西蒙斯：${user2.money}</p>
					<p>信誉值：${user2.xyz}</p>
					
				</div>
			</div>
			<div class="win-memo swiper-no-swiping" style="right: 50px;top: 200px">
				<h1>最新公告<i></i></h1>
				<div class="memo-content">
					<c:forEach items="${varList}" var="var" varStatus="vs" begin="0" end="0">
						<h2>${var.TITLE}</h2>
						<p>${var.CONTENT}</p>
						<p style="font-size: 12px;text-align: right;">(${var.DATE})</p>
					</c:forEach>
				</div>
			</div>	
		</div>

	<c:if test="${user.USER_ID=='admin'}">
		<iframe src="qiugou/list3.do" width="0" height="0"></iframe>
		<div class="swiper-slide">&nbsp;
			<div class="swiper-no-swiping index-list" style="left: 10px">
				<div class="index-list-title">提供帮助<a href="javascript:void(0);" class="refresh-iframe"></a></div>
				<div class="index-list-content">
					<iframe src="qiugou/list4.do" class="index-iframe"></iframe>
				</div>
			</div>
			<div class="swiper-no-swiping index-list" style="right: 10px">
				<div class="index-list-title">获得帮助<a href="javascript:void(0);" class="refresh-iframe"></a></div>
				<div class="index-list-content">
					<iframe src="moneyapply/listaa.do" class="index-iframe" ></iframe>
				</div>
			</div>
		</div>
		<script>
		$(function(){
			$(".refresh-iframe").click(function(){
				var $this=$(this);
				$this.addClass("hover-rotate");
				var iframe = $this.parent().parent().find(".index-iframe");
				var src =iframe.attr("src");
				iframe.attr({"src":src});
				iframe.load(function(){
					$this.removeClass("hover-rotate");
				});
			});
		});
			
		</script>
	</c:if>
	</div>
 	<div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
</div>
	
	
	
	<!-- 公共元素 -->
	<%@ include file="index-init.jsp"%>
	<!-- 底部任务栏 -->
	<%@ include file="footer-task.jsp"%>
	<!-- 开始菜单 -->
	<%@ include file="start-menu.jsp"%>
	
	<!-- 页面底部 -->
	<%@ include file="footer.jsp"%>
	
</body>
</html>
