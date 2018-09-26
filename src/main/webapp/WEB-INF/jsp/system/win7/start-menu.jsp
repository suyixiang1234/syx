<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <!-- 开始 菜单  -->
  <div id="Start-Menu">
  	<!-- 开始 菜单  左侧-->
    <div class="start-left">
      <ul>
      	<c:forEach items="${menuList}" var="menu">
			<c:if test="${menu.hasMenu}">
				<li id="lm${menu.MENU_ID }">
					<a href="javascript:void()"  class="one-menu">
				    	<img src="static/UI_win7/images/desktop/Startmenu/default.png">
				        <span>${menu.MENU_NAME}</span>
				        <ul style="display: none;">
							<c:forEach items="${menu.subMenu}" var="sub">
								<c:if test="${sub.hasMenu}">
									<li href="${sub.MENU_URL}" src="${sub.MENU_ICON}">${sub.MENU_NAME}</li>
								</c:if>
							</c:forEach>
						</ul>
				    </a>
				</li>
			</c:if>
		</c:forEach>
      </ul>
    </div>
    <!-- 开始 菜单  右侧-->
    <div class="start-right">
      <img src="static/UI_win7/images/desktop/Startmenu/ie.png" id="startHeadImg"/>
      <div id="twoMenu">
	      <ul id="systemMenu" >
	     	 
	     	<c:if test="${user.USER_ID == 'admin'}">
	     
	        <li>
	          <a href="javascript:menu();" title="菜单管理" src="static/UI_win7/images/desktop/Startmenu/ie.png">菜单管理</a>
	        </li>
	        <li>
	          <a href="javascript:zidian();" src="static/UI_win7/images/desktop/Startmenu/myfile.png">数据字典</a>
	        </li>
	        <li>
	          <a href="javascript:editSys();" src="static/UI_win7/images/desktop/Startmenu/mymessage.png">系统设置</a>
	        </li>
	        <li>
	          <a href="javascript:productCode();" src="static/UI_win7/images/desktop/Startmenu/mymessage.png">代码生成</a>
	        </li>
	        <li>
	          <a href="javascript:editUserH();" src="static/UI_win7/images/desktop/Startmenu/mymessage.png">修改个人资料</a>
	        </li>
	        
	        </c:if>
	        
	        
	        <c:if test="${user.USER_ID  != 'admin'}">
	     
	        <li>
	          <a href="javascript:editUserH();" src="static/UI_win7/images/desktop/Startmenu/mymessage.png">修改个人资料</a>
	        </li>
	        
	        </c:if>
	        
	      
	      </ul>
      </div>
        <div class="start-btn">
          <a href="logout" class="start-btn-main">退出</a>
        </div>

    </div>
	
   

  </div>