<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String wsBasePath = request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>监控中心</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="<%=basePath%>/static/adminLTE/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<%=basePath%>/static/adminLTE/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="<%=basePath%>/static/adminLTE/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=basePath%>/static/adminLTE/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="<%=basePath%>/static/adminLTE/dist/css/skins/_all-skins.min.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="<%=basePath%>/static/adminLTE/bower_components/morris.js/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="<%=basePath%>/static/adminLTE/bower_components/jvectormap/jquery-jvectormap.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="<%=basePath%>/static/adminLTE/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="<%=basePath%>/static/adminLTE/bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="<%=basePath%>/static/adminLTE/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font     sidebar-mini wysihtml5-supported skin-black sidebar-collapse -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>


<body class="hold-transition skin-blue sidebar-mini" style="background-color:#ECF0F5">

      </br>
       
      <section class="col-lg-12 connectedSortable">
		   <div class="box box-default">
            <div class="box-header with-border">
              <i class="fa fa-warning"></i>
              <h3 class="box-title">实时警报提示</h3>
            </div>
            <div class="box-body" id="set_data" style="overflow:auto; width: auto; height: 110px;" >
            </div>
          </div>
           <span id="sdata" class="box box-default">
          </span>
        </section>
        <!-- /.Left col -->

<!-- jQuery 3 -->
<script src="<%=basePath%>/static/adminLTE/bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="<%=basePath%>/static/adminLTE/bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
   <!-- Bootstrap 3.3.7 -->

   <!--引入弹窗组件start-->
<script type="text/javascript" src="<%=basePath%>plugins/attention/zDialog/zDrag.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/attention/zDialog/zDialog.js"></script>
<!--引入弹窗组件end-->
<script src="<%=basePath%>/static/adminLTE/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="<%=basePath%>/static/adminLTE/bower_components/raphael/raphael.min.js"></script>
<script src="<%=basePath%>/static/adminLTE/bower_components/morris.js/morris.min.js"></script>
<!-- Sparkline -->
<script src="<%=basePath%>/static/adminLTE/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="<%=basePath%>/static/adminLTE/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="<%=basePath%>/static/adminLTE/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="<%=basePath%>/static/adminLTE/bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="<%=basePath%>/static/adminLTE/bower_components/moment/min/moment.min.js"></script>
<script src="<%=basePath%>/static/adminLTE/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="<%=basePath%>/static/adminLTE/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="<%=basePath%>/static/adminLTE/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="<%=basePath%>/static/adminLTE/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="<%=basePath%>/static/adminLTE/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="<%=basePath%>/static/adminLTE/dist/js/adminlte.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<%=basePath%>/static/adminLTE/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=basePath%>/static/adminLTE/dist/js/demo.js"></script>
<!-- ChartJS -->
<script src="<%=basePath%>/static/adminLTE/bower_components/chart.js/Chart.js"></script>


<script src="http://cdn.sockjs.org/sockjs-0.3.min.js"></script>


<!-- FLOT CHARTS -->
<script src="<%=basePath%>/static/adminLTE/bower_components/Flot/jquery.flot.js"></script>
<!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
<script src="<%=basePath%>/static/adminLTE/bower_components/Flot/jquery.flot.resize.js"></script>
<!-- FLOT PIE PLUGIN - also used to draw donut charts -->
<script src="<%=basePath%>/static/adminLTE/bower_components/Flot/jquery.flot.pie.js"></script>
<!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts -->
<script src="<%=basePath%>/static/adminLTE/bower_components/Flot/jquery.flot.categories.js"></script>

