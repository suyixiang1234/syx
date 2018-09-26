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
	
    <!-- Ionicons -->
    <link rel="stylesheet" href="<%=basePath%>/static/adminLTE/bower_components/Ionicons/css/ionicons.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="<%=basePath%>/static/adminLTE/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
	
	<link rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="static/js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>
	<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
	<div class="content-wrapper">
 	    <div class="container-fluid" id="main-container">
			<table style="width:100%;" border="0">
				<tr>
					<td style="width:11%;" valign="top" bgcolor="#ECF0F5">
					   
						<div style="width:15%;" class="box box-primary" >
							<ul id="leftTree" class="ztree"></ul>
						</div>
					</td>
					<td style="width:90%;" valign="top" >
						<iframe name="treeFrame" id="treeFrame" frameborder="0" src="<%=basePath%>/user/listUsers.do" style="margin:0 auto;width:100%;height:100%;"></iframe>
					</td>
				</tr>
			</table>
		</div><!--/.fluid-container#main-container-->
		
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/ace-elements.min.js"></script>
		<!-- 引入 -->
		<script type="text/javascript">
			$(top.hangge());
		</script>
		<SCRIPT type="text/javascript">
		var setting = {
			view: {
				showIcon: showIconForTree
			},
			data: {
				simpleData: {
					enable: true
				}
			}
		};

		//var zNodes = ${arr};

		function showIconForTree(treeId, treeNode) {
			return !treeNode.isParent;
		};

		$(document).ready(function(){
			$.fn.zTree.init($("#leftTree"), setting,  ${arr});
		});
		
		function treeFrameT(){
			var hmainT = document.getElementById("treeFrame");
			var bheightT = document.documentElement.clientHeight;
			hmainT .style.width = '100%';
			hmainT .style.height = (bheightT-7) + 'px';
		}
		treeFrameT();
		window.onresize=function(){  
			treeFrameT();
		};
	</SCRIPT>
	
	<!-- DataTables -->
	<script src="<%=basePath%>/static/adminLTE/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>/static/adminLTE/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	</div>
	</div>
	</body>
</html>

