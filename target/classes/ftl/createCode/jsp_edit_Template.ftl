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
	<#list fieldList as var>
		<#if var[3] == "是">
		if($("#${var[0] }").val()==""){
			$("#${var[0] }").tips({
				side:3,
	            msg:'请输入${var[2] }',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#${var[0] }").focus();
			return false;
		}
		</#if>
	</#list>
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="${objectNameLower}/${r"${msg }"}.do" name="Form" id="Form" method="post">
		<input type="hidden" name="${objectNameLower}_id" id="${objectNameLower}_id" value="${r"${pd."}${objectNameLower}_id${r"}"}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
    <#list fieldList as var>
	<#if var[3] == "是">
		<#if var[1] == 'Date'>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">${var[2] }:</td>
				<td><input class="span10 date-picker" name="${var[0] }" id="${var[0] }" value="${r"${pd."}${var[0] }${r"}"}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="${var[2] }" title="${var[2] }"/></td>
			</tr>
		<#elseif var[1] == 'Integer'>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">${var[2] }:</td>
				<td><input type="number" name="${var[0] }" id="${var[0] }" value="${r"${pd."}${var[0] }${r"}"}" maxlength="32" placeholder="这里输入${var[2] }" title="${var[2] }"/></td>
			</tr>
		<#elseif var[1] == 'LongText'>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">${var[2] }:</td>
				<td><textarea name="${var[0] }" id="${var[0] }" placeholder="这里输入${var[2] }" title="${var[2] }">${r"${pd."}${var[0] }${r"}"}</textarea></td>
			</tr>
		<#elseif var[1] == 'Double'>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">${var[2] }:</td>
				<td><input type="text" name="${var[0] }" id="${var[0] }" value="${r"${pd."}${var[0] }${r"}"}" maxlength="32" placeholder="这里输入${var[2] }" title="${var[2] }"/></td>
			</tr>
		<#elseif var[1] == 'File'>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">${var[2] }:</td>
				<td><input type="file" name="${var[0] }" id="${var[0] }" title="${var[2] }"/></td>
			</tr>
		<#elseif var[1] == 'Radio'>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">${var[2] }:</td>
				<td>
					<div class="aligns">
						<label style="float:left;color:green;" title="${var[2] }"><input type="radio" name="${var[0] }" value="1" <c:if test="${r"${pd."}${var[0] }${r" == 1}"}">checked</c:if>/>1</label>
						<label style="float:left;color:red;margin-left:10px;" title="${var[2] }"><input type="radio" name="${var[0] }" value="0" <c:if test="${r"${pd."}${var[0] }${r" == 0}"}">checked</c:if>/>0</label>
					</div>
				</td>
			</tr>
		<#elseif var[1] == 'CheckBox'>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">${var[2] }:</td>
				<td>
					<div class="aligns">
						<label style="float:left;" title="${var[2] }"><input type="checkbox" name="${var[0] }" id="${var[0] }" value="${r"${pd."}${var[0] }${r"}"}"/>1</label>
						<label style="float:left;margin-left:10px;" title="${var[2] }"><input type="checkbox" name="${var[0] }" id="${var[0] }" value="${r"${pd."}${var[0] }${r"}"}"/>1</label>
					</div>
				</td>
			</tr>
		<#elseif var[1] == 'Select'>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">${var[2] }:</td>
				<td>
					<select class="chzn-select" name="${var[0] }" id="${var[0] }" data-placeholder="请选择" title="${var[2] }">
						<option value=""></option>
						<option value="">全部</option>
						<option value="">1</option>
						<option value="">2</option>
				  	</select>
				</td>
			</tr>
		<#elseif var[1] == 'Ueditor'>
		<#assign haveUeditor=1>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">${var[2] }:</td>
				<td><textarea name="${var[0] }" id="${var[0] }" placeholder="这里输入${var[2] }" title="${var[2] }" style="width:600px;height:300px;">${r"${pd."}${var[0] }${r"}"}</textarea>
				</td>
				<script>
				   $(function(){
						UE.getEditor('${var[0] }');
					});
				
				</script>
			</tr>
		<#else>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">${var[2] }:</td>
				<td><input type="text" name="${var[0] }" id="${var[0] }" value="${r"${pd."}${var[0] }${r"}"}" maxlength="32" placeholder="这里输入${var[2] }" title="${var[2] }"/></td>
			</tr>
		</#if>
	</#if>
</#list>
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
		<#if haveUeditor??>
		<!-- 编辑框-->
		<script type="text/javascript" charset="utf-8">window.UEDITOR_HOME_URL = "<%=path%>/plugins/ueditor/";</script>
		<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.config.js"></script>
		<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.all.js"></script>
		<!-- 编辑框-->
		</#if>
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