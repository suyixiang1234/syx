<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <!--底部任务栏-->
 <%--<div class="menubody TaskAll task-helper"></div>--%>
 <div id="menubody" class="menubody TaskAll"  onselectstart= "return(false);">

    <div title="显示桌面" id="TaskbarShowDesktop"></div>
    <!--系统时间显示处-->
    <a href="javascript:void(0);" class="gettime" title="单击查看时间日历" id="gettime"></a>
    <!--系统声音显示处-->
    <a href="javascript:void(0);" class="soundsys" title="扬声器:100%"></a>
    <!--网络连接显示处-->
    <a href="javascript:void(0);" class="Network" title="宽带连接 Internet访问"></a>
    
    <a href="javascript:void(0);" class="EmailIcon active" id="emailIcon" title="有${pdListlength}条未读邮件" num="${pdListlength}"></a>
    <!--开始按钮-->
    <a href="javascript:void(0);" class="Start" id="Start" title="开始菜单"></a>
    <!--任务显示处-->
    <div id="menulist">
    
    </div>
  </div>
  
  
  <!--内容展示层-->
  <table id="mainbody" class="mainbaody" border="0" cellpadding="0" cellspacing="0"  onselectstart= "return(false);">
    <tr>
      <td>
        <!--时钟日历层-->
        <div id="Clocdiv" class="Clocdiv" >
          <div class="Clocdivt">时间与日历</div>
          <div style="height:186px;">
            <div class="Clocdivl">
              <iframe src="static/UI_win7/program/calendar/index.html" frameborder="0" allowtransparency="true" scrolling="no" width="165" height="170"></iframe>
            </div>
            <div class="Clocdivr">
              <iframe src="static/UI_win7/program/clock/index.html" frameborder="0" allowtransparency="true" scrolling="no" width="160" height="170"></iframe>
            </div>
          </div>
          <div class="Clocdivb">
            <a href="javascript:void(0);" title="功能开发中">更改日期和时间设置...</a>
          </div>
        </div>
        <script type="application/javascript">
    $(function() {
    $( "#slider-vertical" ).slider({
      orientation: "vertical",
      range: "min",
      min: 0,
      max: 100,
      value: 60,
      slide: function( event, ui ) {
        $( "#amount" ).val( ui.value );
      }
    });
    $( "#amount" ).val( $( "#slider-vertical" ).slider( "value" ) );
	
	var emailNum = $("#emailIcon").attr("num");
	if(emailNum!='0'){
		$("#emailIcon").html(emailNum);
		flashIcon($("#emailIcon"));
		$("#emailIcon").tips({
			side : 1,
			msg : '你有'+emailNum+'条未读邮件',
			bg : '#AE81FF',
			color:'#000',
			time : 5
		});
	}
		
	$("#emailIcon").click(function() {
		var mailNum = $(this).attr("num");
		if(mailNum!="0"){
			$("#EmailDiv").toggle(300).css({"z-index":999});
		}else{
			openWindow('message/list2.do','收信箱');
		}
		
	});


  });

function flashIcon($img){
	var isShow = true;
	setInterval(function(){
		if(isShow){
			$img.addClass("active");
			isShow = false;
		}else{
			$img.removeClass("active");
			isShow = true;
		}
	},500);
}
</script>

        <div class="Soundsysdiv">
          <div class="Soundsysdivt"></div>
          <div>
            <div id="slider-vertical"></div>
          </div>
          <div class="Soundsysdivb"></div>
          <div class="Soundsysvol">
            <a href="javascript:void(0);">
              VOL:
              <input type="text" disabled="disabled" id="amount" size="2" maxlength="5" readonly="readonly" />
            </a>
          </div>
          <div class="Soundsystxt">
            <a href="javascript:void(0);">合成器(X)</a>
          </div>
        </div>
        <!--宽带连接层-->
        <div class="BoxDiv Networkdiv" id="Networkdiv">
          <div class="Networkdivt">
            <div style="height:20px;">
              <div class="Networkdivtxt">当前连接到:</div>
              <div class="Netupdate">
                <a href="javascript:void(0);">
                  <img src="static/UI_win7/images/desktop/update.jpg" alt="点击更新"/>
                </a>
              </div>
            </div>
            <div style="height:40px;">
              <div class="Localnet">
                <a href="javascript:void(0);">
                  <img src="static/UI_win7/images/desktop/Localnet.jpg" />
                </a>
              </div>
              <div class="Localnetxt"> <b>宽带连接</b>
              </br>
              Internet访问AJ的网络桌面
            </div>
          </div>
          <div class="netitle">拨号和VPN</div>
        </div>
        <div class="Networkdivm">
          <div class="Networkdivmc"></div>
          <div class="Networkdivmbt">
            <a href="javascript:void(0);">打开网络和共享中心</a>
          </div>
        </div>
        <div class="Networkdivb"></div>
      </div>
      
      
         <!--宽带连接层-->
        <div class="BoxDiv EmailDiv" id="EmailDiv">
          <div class="Networkdivt"></div>
          <div class="Networkdivm">
          		<ul class="email-ul">
				<c:forEach items="${pdList}" var="msg" begin="0" end="5">
					<li>
						<a href="javascript:void(0);" data-id="${msg.MESSAGE_ID}" class="mail-item">
							<img alt="Alex's Avatar" class="msg-photo" src="static/avatars/avatar.png">
								<span class="msg-body">
									<span class="msg-title" title="${msg.TITLE}">
										<span class="msg-nick">${msg.FUSERNAME}:</span>
										${msg.TITLE}
									</span>
									<span class="msg-time">
										<i class="icon-time"></i> <span>${msg.DATE}</span>
									</span>
								</span>
						</a>
					</li>
				</c:forEach>
				</ul>
          <div class="Networkdivmbt">
            <a href="javascript:void(0);" onclick="openWindow('message/list2.do','收信箱')">查看所有邮件</a>
          </div>
        </div>
        <div class="Networkdivb"></div>
      </div>
      <!--开始菜单层--> </td>
  </tr>
</table>

<script type="text/javascript">
	$(function(){
		$(".mail-item").click(function(){
			var Id = $(this).data("id");
			var mailNum = $("#emailIcon").attr("num");
			if(mailNum<=1){
				$(".EmailDiv").hide();
			}
			
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="查阅";
			 diag.URL = '<%=basePath%>message/goEdit.do?MESSAGE_ID='+Id;
			 diag.Width = 650;
			 diag.Height = 555;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
			 mailNum--;
			$("#emailIcon").attr({"num":mailNum}).html(mailNum);
			$(this).remove();
			 
			
		});
	});
		</script>