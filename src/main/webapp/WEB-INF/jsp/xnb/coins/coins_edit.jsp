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
			if($("#name").val()==""){
			$("#name").tips({
				side:3,
	            msg:'请输入币值名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#name").focus();
			return false;
		}
		if($("#money").val()==""){
			$("#money").tips({
				side:3,
	            msg:'请输入成交额',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#money").focus();
			return false;
		}
		if($("#counts").val()==""){
			$("#counts").tips({
				side:3,
	            msg:'请输入成交量',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#counts").focus();
			return false;
		}
		
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="coins/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
		<input type="hidden" name="coins_id" id="coins_id" value="${pd.coins_id}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">币值名称:</td>
				<td><input type="text" name="name" id="name" value="${pd.name}" maxlength="32" placeholder="这里输入币值名称" title="币值名称"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">成交额:</td>
				<td><input type="text" name="money" id="money" value="${pd.money}" maxlength="32" placeholder="这里输入成交额" title="成交额"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">成交量:</td>
				<td><input type="text" name="counts" id="counts" value="${pd.counts}" maxlength="32" placeholder="这里输入成交量" title="成交量"/></td>
			</tr>
			
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">最高价:</td>
				<td><input type="text" name="max_money" id="max_money" value="${pd.max_money}" maxlength="32" placeholder="这里输入成交量" title="成交量"/></td>
			</tr>
			
			
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">最低价:</td>
				<td><input type="text" name="min_money" id="min_money" value="${pd.min_money}" maxlength="32" placeholder="这里输入成交量" title="成交量"/></td>
			</tr>
			
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">涨跌幅:</td>
				<td><input type="text" name="up_money" id="up_money" value="${pd.up_money}" maxlength="32" placeholder="这里输入成交量" title="成交量"/></td>
			</tr>
			
			
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">图标:</td>
				<td><input type="file" id="tp" name="tp" title="图标"/><input type="hidden"  name="img" value="${pd.img}"/></td>
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