<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>主页</title>

    <meta name="keywords" content="后台">
    <meta name="description" content="">

    <!--
    [if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]
    -->
    
   

    <link rel="shortcut icon" href="<%=basePath%>static/hplus/favicon.ico" tppabs="http://www.zi-han.net/theme/hplus/favicon.ico">
    <link href="<%=basePath%>static/hplus/css/bootstrap.min.css-v=3.3.5.css" tppabs="http://www.zi-han.net/theme/hplus/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="<%=basePath%>static/hplus/css/font-awesome.min.css-v=4.4.0.css" tppabs="http://www.zi-han.net/theme/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="<%=basePath%>static/hplus/css/animate.min.css" tppabs="http://www.zi-han.net/theme/hplus/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>static/hplus/css/style.min.css-v=4.0.0.css" tppabs="http://www.zi-han.net/theme/hplus/css/style.min.css?v=4.0.0" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span>
                            <img alt="image" class="img-circle" src="<%=basePath%>static/hplus/img/loogo.jpg" style="width:60px" tppabs="http://www.zi-han.net/theme/hplus/img/profile_small.jpg" /></span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                                <span class="block m-t-xs"><strong class="font-bold">${USERNAME}</strong></span>
                                
                                <c:if test="${USERNAME == 'admin'}">
                               		 <span class="text-muted text-xs block">超级管理员<b class="caret"></b></span>
                              	</c:if>
                              	<c:if test="${USERNAME != 'admin'}">
                               		 <span class="text-muted text-xs block">${sysUser.ROLE_NAME}<b class="caret"></b></span>
                              	</c:if>
                               
                                </span>
                            </a>
                            		
                         
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            	 <c:if test="${USERNAME == 'admin'}">
                            		  <li>
                            		  	<a class="J_menuItem" href="<%=basePath%>menu.do" tppabs="http://www.zi-han.net/theme/hplus/form_avatar.html">菜单编辑</a>
                              		  </li>
                               		  <li>
                               		  	<a class="J_menuItem" href="<%=basePath%>/head/goSystem.do" tppabs="http://www.zi-han.net/theme/hplus/form_avatar.html">系统设置</a>
                              		  </li>
                              	</c:if>
                                	   <li><a class="J_menuItem" href="<%=basePath%>/user/goEditU1.do?fx=head" tppabs="http://www.zi-han.net/theme/hplus/form_avatar.html">修改密码</a>
                              		  </li>
                              		   <li><a class="J_menuItem" href="<%=basePath%>/user/goEditU11.do?fx=head" tppabs="http://www.zi-han.net/theme/hplus/form_avatar.html">修改交易密码</a>
                              		  </li>
		                                <%--
		                                <li><a class="J_menuItem" href="profile.html" tppabs="http://www.zi-han.net/theme/hplus/profile.html">个人资料</a>
		                                </li>
		                                <li><a class="J_menuItem" href="contacts.html" tppabs="http://www.zi-han.net/theme/hplus/contacts.html">联系我们</a>
		                                </li>
		                                <li><a class="J_menuItem" href="mailbox.html" tppabs="http://www.zi-han.net/theme/hplus/mailbox.html">信箱</a>
		                                </li>
		                                <li class="divider"></li>
		                                --%>
                                <li><a href="<%=basePath%>logout" tppabs="http://www.zi-han.net/theme/hplus/login.html">安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">H+
                        </div>
                        
                    </li>
                 
                   <li id="lm3">
                   
                      <span class="nav-label">
                      <a class="btn btn-success  btn-rounded btn-block"  href="<%=basePath%>/main/index"> 点击进入首页 </a>
                      </span>
                	
                   </li>
                   
		                   <c:forEach items="${menuList}" var="menu">
								<c:if test="${menu.hasMenu}">
								<li id="lm${menu.MENU_ID }">
									 <a href="#">
									  <!--<i class="fa fa-info-circle"></i>-->
		                        	   
		                            <span class="nav-label">${menu.MENU_NAME }</span>
		                            <span class="fa arrow"></span>
		                       		 </a>
									   <ul  class="nav nav-second-level">
											<c:forEach items="${menu.subMenu}" var="sub">
												<c:if test="${sub.hasMenu}">
												<c:choose>
													<c:when test="${not empty sub.MENU_URL}">
													
													
													<li id="z${sub.MENU_ID }">
						                                <a class="J_menuItem" href="<%=basePath%>${sub.MENU_URL }" tppabs="http://www.zi-han.net/theme/hplus/index_v1.html" data-index="0">${sub.MENU_NAME }</a>
						                            </li>
													</c:when>
												
													<c:otherwise>
													<li><a href="javascript:void(0);"><i class="icon-double-angle-right"></i>${sub.MENU_NAME }</a></li>
													</c:otherwise>
												</c:choose>
												</c:if>
											</c:forEach>
								  	 </ul>
								</li>
								</c:if>
							</c:forEach>
		                   
                   

                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
     
     
     
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                        <form role="search" class="navbar-form-custom" method="post" action="http://www.zi-han.net/theme/hplus/search_results.html">
                            <div class="form-group">
                                <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
                            </div>
                        </form>
                    </div>
             
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="<%=basePath%>login_default.do">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="<%=basePath%>logout" tppabs="http://www.zi-han.net/theme/hplus/login.html" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            
        
            
            
            
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="<%=basePath%>login_default.do" tppabs="<%=basePath%>login_default.do" frameborder="0" data-id="<%=basePath%>login_default.do" seamless></iframe>
            </div>
          
          
          
            <div class="footer">
                <div class="pull-right">&copy; 2016-2017 Diamond
                </div>
            </div>
        </div>
    
    
    
    
    
    
    
    
    
        <!--右侧部分结束-->
        <!--右侧边栏开始-->
        <div id="right-sidebar">
            <div class="sidebar-container">

                <ul class="nav nav-tabs navs-3">

                    <li class="active">
                        <a data-toggle="tab" href="#tab-1">
                            <i class="fa fa-gear"></i> 主题
                        </a>
                    </li>
                    <li class=""><a data-toggle="tab" href="#tab-2">
                        通知
                    </a>
                    </li>
                    <li><a data-toggle="tab" href="#tab-3">
                        项目进度
                    </a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div id="tab-1" class="tab-pane active">
                        <div class="sidebar-title">
                            <h3> <i class="fa fa-comments-o"></i> 主题设置</h3>
                            <small><i class="fa fa-tim"></i> 你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
                        </div>
                        <div class="skin-setttings">
                            <div class="title">主题设置</div>
                            <div class="setings-item">
                                <span>收起左侧菜单</span>
                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="collapsemenu">
                                        <label class="onoffswitch-label" for="collapsemenu">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>固定顶部</span>

                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox" id="fixednavbar">
                                        <label class="onoffswitch-label" for="fixednavbar">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>
                        固定宽度
                    </span>

                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox" id="boxedlayout">
                                        <label class="onoffswitch-label" for="boxedlayout">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="title">皮肤选择</div>
                            <div class="setings-item default-skin nb">
                                <span class="skin-name ">
                         <a href="#" class="s-skin-0">
                             默认皮肤
                         </a>
                    </span>
                            </div>
                            <div class="setings-item blue-skin nb">
                                <span class="skin-name ">
                        <a href="#" class="s-skin-1">
                            蓝色主题
                        </a>
                    </span>
                            </div>
                            <div class="setings-item yellow-skin nb">
                                <span class="skin-name ">
                        <a href="#" class="s-skin-3">
                            黄色/紫色主题
                        </a>
                    </span>
                            </div>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-pane">

                        <div class="sidebar-title">
                            <h3> <i class="fa fa-comments-o"></i> 最新通知</h3>
                            <small><i class="fa fa-tim"></i> 您当前有10条未读信息</small>
                        </div>

                        <div>

                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a1.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a1.jpg">

                                        <div class="m-t-xs">
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">

                                        据天津日报报道：瑞海公司董事长于学伟，副董事长董社轩等10人在13日上午已被控制。
                                        <br>
                                        <small class="text-muted">今天 4:21</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a2.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a2.jpg">
                                    </div>
                                    <div class="media-body">
                                        HCY48之音乐大魔王会员专属皮肤已上线，快来一键换装拥有他，宣告你对华晨宇的爱吧！
                                        <br>
                                        <small class="text-muted">昨天 2:45</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a3.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a3.jpg">

                                        <div class="m-t-xs">
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        写的好！与您分享
                                        <br>
                                        <small class="text-muted">昨天 1:10</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a4.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a4.jpg">
                                    </div>

                                    <div class="media-body">
                                        国外极限小子的炼成！这还是亲生的吗！！
                                        <br>
                                        <small class="text-muted">昨天 8:37</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a8.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a8.jpg">
                                    </div>
                                    <div class="media-body">

                                        一只流浪狗被收留后，为了减轻主人的负担，坚持自己觅食，甚至......有些东西，可能她比我们更懂。
                                        <br>
                                        <small class="text-muted">今天 4:21</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a7.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a7.jpg">
                                    </div>
                                    <div class="media-body">
                                        这哥们的新视频又来了，创意杠杠滴，帅炸了！
                                        <br>
                                        <small class="text-muted">昨天 2:45</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a3.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a3.jpg">

                                        <div class="m-t-xs">
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        最近在补追此剧，特别喜欢这段表白。
                                        <br>
                                        <small class="text-muted">昨天 1:10</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a4.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a4.jpg">
                                    </div>
                                    <div class="media-body">
                                        我发起了一个投票 【你认为下午大盘会翻红吗？】
                                        <br>
                                        <small class="text-muted">星期一 8:37</small>
                                    </div>
                                </a>
                            </div>
                        </div>

                    </div>
                    <div id="tab-3" class="tab-pane">

                        <div class="sidebar-title">
                            <h3> <i class="fa fa-cube"></i> 最新任务</h3>
                            <small><i class="fa fa-tim"></i> 您当前有14个任务，10个已完成</small>
                        </div>

                        <ul class="sidebar-list">
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>市场调研</h4> 按要求接收教材；

                                    <div class="small">已完成： 22%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 22%;" class="progress-bar progress-bar-warning"></div>
                                    </div>
                                    <div class="small text-muted m-t-xs">项目截止： 4:00 - 2015.10.01</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>可行性报告研究报上级批准 </h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的 开发进度作出一个合理的比对

                                    <div class="small">已完成： 48%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 48%;" class="progress-bar"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>立项阶段</h4> 东风商用车公司 采购综合综合查询分析系统项目进度阶段性报告武汉斯迪克科技有限公司

                                    <div class="small">已完成： 14%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 14%;" class="progress-bar progress-bar-info"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-primary pull-right">NEW</span>
                                    <h4>设计阶段</h4>
                                    <!--<div class="small pull-right m-t-xs">9小时以后</div>-->
                                    项目进度报告(Project Progress Report)
                                    <div class="small">已完成： 22%</div>
                                    <div class="small text-muted m-t-xs">项目截止： 4:00 - 2015.10.01</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>拆迁阶段</h4> 科研项目研究进展报告 项目编号: 项目名称: 项目负责人:

                                    <div class="small">已完成： 22%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 22%;" class="progress-bar progress-bar-warning"></div>
                                    </div>
                                    <div class="small text-muted m-t-xs">项目截止： 4:00 - 2015.10.01</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>建设阶段 </h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的 开发进度作出一个合理的比对

                                    <div class="small">已完成： 48%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 48%;" class="progress-bar"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>获证开盘</h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的 开发进度作出一个合理的比对

                                    <div class="small">已完成： 14%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 14%;" class="progress-bar progress-bar-info"></div>
                                    </div>
                                </a>
                            </li>

                        </ul>

                    </div>
                </div>

            </div>
        </div>
        <!--右侧边栏结束-->
        <!--mini聊天窗口开始-->
        <%--
        <div class="small-chat-box fadeInRight animated">

            <div class="heading" draggable="true">
                <small class="chat-date pull-right">
                    2015.9.1
                </small> 与 Beau-zihan 聊天中
            </div>

            <div class="content">

                <div class="left">
                    <div class="author-name">
                        Beau-zihan <small class="chat-date">
                        10:02
                    </small>
                    </div>
                    <div class="chat-message active">
                        你好
                    </div>

                </div>
                <div class="right">
                    <div class="author-name">
                        游客
                        <small class="chat-date">
                            11:24
                        </small>
                    </div>
                    <div class="chat-message">
                        你好，请问H+有帮助文档吗？
                    </div>
                </div>
                <div class="left">
                    <div class="author-name">
                        Beau-zihan
                        <small class="chat-date">
                            08:45
                        </small>
                    </div>
                    <div class="chat-message active">
                        有，购买的H+源码包中有帮助文档，位于docs文件夹下
                    </div>
                </div>
                <div class="right">
                    <div class="author-name">
                        游客
                        <small class="chat-date">
                            11:24
                        </small>
                    </div>
                    <div class="chat-message">
                        那除了帮助文档还提供什么样的服务？
                    </div>
                </div>
                <div class="left">
                    <div class="author-name">
                        Beau-zihan
                        <small class="chat-date">
                            08:45
                        </small>
                    </div>
                    <div class="chat-message active">
                        1.所有源码(未压缩、带注释版本)；
                        <br> 2.说明文档；
                        <br> 3.终身免费升级服务；
                        <br> 4.必要的技术支持；
                        <br> 5.付费二次开发服务；
                        <br> 6.授权许可；
                        <br> ……
                        <br>
                    </div>
                </div>


            </div>
            <div class="form-chat">
                <div class="input-group input-group-sm">
                    <input type="text" class="form-control"> <span class="input-group-btn"> <button
                        class="btn btn-primary" type="button">发送
                </button> </span>
                </div>
            </div>

        </div>
     
     <div id="small-chat">
            <span class="badge badge-warning pull-right">5</span>
            <a class="open-small-chat">
                <i class="fa fa-comments"></i>

            </a>
        </div>
     
        --%>
        
       
        
        
    </div>
        
        
	
	<script type="text/javascript" src="<%=basePath%>static/js/myjs/head.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/jquery-1.7.2.js"></script>
	
	<!--引入弹窗组件start-->
	<script type="text/javascript" src="<%=basePath%>plugins/attention/zDialog/zDrag.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugins/attention/zDialog/zDialog.js"></script>
	<!--引入弹窗组件end-->
	<script type="text/javascript" src="<%=basePath%>static/js/jquery.tips.js"></script>
    
    <script src="<%=basePath%>static/hplus/js/jquery.min.js-v=2.1.4.js" tppabs="http://www.zi-han.net/theme/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=basePath%>static/hplus/js/bootstrap.min.js-v=3.3.5.js" tppabs="http://www.zi-han.net/theme/hplus/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="<%=basePath%>static/hplus/js/plugins/metisMenu/jquery.metisMenu.js" tppabs="http://www.zi-han.net/theme/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="<%=basePath%>static/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js" tppabs="http://www.zi-han.net/theme/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="<%=basePath%>static/hplus/js/plugins/layer/layer.min.js" tppabs="http://www.zi-han.net/theme/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="<%=basePath%>static/hplus/js/hplus.min.js-v=4.0.0.js" tppabs="http://www.zi-han.net/theme/hplus/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="<%=basePath%>static/hplus/js/contabs.min.js" tppabs="http://www.zi-han.net/theme/hplus/js/contabs.min.js"></script>
    <script src="<%=basePath%>static/hplus/js/plugins/pace/pace.min.js" tppabs="http://www.zi-han.net/theme/hplus/js/plugins/pace/pace.min.js"></script>
   
     <div id="jzts" style="display:none; width:100%; position:fixed; z-index:99999999;">
			<div class="commitopacity" id="bkbgjz"></div>
			<div style="padding-left: 70%;padding-top: 1px;">
				<div style="float: left;margin-top: 3px;"><img src="static/images/loadingi.gif" /> </div>
				<div style="margin-top: 5px;"><h4 class="lighter block red">&nbsp;加载中 ...</h4></div>
			</div>
	 </div>

</body>

</html>