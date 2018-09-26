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
	<%@ include file="../admin/top.jsp"%> 
	
		<!--引入弹窗组件start-->
	
	</head> 
<body>
		
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">


	<div class="row-fluid">
	
			<!-- 检索  -->
			<form action="user/listUsers.do" method="post" name="userForm" id="userForm">
			<input name="tag_id" id="current_tag_id" type="hidden" value="${pd.tag_id }" />
			<table>
				<tr>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="这里输入关键词" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td><input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="${pd.lastLoginStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="最近登录开始"/></td>
					<td><input class="span10 date-picker" name="lastLoginEnd" name="lastLoginEnd"  value="${pd.lastLoginEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="最近登录结束"/></td>
					<td style="vertical-align:top;"> 
					 	<select class="chzn-select" name="ROLE_ID" id="role_id" data-placeholder="请选择职位" style="vertical-align:top;width: 120px;">
						<option value=""></option>
						<option value="">全部</option>
						<c:forEach items="${roleList}" var="role">
							<option value="${role.ROLE_ID }" <c:if test="${pd.ROLE_ID==role.ROLE_ID}">selected</c:if>>${role.ROLE_NAME }</option>
						</c:forEach>
					  	</select>
					</td>
					<c:if test="${QX.cha == 1 }">
						<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();" title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
					</c:if>
				</tr>
			</table>
			<!-- 检索  -->
		
		
			<table id="table_report" class="table">
				
				<thead>
					<tr>
						<th class="center">
						<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
						</th>
						<th>序号</th>
						<th>编号</th>
						<th>用户名</th>
						<th>姓名</th>
						<th>部门</th>
						<th>职位</th>
					</tr>
				</thead>
										
				<tbody>
					
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty userList}">
						<c:if test="${QX.cha == 1 }">
						<c:forEach items="${userList}" var="user" varStatus="vs">
									
							<tr>
								<td class='center' style="width: 30px;">
									<c:if test="${user.USERNAME != 'admin'}">
										<label>
											<input type='checkbox' name='ids' value="${user.USER_ID }" id="${user.EMAIL }" alt="${user.PHONE }" 
												<c:choose><c:when test="${user.tu_user_id != null}">is_select="1" checked="checked"</c:when><c:otherwise>is_select="0"</c:otherwise></c:choose>/>
											<span class="lbl"></span>
										</label>
									</c:if>
									<c:if test="${user.USERNAME == 'admin'}"><label><input type='checkbox' disabled="disabled"/><span class="lbl"></span></label></c:if>
								</td>
								<td class='center' style="width: 30px;">${vs.index+1}</td>
								<td>${user.NUMBER }</td>
								<td><a>${user.USERNAME }</a></td>
								<td>${user.NAME }</td>
								<td>${user.BM_NAME }</td>
								<td>${user.ROLE_NAME }</td>
							</tr>
						
						</c:forEach>
						</c:if>
						
						<c:if test="${QX.cha == 0 }">
							<tr>
								<td colspan="10" class="center">您无权查看</td>
							</tr>
						</c:if>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="10" class="center">没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
					
				
				</tbody>
			</table>
			
		<div class="page-header position-relative">
		<table style="width:100%;">
			<tr>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
		
		</form>
	</div>
 
 
 
 
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
	
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only"></i>
		</a>
		
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<!-- 引入 -->
		
		
		<script type="text/javascript" src="static/js/jquery.tips.js"></script><!--提示框-->
		<script type="text/javascript">
		
		$(top.hangge());
		
		var current_tag_id = $("#current_tag_id").val();
		$("#main-container").on("click", "input[name='ids']", function(){
			var thi = $(this);
			var user_id = thi.val();
			if (user_id!=undefined && user_id!='') {
				console.info("单个点击通过");
				$.ajax({
					url: "tag/tag_bind_user.do",
					type: "POST",
			    	data: {tag_id:current_tag_id,user_id:user_id},
					dataType:'json',
					//beforeSend: validateData,
					cache: false,
					success: function(data){
						 if (data.status==1) {
							if (thi.attr("checked")=="checked") {
								thi.attr("is_select", 1);
							} else {
								thi.attr("is_select", 0);
							}
						 } else if(data.status==0) {
							 alert(data.message);
						 }
					},
					error : function(xhr){
						 alert("绑定出错");
					}
				});
			}
		});
		$("#main-container").on("click", "#zcheckbox", function(){
			//alert($(this).attr("checked"));
			var str = '';
			for(var i=0;i < document.getElementsByName('ids').length;i++)
			{
			  var isselect = document.getElementsByName('ids')[i].getAttribute("is_select");
			  if (document.getElementsByName('ids')[i].checked) {
				  console.info("第"+(i+1)+"个=true，is_select="+isselect);
				  if (isselect == 1) {
					  continue;//如果本身已经是选中状态，这里又是选中，就不参与操作
				  } else {
					  //如果原本不是选中状态，现在选中了，就要把is_select的值设为1
					  document.getElementsByName('ids')[i].setAttribute("is_select", 1);
				  }
			  } else {
				  console.info("第"+(i+1)+"个=fase，is_select="+isselect);
				  if (isselect == 0) {
					  continue;//如果本身已经是不选中状态，这里又是不选中，就不参与操作
				  } else {
					  //如果原本是选中状态，现在取消选中了，就要把is_select的值设为0
					  document.getElementsByName('ids')[i].setAttribute("is_select", 0);
				  }
			  }
			  //拼接需要参与操作的id
			  if(document.getElementsByName('ids')[i]){
			      if(str==''){
			    	  str += document.getElementsByName('ids')[i].value;
			      } else {
			    	  str += ',' + document.getElementsByName('ids')[i].value;
			      }
			  }
			}
			console.info(str);
			if(str!=''){
				//top.jzts();
				$.ajax({
					type: "POST",
					url: 'tag/tag_bind_user.do',
			    	data: {tag_id:current_tag_id,data_ids:str},
					dataType:'json',
					//beforeSend: validateData,
					cache: false,
					success: function(data){
						 if (data.status==1) {
							 
						 } else if(data.status==0) {
							 alert(data.message);
						 }
					},
					error : function(xhr){
						 alert("绑定出错");
					}
				});
			}
		});
		
		//检索
		function search(){
			top.jzts();
			$("#userForm").submit();
		}
		
		</script>
		
		<script type="text/javascript">
		
		$(function() {
			
			//日期框
			$('.date-picker').datepicker();
			
			//下拉框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//复选框
			$('table th input:checkbox').on('click' , function(){
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});
					
			});
			
		});
		
		</script>
		
	</body>
</html>

