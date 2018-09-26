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
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<style>
			.aligns {font-size:12px;}
			input[type="radio"], input[type="checkbox"] {opacity:1;position: static;vertical-align:middle; margin-top:-2px; margin-bottom:1px;}
		</style>
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
<script type="text/javascript">
	
	
	//保存
	function save(){
			if($("#user_id").val()==""){
			$("#user_id").tips({
				side:3,
	            msg:'请输入交易人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#user_id").focus();
			return false;
		}
		if($("#price").val()==""){
			$("#price").tips({
				side:3,
	            msg:'请输入交易价格',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#price").focus();
			return false;
		}
		if($("#t_counts").val()==""){
			$("#t_counts").tips({
				side:3,
	            msg:'请输入交易量',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#t_counts").focus();
			return false;
		}
		if($("#times").val()==""){
			$("#times").tips({
				side:3,
	            msg:'请输入成交时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#times").focus();
			return false;
		}
		if($("#types").val()==""){
			$("#types").tips({
				side:3,
	            msg:'请输入买/卖',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#types").focus();
			return false;
		}
		if($("#price_all").val()==""){
			$("#price_all").tips({
				side:3,
	            msg:'请输入成交价',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#price_all").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="trade/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="trade_id" id="trade_id" value="${pd.trade_id}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">交易人:</td>
				<td><input type="text" name="user_id" id="user_id" value="${pd.user_id}" maxlength="32" placeholder="这里输入交易人" title="交易人"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">交易价格:</td>
				<td><input type="text" name="price" id="price" value="${pd.price}" maxlength="32" placeholder="这里输入交易价格" title="交易价格"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">交易量:</td>
				<td><input type="text" name="t_counts" id="t_counts" value="${pd.t_counts}" maxlength="32" placeholder="这里输入交易量" title="交易量"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">成交时间:</td>
				<td><input type="text" name="times" id="times" value="${pd.times}" maxlength="32" placeholder="这里输入成交时间" title="成交时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">买/卖:</td>
				<td><input type="text" name="types" id="types" value="${pd.types}" maxlength="32" placeholder="这里输入买/卖" title="买/卖"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">成交价:</td>
				<td><input type="text" name="price_all" id="price_all" value="${pd.price_all}" maxlength="32" placeholder="这里输入成交价" title="成交价"/></td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="10">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
		
	</form>
	
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		</script>
</body>
</html>