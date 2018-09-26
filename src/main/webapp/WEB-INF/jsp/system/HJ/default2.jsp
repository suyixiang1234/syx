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
<html lang="en">
<head>
<base href="<%=basePath%>">

<!-- jsp文件头和头部 -->
<%@ include file="top.jsp"%>
		<script type="text/javascript" src="static/js/myjs/head.js"></script>
</head>
<body>
	<div class="container-fluid" id="main-container">
			<div id="page-content" class="clearfix">
				<div class="page-header position-relative">
					<h1>
						管理员首页 <small><i class="icon-double-angle-right"></i> </small>
					</h1>
				</div>
			
				<h3 class="header smaller red">金额统计</h3>
<div class="row-fluid">
	<div class="span3">
		<div class="widget-box transparent">
			<div class="widget-header">
				<h5 class="bigger lighter">总额统计</h5>
			</div>
			<div class="widget-body">
			 <div class="widget-main no-padding">
				<ul class="unstyled list-striped pricing-table-header">
					<li>今日总额</li>
					<li>累计总额</li>
					<li>单位</li>
				</ul>
			 </div>
			</div>
		</div>
	</div>
	<div class="span2 pricing-span" >
		<div class="widget-box pricing-box-small">
			<div class="widget-header header-color-red3">
				<h5 class="bigger lighter">充值总额</h5>
			</div>
			<div class="widget-body">
			 <div class="widget-main no-padding">
				<ul class="unstyled list-striped pricing-table">
					<li>${tol}</li>
					<li>${tol1}</li>
				</ul>
				
				<div class="price">
					<span class="label label-large label-inverse arrowed-in arrowed-in-right"><small>币值</small></span>
				</div>
			 </div>
			 <div>
				<a href="javascript:void(0)" onclick="siMenu('z47','lm46','充值审核','payapply/lista.do')" title="点击查看详情" class="btn btn-block btn-small btn-danger"><span>查看详情</span></a>
			 </div>
			</div>
		</div>
	</div>
	
	<div class="span2 pricing-span">
		<div class="widget-box pricing-box-small">
			<div class="widget-header header-color-orange">
				<h5 class="bigger lighter">提现总额</h5>
			</div>
			<div class="widget-body">
			 <div class="widget-main no-padding">
				<ul class="unstyled list-striped pricing-table">
					<li>${tol2}</li>
					<li>${tol3}</li>
				</ul>
				<div class="price">
					<div class="label label-large label-inverse arrowed-in arrowed-in-right"><small>币值</small></div>
				</div>
			 </div>
			 <div>
				<a href="javascript:void(0)" onclick="siMenu('z48','lm46','提现审核','moneyapply/lista.do')" title="点击查看详情" class="btn btn-block btn-small btn-warning"><span>查看详情</span></a>
			 </div>
			</div>
		</div>
	</div>
	
	<div class="span2 pricing-span">
		<div class="widget-box pricing-box-small">
			<div class="widget-header header-color-blue">
				<h5 class="bigger lighter">保值总额</h5>
			</div>
			<div class="widget-body">
			 <div class="widget-main no-padding">
				<ul class="unstyled  list-striped pricing-table">
					<li>${tol4}</li>
					<li>${tol5}</li>
				</ul>
				<div class="price">
					<div class="label label-large label-inverse arrowed-in arrowed-in-right"><small>币值</small></div>
				</div>
			 </div>
			 <div>
				<a  href="javascript:void(0)" onclick="siMenu('z49','lm46','保值审核','tuiben/lista.do')" title="点击查看详情"  class="btn btn-block btn-small btn-primary"><span>查看详情</span></a>
			 </div>
			</div>
		</div>
	</div>
	
	<div class="span2 pricing-span">
		<div class="widget-box pricing-box-small">
			<div class="widget-header header-color-green">
				<h5 class="bigger lighter">激活总额</h5>
			</div>
			<div class="widget-body">
			 <div class="widget-main no-padding">
				<ul class="unstyled list-striped  pricing-table">
					<li>${tol6}</li>
					<li>${tol7}</li>
				</ul>
				<div class="price">
					<div class="label label-large label-inverse arrowed-in arrowed-in-right"><small>币值</small></div>
				</div>
			 </div>
			 <div>
				<a  href="javascript:void(0)" onclick="siMenu('z66','lm46','激活信息','activeuser/lista.do')" class="btn btn-block btn-small btn-success"><span>查看详情</span></a>
			 </div>
			</div>
		</div>
	</div>
	
	
	<div class="span2 pricing-span">
		<div class="widget-box pricing-box-small">
			<div class="widget-header header-color-grey">
				<h5 class="bigger lighter">所有会员剩余币值</h5>
			</div>
			<div class="widget-body">
			 <div class="widget-main no-padding">
				<ul class="unstyled list-striped  pricing-table">
					<li>${tol8}</li>
					<li>${tol8}</li>
				</ul>
				<div class="price">
					<div class="label label-large label-inverse arrowed-in arrowed-in-right"><small>币值</small></div>
				</div>
			 </div>
			 <div>
				<a class="btn btn-block btn-small btn-grey"><span>总额</span></a>
			 </div>
			</div>
		</div>
	</div>
