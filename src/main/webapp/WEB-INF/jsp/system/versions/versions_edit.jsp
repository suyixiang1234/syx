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
		if($("#version_name").val()==""){
			$("#version_name").tips({
				side:3,
	            msg:'请输入版本名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#version_name").focus();
			return false;
		}
		if($("#version_code").val()==""){
			$("#version_code").tips({
				side:3,
	            msg:'请输入版本编号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#version_code").focus();
			return false;
		}
		if($("#code").val()==""){
			$("#code").tips({
				side:3,
	            msg:'请输入版本号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#code").focus();
			return false;
		}
		if($("#revise_content").val()==""){
			$("#revise_content").tips({
				side:3,
	            msg:'请输入修改内容',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#revise_content").focus();
			return false;
		}
		if($("#phone_type").val()==""){
			$("#phone_type").tips({
				side:3,
	            msg:'请输入设备类型',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#phone_type").focus();
			return false;
		} else if(($("#vid").val() == null || $("#vid").val() == "") && $("input[name='phone_type']:checked").val() == 1 && ($("#file").val() == null || $("#file").val() == "")){
			$("#file").tips({
				side:3,
	            msg:'请输入选择文件',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#file").focus();
			return false;
		}
		if($("#is_compel").val()==""){
			$("#is_compel").tips({
				side:3,
	            msg:'请输入强制更新',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#is_compel").focus();
			return false;
		}
		if($("#status").val()==""){
			$("#status").tips({
				side:3,
	            msg:'请输入状态',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#status").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="versions/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
		<input type="hidden" name="vid" id="vid" value="${pd.vid}"/>
		<input type="hidden" name="version_id" id="version_id" value="${pd.version_id}"/>
		<input type="hidden" name="filesize" id="filesize" value="${pd.filesize}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">版本名称:</td>
				<td><input type="text" name="version_name" id="version_name" value="${pd.version_name}" maxlength="32" placeholder="这里输入版本名称" title="版本名称"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">版本编号:</td>
				<td><input type="number" name="version_code" id="version_code" value="${pd.version_code}" maxlength="32" placeholder="这里输入版本编号" title="版本编号"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">修改内容:</td>
				<td><textarea style="width:320px;height:120px;" name="revise_content" id="revise_content" placeholder="这里输入修改内容" title="修改内容">${pd.revise_content}</textarea></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">设备类型:</td>
				<td>
					<div class="aligns">
						<label style="float:left;color:green;"><input type="radio" name="phone_type" value="0" <c:if test="${pd.phone_type == 0}">checked</c:if> title="设备类型"/>ios</label>
						<label style="float:left;color:red;margin-left:10px;"><input type="radio" name="phone_type" value="1" <c:if test="${pd.phone_type == null || pd.phone_type == '' || pd.phone_type == 1}">checked</c:if> title="设备类型"/>Android</label>
					</div>
				</td>
			</tr>
			<tr id="and_file" <c:if test="${pd.phone_type == 0}">style="display:none;"</c:if>>
				<td style="width:70px;text-align: right;padding-top: 13px;">版本文件:</td>
				<td><input type="file" name="file" id="file" title="版本文件" accept=".apk"/></td>
			</tr>
			<tr id="ios_url" <c:if test="${pd.phone_type != 0}">style="display:none;"</c:if>>
				<td style="width:70px;text-align: right;padding-top: 13px;">版本链接:</td>
				<td><input type="text" style="width:320px;" name="url" id="url" value="${pd.url}" placeholder="这里输入版本链接" title="版本链接" /></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">强制更新:</td>
				<td title="开启后，如不更新将无法使用APP">
					<div class="aligns">
						<label style="float:left;color:green;"><input type="radio" name="is_compel" value="1" <c:if test="${pd.is_compel == 1}">checked</c:if> title="强制更新"/>是</label>
						<label style="float:left;color:red;margin-left:10px;"><input type="radio" name="is_compel" value="0" <c:if test="${pd.is_compel == null || pd.is_compel == '' || pd.is_compel == 0}">checked</c:if> title="强制更新"/>否</label>
					</div>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">状态:</td>
				<td>
					<div class="aligns">
						<label style="float:left;color:green;"><input type="radio" name="status" value="1" <c:if test="${pd.status == null || pd.status == '' || pd.status == 1}">checked</c:if> title="状态"/>启用</label>
						<label style="float:left;color:red;margin-left:10px;"><input type="radio" name="status" value="0" <c:if test="${pd.status == 0}">checked</c:if> title="状态"/>禁用</label>
					</div>
				</td>
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
			$("input[name='phone_type']").on("click", function(){
				if($(this).val() == 0){
					$("#and_file").hide();
					$("#ios_url").show();
				} else {
					$("#and_file").show();
					$("#ios_url").hide();
				}
			});
			
		});
		
		</script>
</body>
</html>