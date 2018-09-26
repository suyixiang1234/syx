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
			if($("#realname").val()==""){
			$("#realname").tips({
				side:3,
	            msg:'请输入持卡人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#realname").focus();
			return false;
		}
		if($("#bank").val()==""){
			$("#bank").tips({
				side:3,
	            msg:'请输入所屬銀行',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#bank").focus();
			return false;
		}
		if($("#province").val()==""){
			$("#province").tips({
				side:3,
	            msg:'请输入省',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#province").focus();
			return false;
		}
		if($("#city").val()==""){
			$("#city").tips({
				side:3,
	            msg:'请输入市',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#city").focus();
			return false;
		}
		if($("#bankname").val()==""){
			$("#bankname").tips({
				side:3,
	            msg:'请输入支行名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#bankname").focus();
			return false;
		}
		if($("#banknum").val()==""){
			$("#banknum").tips({
				side:3,
	            msg:'请输入卡号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#banknum").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="banks/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="banks_id" id="banks_id" value="${pd.banks_id}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">持卡人:</td>
				<td><input type="text" name="realname" id="realname" value="${pd.realname}" maxlength="32" placeholder="这里输入持卡人" title="持卡人"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">所屬銀行:</td>
				<td><input type="text" name="bank" id="bank" value="${pd.bank}" maxlength="32" placeholder="这里输入所屬銀行" title="所屬銀行"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">省:</td>
				<td><input type="text" name="province" id="province" value="${pd.province}" maxlength="32" placeholder="这里输入省" title="省"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">市:</td>
				<td><input type="text" name="city" id="city" value="${pd.city}" maxlength="32" placeholder="这里输入市" title="市"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">支行名称:</td>
				<td><input type="text" name="bankname" id="bankname" value="${pd.bankname}" maxlength="32" placeholder="这里输入支行名称" title="支行名称"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">卡号:</td>
				<td><input type="text" name="banknum" id="banknum" value="${pd.banknum}" maxlength="32" placeholder="这里输入卡号" title="卡号"/></td>
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