</div>		
						
	
 
 
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
	
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
						
						
						<div class="row-fluid">
						 <div class="">
							<div class="widget-box transparent">
								
								<div class="widget-header">
									<h4 class="lighter smaller"><i class="icon-rss orange"></i>公告</h4>
									<div class="widget-toolbar no-border">
										<ul class="nav nav-tabs" id="recent-tab">
<!-- 											<li class="active"><a data-toggle="tab" href="#task-tab">Tasks</a></li> -->
<!-- 											<li class="active"><a data-toggle="tab" href="#member-tab">Members</a></li> -->
										</ul>
									</div>
								</div>
								
								<div class="widget-body">
								 <div class="widget-main padding-5">
									<div class="tab-content padding-8">
										
										
										
										<div id="comment-tab" class="tab-pane active">
											<div class="comments">
												
												
							<!-- 开始循环 -->	
							 <c:choose>
								<c:when test="${not empty varList}">
									<c:forEach items="${varList}" var="var" varStatus="vs">
											
											
											<div class="itemdiv commentdiv">
													<div class="user">
														<img alt="Bob's Avatar" src="avatars/avatar.png" />
													</div>
													
													<div class="body">
														<div class="name">${var.TITLE}</div>
														<div class="time"><i class="icon-time"></i> <span class="green">${var.DATE}</span></div>
														<div class="text">
															<i class="icon-quote-left"></i><a  onclick="edit('${var.NOTICE_ID}');" href="javascrip:void(0);" title="点击查看详情"> ${var.CONTENT}&hellip;</a>
														</div>
													</div>
											</div>
									
									</c:forEach>
								</c:when>
								<c:otherwise>
							
								</c:otherwise>
							</c:choose>
												
									
												
											</div>
											
											<div class="hr hr8"></div>
