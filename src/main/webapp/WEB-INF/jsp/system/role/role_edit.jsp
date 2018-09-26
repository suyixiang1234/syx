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
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		
<script type="text/javascript">
	
	top.hangge();
	
	//保存
	function save(){
		if($("#roleName").val()==""){
			$("#roleName").focus();
			return false;
		}
			$("#form1").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
		<form action="role/edit.do" name="form1" id="form1"  method="post">
		<input type="hidden" name="ROLE_ID" id="id" value="${pd.ROLE_ID}"/>
			<div id="zhongxin">
			<table id="table_report" class="table table-striped table-bordered table-hover">
				<tr>
					<td style="width:150px;text-align: right;padding-top: 13px;">角色名称:</td>
					<td>
						<input type="text" name="ROLE_NAME" id="roleName" value="${pd.ROLE_NAME}" placeholder="这里输入名称" title="名称" />
				    </td>
				</tr>
				<tr>
					<td style="width:150px;text-align: right;padding-top: 13px;">拥有全部全部权限:</td>
					<td>
					<div class="controls">
						<input name="qx_all" type="radio" value="1" <c:if test="${pd.qx_all==1}">checked="checked"</c:if>><span class="lbl"> 是</span>
						<input name="qx_all" type="radio" value="0" <c:if test="${pd.qx_all==0}">checked="checked"</c:if>><span class="lbl"> 否</span>
				    </div>
				    </td>
				</tr>
				<tr>
					<td style="width:150px;text-align: right;padding-top: 13px;">仅与所属部门相关:</td>
					<td>
					<div class="controls">
						<input name="qx_department" type="radio" value="1" <c:if test="${pd.qx_department==1}">checked="checked"</c:if>><span class="lbl"> 是</span>
						<input name="qx_department" type="radio"  value="0"  <c:if test="${pd.qx_department==0}">checked="checked"</c:if>><span class="lbl"> 否</span>
				    </div>
				    </td>
				</tr>
				<tr>
					<td style="width:150px;text-align: right;padding-top: 13px;">仅本人相关数据权限:</td>
					<td>
					<div class="controls">
						<input name="qx_user" type="radio" value="1" <c:if test="${pd.qx_user==1}">checked="checked"</c:if>><span class="lbl"> 是</span>
						<input name="qx_user" type="radio" value="0" <c:if test="${pd.qx_user==0}">checked="checked"</c:if>><span class="lbl"> 否</span>
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
		</form>
	
	<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif"  style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
		<!-- 引入 -->
		<script src="static/1.9.1/jquery.min.js"></script>
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
</body>
</html>