<script>
  $(function () {
    /*
     * Flot Interactive Chart
     * -----------------------
     */
    // We use an inline data source in the example, usually data would
    // be fetched from a server
    var data = [], totalPoints = 100

    function getRandomData() {

      if (data.length > 0)
        data = data.slice(1)

      // Do a random walk
      while (data.length < totalPoints) {

        var prev = data.length > 0 ? data[data.length - 1] : 50,
            y    = prev + Math.random() * 10 - 5

        if (y < 0) {
          y = 0
        } else if (y > 100) {
          y = 100
        }

        data.push(y)
      }

      // Zip the generated y values with the x values
      var res = []
      for (var i = 0; i < data.length; ++i) {
        res.push([i, data[i]])
      }

      return res
    }

    var interactive_plot = $.plot('#interactive', [getRandomData()], {
      grid  : {
        borderColor: '#f3f3f3',
        borderWidth: 1,
        tickColor  : '#f3f3f3'
      },
      series: {
        shadowSize: 0, // Drawing is faster without shadows
        color     : '#3c8dbc'
      },
      lines : {
        fill : true, //Converts the line chart to area chart
        color: '#3c8dbc'
      },
      yaxis : {
        min : 0,
        max : 100,
        show: true
      },
      xaxis : {
        show: true
      }
    })

    var updateInterval = 500 //Fetch data ever x milliseconds
    var realtime       = 'on' //If == to on then fetch data every x seconds. else stop fetching
    function update() {

      interactive_plot.setData([getRandomData()])

      // Since the axes don't change, we don't need to call plot.setupGrid()
      interactive_plot.draw()
      if (realtime === 'on')
        setTimeout(update, updateInterval)
    }

    //INITIALIZE REALTIME DATA FETCHING
    if (realtime === 'on') {
      update()
    }
    //REALTIME TOGGLE
    $('#realtime .btn').click(function () {
      if ($(this).data('toggle') === 'on') {
        realtime = 'on'
      }
      else {
        realtime = 'off'
      }
      update()
    })
    /*
     * END INTERACTIVE CHART
     */

    /*
     * LINE CHART
     * ----------
     */
    //LINE randomly generated data

    var sin = [], cos = []
    for (var i = 0; i < 14; i += 0.5) {
      sin.push([i, Math.sin(i)])
      cos.push([i, Math.cos(i)])
    }
    var line_data1 = {
      data : sin,
      color: '#3c8dbc'
    }
    var line_data2 = {
      data : cos,
      color: '#00c0ef'
    }
    $.plot('#line-chart', [line_data1, line_data2], {
      grid  : {
        hoverable  : true,
        borderColor: '#f3f3f3',
        borderWidth: 1,
        tickColor  : '#f3f3f3'
      },
      series: {
        shadowSize: 0,
        lines     : {
          show: true
        },
        points    : {
          show: true
        }
      },
      lines : {
        fill : false,
        color: ['#3c8dbc', '#f56954']
      },
      yaxis : {
        show: true
      },
      xaxis : {
        show: true
      }
    })
    //Initialize tooltip on hover
    $('<div class="tooltip-inner" id="line-chart-tooltip"></div>').css({
      position: 'absolute',
      display : 'none',
      opacity : 0.8
    }).appendTo('body')
    $('#line-chart').bind('plothover', function (event, pos, item) {

      if (item) {
        var x = item.datapoint[0].toFixed(2),
            y = item.datapoint[1].toFixed(2)

        $('#line-chart-tooltip').html(item.series.label + ' of ' + x + ' = ' + y)
          .css({ top: item.pageY + 5, left: item.pageX + 5 })
          .fadeIn(200)
      } else {
        $('#line-chart-tooltip').hide()
      }

    })
    /* END LINE CHART */

    /*
     * FULL WIDTH STATIC AREA CHART
     * -----------------
     */
    var areaData = [[2, 88.0], [3, 93.3], [4, 102.0], [5, 108.5], [6, 115.7], [7, 115.6],
      [8, 124.6], [9, 130.3], [10, 134.3], [11, 141.4], [12, 146.5], [13, 151.7], [14, 159.9],
      [15, 165.4], [16, 167.8], [17, 168.7], [18, 169.5], [19, 168.0]]
    $.plot('#area-chart', [areaData], {
      grid  : {
        borderWidth: 0
      },
      series: {
        shadowSize: 0, // Drawing is faster without shadows
        color     : '#00c0ef'
      },
      lines : {
        fill: true //Converts the line chart to area chart
      },
      yaxis : {
        show: false
      },
      xaxis : {
        show: false
      }
    })

    /* END AREA CHART */

    /*
     * BAR CHART
     * ---------
     */

    var bar_data = {
      data : [['产品部', 10],['业务部', 20],['研发部', 30],['综合部', 3], ['前端部', 8]],
      color: '#3c8dbc'
    }
    $.plot('#bar-chart', [bar_data], {
      grid  : {
        borderWidth: 1,
        borderColor: '#f3f3f3',
        tickColor  : '#f3f3f3'
      },
      series: {
        bars: {
          show    : true,
          barWidth: 0.5,
          align   : 'center'
        }
      },
      xaxis : {
        mode      : 'categories',
        tickLength: 0
      }
    })
    /* END BAR CHART */

    /*
     * DONUT CHART
     * -----------
     */

    var donutData = [
      { label: '产品部', data: 20, color: '#0073b7' },
      { label: '业务部', data: 20, color: '#0073b7' },
      { label: '人事部', data: 20, color: '#0073b7' },
      { label: '综合部', data: 50, color: '#00c0ef' }
    ]
    $.plot('#donut-chart', donutData, {
      series: {
        pie: {
          show       : true,
          radius     : 1,
          innerRadius: 0.5,
          label      : {
            show     : true,
            radius   : 2 / 3,
            formatter: labelFormatter,
            threshold: 0.1
          }

        }
      },
      legend: {
        show: false
      }
    })
    /*
     * END DONUT CHART
     */

  })

  /*
   * Custom Label formatter
   * ----------------------
   */
  function labelFormatter(label, series) {
    return '<div style="font-size:13px; text-align:center; padding:2px; color: #fff; font-weight: 600;">'
      + label
      + '<br>'
      + Math.round(series.percent) + '%</div>'
  }
