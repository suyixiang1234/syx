<div class="navbar navbar-inverse">
		  <div class="navbar-inner">
		   <div class="container-fluid">
			  <a class="brand">
			  <small><i class="">
			  <%--
			  <img src="static/login/images/kl.png" style="width:70px;height:50px">
				--%>
			</i></i>${pd.SYSNAME}</small> </a>
			  <ul class="nav ace-nav pull-right">
			<!-- 		<li class="grey">
						<a href="javascript:alert('预留功能,待开发');" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-tasks"></i>
							<span class="badge">1</span>
						</a>
						<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-closer">
							<li class="nav-header">
								<i class="icon-ok"></i> 4 任务完成
							</li>
							
							<li>
								<a href="javascript:alert('预留功能,待开发');">
									<div class="clearfix">
										<span class="pull-left">软件更新</span>
										<span class="pull-right">65%</span>
									</div>
									<div class="progress progress-mini"><div class="bar" style="width:65%"></div></div>
								</a>
							</li>
							
							<li>
								<a href="javascript:alert('预留功能,待开发');">
									<div class="clearfix">
										<span class="pull-left">软件更新</span>
										<span class="pull-right">35%</span>
									</div>
									<div class="progress progress-mini progress-danger"><div class="bar" style="width:35%"></div></div>
								</a>
							</li>
							
							<li>
								<a href="javascript:alert('预留功能,待开发');">
									<div class="clearfix">
										<span class="pull-left">运行测试</span>
										<span class="pull-right">15%</span>
									</div>
									<div class="progress progress-mini progress-warning"><div class="bar" style="width:15%"></div></div>
								</a>
							</li>
							
							<li>
								<a href="javascript:alert('预留功能,待开发');">
									<div class="clearfix">
										<span class="pull-left">Bug 修复</span>
										<span class="pull-right">90%</span>
									</div>
									<div class="progress progress-mini progress-success progress-striped active"><div class="bar" style="width:90%"></div></div>
								</a>
							</li>
							
							<li>
								<a href="javascript:alert('预留功能,待开发');">
									查看任务明细
									<i class="icon-arrow-right"></i>
								</a>
							</li>
						</ul>
					</li> -->
					
					<li class="red">
						<a href="" class="dropdown-toggle" data-toggle="dropdown" onclick="menu();">
							<i class="icon-folder-open"></i>
							<span class="">菜单管理</span>
						</a>
						<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-closer">
							<li class="nav-header">
								<i class="icon-folder-open"></i>菜单
							</li>
				
						</ul>
					</li>
								
					<li class="grey">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" onclick="zidian();">
							<i class="icon-tasks"></i>
							<span class="">类别管理</span>
						</a>
						<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-closer">
							<li class="nav-header">
								<i class="icon-ok"></i>类别管理
							</li>
							
							
						</ul>
					</li>
					
					<li class="green">
						<a href="javascript:alert('预留功能,待开发');" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-envelope-alt icon-animated-vertical icon-only"></i>信箱管理
							<span class="badge badge-success">${pdListlength}</span>
						</a>
						
						<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-closer">
							<li class="nav-header">
								<i class="icon-envelope"></i>${pdListlength}条未读信件
							</li>
							
							<c:forEach items="${pdList}" var="msg">
								<li>
									<a href="javascript:void(0)"  onclick="edit('${msg.MESSAGE_ID}');">
										<img alt="Alex's Avatar" class="msg-photo" src="static/avatars/avatar.png" />
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">${msg.FUSERNAME}:</span>
												${msg.TITLE}
											</span>
											<span class="msg-time">
												<i class="icon-time"></i> <span>${msg.DATE}</span>
											</span>
										</span>
									</a>
								</li>
							
							</c:forEach>
							
							
						
							<li>
								<a href="javascript:void(0)"  onclick="siMenu('z44','lm42','收件箱','message/list2.do')">
									查看所有信件
									<i class="icon-arrow-right"></i>
								</a>
							</li>									
	
						</ul>
					</li>
			
				
					
					<li class="user-profile">
						<a class="user-menu dropdown-toggle" href="javascript:;" data-toggle="dropdown">
							<img alt="FH" src="static/avatars/user.jpg" class="nav-user-photo" />账户管理
							<%--
							<img style="width:70px;height:70px" alt="" src="static/avatars/user1.png" class="" />
							--%>
							<span id="user_info">
							</span>
							<i class="icon-caret-down"></i>
						</a>
						<ul id="user_menu" class="pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
							<li><a onclick="editUserH();" style="cursor:pointer;"><i class="icon-user"></i> 修改资料</a></li>
							<li id="systemset"><a onclick="editSys();" style="cursor:pointer;"><i class="icon-cog"></i> 系统设置</a></li>
							<li id="productCode"><a onclick="productCode();" style="cursor:pointer;"><i class="icon-cogs"></i> 代码生成</a></li>
						    <li class="divider"></li>
							<li><a href="logout"><i class="icon-off"></i> 退出</a></li>
						</ul>
					</li>
			  </ul><!--/.ace-nav-->
		   </div><!--/.container-fluid-->
		  </div><!--/.navbar-inner-->
		</div><!--/.navbar-->
	<script type="text/javascript">
		$(top.hangge());
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="查阅";
			 diag.URL = '<%=basePath%>message/goEdit.do?MESSAGE_ID='+Id;
			 diag.Width = 650;
			 diag.Height = 555;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		</script>
		
		<!--引入属于此页面的js -->
		<script type="text/javascript" src="static/js/myjs/head.js"></script>
