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
			
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="tixian/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="tixian_id" id="tixian_id" value="${pd.tixian_id}"/>
		<input type="hidden" name="status" id="status" value="已完成"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">用戶</td>
				<td>
				${pd.USERNAME}
				</td>
			</tr>
			
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">手机号</td>
				<td>
				${pd.PHONE}
				</td>
			</tr>
			
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">真实姓名</td>
				<td>
				${pd.realname}
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">银行</td>
				<td>
				${pd.bank}
				</td>
			</tr>
			
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">卡号</td>
				<td>
				${pd.banknum}
				</td>
			</tr>
			
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">支行名称</td>
				<td>
				${pd.bankname}
				</td>
			</tr>
			
			
			
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">状态:</td>
				<td><input type="text"  readonly value="${pd.status}" maxlength="32" /></td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="10">
				    <a class="btn btn-mini btn-primary" onclick="save();">确认转账</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
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