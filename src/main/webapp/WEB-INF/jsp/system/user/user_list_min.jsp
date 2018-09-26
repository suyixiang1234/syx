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
			<input name="anchor_id" id="anchor_id" type="hidden" value="${pd.anchor_id }" />
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
						<%-- <td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="window.location.href='<%=basePath%>/user/listtabUsers.do';" title="切换模式"><i id="nav-search-icon" class="icon-exchange"></i></a></td> --%>
						<%-- <td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="icon-download-alt"></i></a></td>
						<c:if test="${QX.edit == 1 }"><td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="fromExcel();" title="从EXCEL导入"><i id="nav-search-icon" class="icon-cloud-upload"></i></a></td></c:if> --%>
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
						
						<!-- <th><i class="icon-time hidden-phone"></i>最近登录</th>
						<th>上次登录IP</th>
						<th class="center">操作</th> -->
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
												<c:choose><c:when test="${user.au_user_id != null}">is_select="1" checked="checked"</c:when><c:otherwise>is_select="0"</c:otherwise></c:choose>/>
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
								
								<%-- <td>${user.LAST_LOGIN}</td>
								<td>${user.IP}</td>
								<td style="width: 60px;">
									<div class='hidden-phone visible-desktop btn-group'>
										<c:if test="${QX.edit == 1 }">
											<c:if test="${user.USERNAME != 'admin'}"><a class='btn btn-mini btn-info' title="编辑" onclick="editUser('${user.USER_ID }');"><i class='icon-edit'></i></a></c:if>
											<c:if test="${user.USERNAME == 'admin'}"><a class='btn btn-mini btn-info' title="您不能编辑"><i class='icon-edit'></i></a></c:if>
										</c:if>
										<c:choose>
											<c:when test="${user.USERNAME=='admin'}">
												<a class='btn btn-mini btn-danger' title="不能删除"><i class='icon-trash'></i></a>
											</c:when>
											<c:otherwise>
												<c:if test="${QX.del == 1 }">
												 <a class='btn btn-mini btn-danger' title="删除" onclick="delUser('${user.USER_ID }','${user.USERNAME }');"><i class='icon-trash'></i></a>
												</c:if>
											</c:otherwise>
										</c:choose>
									</div>
								</td> --%>
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
				<td style="vertical-align:top;">
					
					<%-- <c:if test="${QX.del == 1 }">
					<a title="批量删除" class="btn btn-small btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" ><i class='icon-trash'></i></a>
					</c:if> --%>
					
				</td>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
		
		<input type="hidden" id="current_anchor_id" value="${pd.anchor_id}"/>
		
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
		
		var current_anchor_id = $("#current_anchor_id").val();
		$("#main-container").on("click", "input[name='ids']", function(){
			var thi = $(this);
			var user_id = thi.val();
			if (user_id!=undefined && user_id!='') {
				console.info("单个点击通过");
				$.ajax({
					url: "anchor/anchor_user_bind.do",
					type: "POST",
			    	data: {anchor_id:current_anchor_id,user_id:user_id},
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
					url: 'anchor/anchor_user_bind.do',
			    	data: {anchor_id:current_anchor_id,data_ids:str},
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
		
		//新增
		function add(){
			console.log(top);
			  top.jzts();
			
			 console.log(top);
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>user/goAddU.do';
			 diag.Width = 225;
			 diag.Height = 415;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 //top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//修改
		function editUser(user_id){
		     top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="资料";
			 diag.URL = '<%=basePath%>user/goEditU.do?USER_ID='+user_id;
			 diag.Width = 225;
			 diag.Height = 415;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function delUser(userId,msg){
			bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>user/deleteU.do?USER_ID="+userId+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
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
		
		//导出excel
		function toExcel(){
			var USERNAME = $("#nav-search-input").val();
			var lastLoginStart = $("#lastLoginStart").val();
			var lastLoginEnd = $("#lastLoginEnd").val();
			var ROLE_ID = $("#role_id").val();
			window.location.href='<%=basePath%>user/excel.do?USERNAME='+USERNAME+'&lastLoginStart='+lastLoginStart+'&lastLoginEnd='+lastLoginEnd+'&ROLE_ID='+ROLE_ID;
		}
		
		//打开上传excel页面
		function fromExcel(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="EXCEL 导入到数据库";
			 diag.URL = '<%=basePath%>user/goUploadExcel.do';
			 diag.Width = 300;
			 diag.Height = 150;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						// top.jzts();
						 setTimeout("self.location.reload()",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		</script>
		
	</body>
</html>