</script>


<script type="text/javascript">
	//显示加载进度
	function jzts(){
		$("#jzts").show();
	}
	//清除加载进度
	function hangge(){
		$("#jzts").hide();
	}
	function tags(url){
		var urls = '<iframe class="J_iframe box box-primary" name="mainFrame1"  id="mainFrame1" width="100%" height="800px" src="<%=basePath%>'+url+'" frameborder="0" data-id="<%=basePath%>login_default.do" seamless></iframe>';
		//alert(urls)
		document.getElementById("J_iframe").innerHTML = urls
	}
	
	
	var users = "FH";	//用于即时通讯（ 当前登录用户）
	$(function(){
		$.ajax({
			type: "POST",
			url: '<%=basePath%>head/getUname.do?tm='+new Date().getTime(),
	    	data: encodeURI(""),
			dataType:'json',
			//beforeSend: validateData,
			cache: false,
			success: function(data){
				 $.each(data.list, function(i, list){
					 users = list.USERNAME;
				 });
			}
		});
	});
	
	
	$(function() {
		var websocket;
		var id;//
		var playerCardNumber;//
		var dealerCardNumber;//
		var gameStatus = 5;//
		var conuts = 1;//测试初始数据
		var flat = 1;//判断是否准备
		websocket = new WebSocket("ws://<%=wsBasePath%>echo");
		websocket.onopen = function(evnt) {
			//连接成功
			websocket.send(users);
		};
		websocket.onmessage = function(evnt) {
			 var data = evnt.data;
			 console.log(data);
			 if(data[0]=="o") {
				 var msg= data.slice(1);
				 var htmls = "";
				 htmls+= '<ul class="timeline">'
				 htmls+= '<li class="time-label">'
				 htmls+= '<span class="bg-red">'
				 htmls+= '实时数据监测中心';
				 htmls+= '</span>'
				 htmls+= '</li>'
				 htmls+= '<li>';
				 htmls+= '<i class="fa fa-envelope bg-blue"></i>';
				 htmls+= '<div class="timeline-item">';
				// htmls+= '<span class="time"><i class="fa fa-clock-o"></i>'+msg.slice(50,69)+'</span>';
			     htmls+= '<h3 class="timeline-header">'
			    // htmls+= '<a href="#">锚点id:'+msg.slice(5,13)+'</a>';
			     htmls+= '</h3>';
				 htmls+= '<div class="timeline-body">';
				 htmls+= data.slice(1);
	           	 htmls+= '</div>';
	             htmls+= '<div class="timeline-footer">';
	             htmls+= '<a class="btn btn-primary btn-xs">Read more</a>';
	             htmls+= '<a class="btn btn-danger btn-xs">Delete</a>';
	             htmls+= '</div>';
	             htmls+= '</div>';
	             htmls+= '</li>';
	             htmls+= '<li><i class="fa fa-clock-o bg-gray"></i></li>'
	             htmls+= '</ul>';
				 
				 $("#sdata").prepend(htmls); 
			   //$("#sdata").html(data.slice(1));//解析服务器在线人数
			  }
			 if(data[0]=="d") {
				 
				 var htmld = "";
				 htmld+= '<div class="alert alert-danger alert-dismissible">';
				 htmld+= '<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>';
				 htmld+= '<h4><i class="icon fa fa-ban"></i> 警报!</h4>';
				 htmld+=  data.slice(1);
				 htmld+= '</div>';
				 $("#set_data").prepend(htmld); 
				 
			  }
			 if(data[0]=="y") {
				 alert(data.slice(1));
				
			   //	 $("#set_data").append(htmld); 
			  }
		};

		websocket.onerror = function(evnt) {
		};
		websocket.onclose = function(evnt) {
		};
	
	});
	
	
	
	
	
	
	
</script>





</body>
</html>
