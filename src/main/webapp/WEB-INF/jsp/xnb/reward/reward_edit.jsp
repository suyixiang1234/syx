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
	            msg:'请输入推荐人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#user_id").focus();
			return false;
		}
		if($("#xuser_id").val()==""){
			$("#xuser_id").tips({
				side:3,
	            msg:'请输入下线',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#xuser_id").focus();
			return false;
		}
		if($("#moneys").val()==""){
			$("#moneys").tips({
				side:3,
	            msg:'请输入奖励金额',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#moneys").focus();
			return false;
		}
		if($("#jmoneys").val()==""){
			$("#jmoneys").tips({
				side:3,
	            msg:'请输入交易金额',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#jmoneys").focus();
			return false;
		}
		if($("#rates").val()==""){
			$("#rates").tips({
				side:3,
	            msg:'请输入比例',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#rates").focus();
			return false;
		}
		if($("#remark").val()==""){
			$("#remark").tips({
				side:3,
	            msg:'请输入备注',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#remark").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="reward/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="reward_id" id="reward_id" value="${pd.reward_id}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">推荐人:</td>
				<td><input type="text" name="user_id" id="user_id" value="${pd.user_id}" maxlength="32" placeholder="这里输入推荐人" title="推荐人"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">下线:</td>
				<td><input type="text" name="xuser_id" id="xuser_id" value="${pd.xuser_id}" maxlength="32" placeholder="这里输入下线" title="下线"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">奖励金额:</td>
				<td><input type="text" name="moneys" id="moneys" value="${pd.moneys}" maxlength="32" placeholder="这里输入奖励金额" title="奖励金额"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">交易金额:</td>
				<td><input type="text" name="jmoneys" id="jmoneys" value="${pd.jmoneys}" maxlength="32" placeholder="这里输入交易金额" title="交易金额"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">比例:</td>
				<td><input type="text" name="rates" id="rates" value="${pd.rates}" maxlength="32" placeholder="这里输入比例" title="比例"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">备注:</td>
				<td><input type="text" name="remark" id="remark" value="${pd.remark}" maxlength="32" placeholder="这里输入备注" title="备注"/></td>
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