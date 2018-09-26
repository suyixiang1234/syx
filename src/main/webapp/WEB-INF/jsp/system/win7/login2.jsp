<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>Thin Admin</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="<%=basePath%>static/final/css/bootstrap.css" rel="stylesheet" media="screen">
<link href="<%=basePath%>static/final/css/thin-admin.css" rel="stylesheet" media="screen">
<link href="<%=basePath%>static/final/css/font-awesome.css" rel="stylesheet" media="screen">
<link href="<%=basePath%>static/final/style/style.css" rel="stylesheet">
<script src="<%=basePath%>static/UI_win7/js/login.js"></script>


	  <script>
    	 var yz = "yes";
	  </script> 
		
		
</head>
<body>
<div class="login-logo">
             <h1 class="form-title">Diamond</h1>
	
    </div>

<div class="widget">
<div class="login-content">
  <div class="widget-content" style="padding-bottom:0;">
  <form  action="" method="post" name="loginForm" id="loginForm" class="no-margin">
                <h3 class="form-title">Login to your account</h3>
                
                <fieldset>
                    <div class="form-group no-margin">
                        <label for="email">username</label>

                        <div class="input-group input-group-lg">
                                <span class="input-group-addon">
                                    <i class="icon-user"></i>
                                </span>
                            <input type="text" placeholder="Your Username" class="form-control input-lg" name="loginname" id="loginname">
                        </div>

                    </div>

                    <div class="form-group">
                        <label for="password">password</label>

                        <div class="input-group input-group-lg">
                                <span class="input-group-addon">
                                    <i class="icon-lock"></i>
                                </span>
                            <input type="password" placeholder="Your Password" class="form-control input-lg" name="password" id="password">
                        </div>

                    </div>
                </fieldset>
                   </form>
               <div class="form-actions">
				<label class="checkbox">
				<div class="checker"><span><input type="checkbox" value="1" name="remember"></span></div> Remember me
				</label>
				<button class="btn btn-warning pull-right" type="button"  onclick="severCheck();" >
				Login <i class="m-icon-swapright m-icon-white"></i>
				</button> 
                <div class="forgot"><a href="#" class="forgot">Diamond Application © 2016-2017 </a></div>           
			</div>
            
            
         
  
  
  </div>
   </div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="<%=basePath%>static/final/js/jquery.js"></script> 
<script src="<%=basePath%>static/final/js/bootstrap.min.js"></script> 



 

<!--switcher html start-->
<div class="demo_changer active" style="right: 0px;">
                <div class="demo-icon"></div>
                <div class="form_holder">
                        

                    <div class="predefined_styles">
                       <img alt="image" class="img-responsive" src="<%=basePath%>static/hplus/img/1476067042.png" style="width:100%"> 
                                                                                        <div align="center"> <font color="#fff">扫一扫登录手机版</font></div>
                        <a class="styleswitch" rel="a" href=""><img alt="" src="<%=basePath%>static/final/images/a.jpg"></a>	
                        <a class="styleswitch" rel="b" href=""><img alt="" src="<%=basePath%>static/final/images/b.jpg"></a>
                        <a class="styleswitch" rel="c" href=""><img alt="" src="<%=basePath%>static/final/images/c.jpg"></a>
                        <a class="styleswitch" rel="d" href=""><img alt="" src="<%=basePath%>static/final/images/d.jpg"></a>
                        <a class="styleswitch" rel="e" href=""><img alt="" src="<%=basePath%>static/final/images/e.jpg"></a>
                        <a class="styleswitch" rel="f" href=""><img alt="" src="<%=basePath%>static/final/images/f.jpg"></a>
                        <a class="styleswitch" rel="g" href=""><img alt="" src="<%=basePath%>static/final/images/g.jpg"></a>
                        <a class="styleswitch" rel="h" href=""><img alt="" src="<%=basePath%>static/final/images/h.jpg"></a>
                        <a class="styleswitch" rel="i" href=""><img alt="" src="<%=basePath%>static/final/images/i.jpg"></a>
                        <a class="styleswitch" rel="j" href=""><img alt="" src="<%=basePath%>static/final/images/j.jpg"></a>
                    </div>
					                    
                </div>
            </div>
            	<script type="text/javascript" src="<%=basePath%>static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/jquery.cookie.js"></script>
            
    <!--switcher html end-->
<script src="<%=basePath%>static/final/assets/switcher/switcher.js"></script> 
<script src="<%=basePath%>static/final/assets/switcher/moderziner.custom.js"></script> 
<link href="<%=basePath%>static/final/assets/switcher/switcher.css" rel="stylesheet">
<link href="<%=basePath%>static/final/assets/switcher/switcher-defult.css" rel="stylesheet">
<link rel="alternate stylesheet" type="text/css" href="<%=basePath%>static/final/assets/switcher/a.css" title="a" media="all" />
<link rel="alternate stylesheet" type="text/css" href="<%=basePath%>static/final/assets/switcher/b.css" title="b" media="all" />
<link rel="alternate stylesheet" type="text/css" href="<%=basePath%>static/final/assets/switcher/c.css" title="c" media="all" />
<link rel="alternate stylesheet" type="text/css" href="<%=basePath%>static/final/assets/switcher/d.css" title="d" media="all" />
<link rel="alternate stylesheet" type="text/css" href="<%=basePath%>static/final/assets/switcher/e.css" title="e" media="all" />
<link rel="alternate stylesheet" type="text/css" href="<%=basePath%>static/final/assets/switcher/f.css" title="f" media="all" />
<link rel="alternate stylesheet" type="text/css" href="<%=basePath%>static/final/assets/switcher/g.css" title="g" media="all" />
<link rel="alternate stylesheet" type="text/css" href="<%=basePath%>static/final/assets/switcher/h.css" title="h" media="all" />
<link rel="alternate stylesheet" type="text/css" href="<%=basePath%>static/final/assets/switcher/i.css" title="i" media="all" />
<link rel="alternate stylesheet" type="text/css" href="<%=basePath%>static/final/assets/switcher/j.css" title="j" media="all" />

</body>
</html>