<!-- 											<div class="center"> -->
<!-- 													<i class="icon-comments-alt icon-2x green"></i> &nbsp; <a href="#">See all comments &nbsp; <i class="icon-arrow-right"></i></a> -->
<!-- 											</div> -->
											<div class="hr hr-double hr8"></div>
											
										</div>
									</div>
								 </div><!--/widget-main-->
								</div><!--/widget-body-->
								
								
							</div><!--/widget-box-->
						 </div><!--/span-->
						 
				 
			




		</div>
		<!-- #main-content -->
	</div>
	<!--/.fluid-container#main-container-->
	<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse"> <i
		class="icon-double-angle-up icon-only"></i>
	</a>
	<!-- basic scripts -->
	
	
	
	
	
	
	<script src="static/1.9.1/jquery.min.js"></script>
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>

	<script src="static/js/bootstrap.min.js"></script>
	<!-- page specific plugin scripts -->
	<!-- inline scripts related to this page -->


	<script type="text/javascript">

	
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="公告详情";
			 diag.URL = '<%=basePath%>notice/goView.do?NOTICE_ID='+Id;
			 diag.Width = 450;
			 diag.Height = 355;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
	
	
		$(function() {
			$('.dialogs,.comments').slimScroll({
				height : '300px'
			});

			$('#tasks').sortable();
			$('#tasks').disableSelection();
			$('#tasks input:checkbox').removeAttr('checked').on('click',
					function() {
						if (this.checked)
							$(this).closest('li').addClass('selected');
						else
							$(this).closest('li').removeClass('selected');
					});
			var oldie = $.browser.msie && $.browser.version < 9;
			$('.easy-pie-chart.percentage')
					.each(
							function() {
								var $box = $(this).closest('.infobox');
								var barColor = $(this).data('color')
										|| (!$box.hasClass('infobox-dark') ? $box
												.css('color')
												: 'rgba(255,255,255,0.95)');
								var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)'
										: '#E2E2E2';
								var size = parseInt($(this).data('size')) || 50;
								$(this).easyPieChart({
									barColor : barColor,
									trackColor : trackColor,
									scaleColor : false,
									lineCap : 'butt',
									lineWidth : parseInt(size / 10),
									animate : oldie ? false : 1000,
									size : size
								});
							})
			$('.sparkline').each(
					function() {
						var $box = $(this).closest('.infobox');
						var barColor = !$box.hasClass('infobox-dark') ? $box
								.css('color') : '#FFF';
						$(this).sparkline('html', {
							tagValuesAttribute : 'data-values',
							type : 'bar',
							barColor : barColor,
							chartRangeMin : $(this).data('min') || 0
						});
					});

			var data = [ {
				label : "日分红奖金",
				data :0,
				color : "#68BC31"
			}, {
				label : "直推奖奖金",
				data :0,
				color : "#2091CF"
			}, {
				label : "对碰奖",
				data : 0,
				color : "#AF4E96"
			}, {
				label : "报单中心",
				data : 0,
				color : "#FEE074"
			} ];
			var placeholder = $('#piechart-placeholder').css({
				'width' : '90%',
				'min-height' : '150px'
			});
			$.plot(placeholder, data, {

				series : {
					pie : {
						show : true,
						tilt : 0.8,
						highlight : {
							opacity : 0.25
						},
						stroke : {
							color : '#fff',
							width : 2
						},
						startAngle : 2

					}
				},
				legend : {
					show : true,
					position : "ne",
					labelBoxBorderColor : null,
					margin : [ -30, 15 ]
				},
				grid : {
					hoverable : true,
					clickable : true
				},
				tooltip : true, //activate tooltip
				tooltipOpts : {
					content : "%s : %y.1",
					shifts : {
						x : -30,
						y : -50
					}
				}

			});

			var $tooltip = $(
					"<div class='tooltip top in' style='display:none;'><div class='tooltip-inner'></div></div>")
					.appendTo('body');
			placeholder.data('tooltip', $tooltip);
			var previousPoint = null;
			placeholder.on('plothover', function(event, pos, item) {
				if (item) {
					if (previousPoint != item.seriesIndex) {
						previousPoint = item.seriesIndex;
						var tip = item.series['label'] + " : "
								+ item.series['percent'] + '%';
						$(this).data('tooltip').show().children(0).text(tip);
					}
					$(this).data('tooltip').css({
						top : pos.pageY + 10,
						left : pos.pageX + 10
					});
				} else {
					$(this).data('tooltip').hide();
					previousPoint = null;
				}

			});
			var d1 = [];
			for (var i = 0; i < Math.PI * 2; i += 0.5) {
				d1.push([ i, Math.sin(i) ]);
			}
			var d2 = [];
			for (var i = 0; i < Math.PI * 2; i += 0.5) {
				d2.push([ i, Math.cos(i) ]);
			}
			var d3 = [];
			for (var i = 0; i < Math.PI * 2; i += 0.2) {
				d3.push([ i, Math.tan(i) ]);
			}

			var sales_charts = $('#sales-charts').css({
				'width' : '100%',
				'height' : '220px'
			});
			$.plot("#sales-charts", [ {
				label : "Domains",
				data : d1
			}, {
				label : "Hosting",
				data : d2
			}, {
				label : "Services",
				data : d3
			} ], {
				hoverable : true,
				shadowSize : 0,
				series : {
					lines : {
						show : true
					},
					points : {
						show : true
					}
				},
				xaxis : {
					tickLength : 0
				},
				yaxis : {
					ticks : 10,
					min : -2,
					max : 2,
					tickDecimals : 3
				},
				grid : {
					backgroundColor : {
						colors : [ "#fff", "#fff" ]
					},
					borderWidth : 1,
					borderColor : '#555'
				}
			});
			$('[data-rel="tooltip"]').tooltip();
		})
	</script>
</body>
</html>
