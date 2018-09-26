<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <div id="DesktopIcons">
      <ul>
      		<!-- 左侧菜单 -->
			<c:forEach items="${menuList}" var="menu">
				<c:if test="${menu.hasMenu}"><%--
				<li id="lm${menu.MENU_ID }">
					  <a style="cursor:pointer;" class="dropdown-toggle" >
						<i class="${menu.MENU_ICON == null ? 'icon-desktop' : menu.MENU_ICON}"></i>
						<span>${menu.MENU_NAME }</span>
						<b class="arrow icon-angle-down"></b>
					  </a>
					  <ul class="submenu">
							--%><c:forEach items="${menu.subMenu}" var="sub">
								<c:if test="${sub.hasMenu}">
								<c:choose>
									<c:when test="${not empty sub.MENU_URL}">
									  <a href="${sub.MENU_URL }">
          					<img src="static/UI_win7/images/desktop/Startmenu/mypc.png">${sub.MENU_NAME }</a>
									<%--<li id="z${sub.MENU_ID }">
									<a style="cursor:pointer;" target="mainFrame"  onclick="siMenu('z${sub.MENU_ID }','lm${menu.MENU_ID }','${sub.MENU_NAME }','${sub.MENU_URL }')"><i class="icon-double-angle-right"></i>${sub.MENU_NAME }</a></li>
									--%>
									</c:when>
									<c:otherwise>
									<%--<li><a href="javascript:void(0);"><i class="icon-double-angle-right"></i>${sub.MENU_NAME }</a></li>--%>
									</c:otherwise>
								</c:choose>
								</c:if>
							</c:forEach><%--
				  	 </ul>
				</li>
				--%></c:if>
			</c:forEach>
    </ul>
    </div>
      <script type="text/javascript">



function openWin(){

    var diag = new top.Dialog();
       diag.Drag=true;
       diag.Title ="新增2";
       diag.URL = 'static/UI_win7/test.html';
       diag.Width = 500;
       diag.Height = 355;
       diag.CancelEvent=function(){
    	   alert(22);
    	   diag.close();
       };
       diag.show();




}

</script>