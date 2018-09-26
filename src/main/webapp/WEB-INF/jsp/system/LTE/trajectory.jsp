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
  <title>轨迹分析</title>
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
 
  <!-- Google Font     sidebar-mini wysihtml5-supported skin-black sidebar-collapse -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini" style="background-color:#ECF0F5">
</br>
       
  <div id="main" style="width: 100%;height:100%;"></div>

<!-- jQuery 3 -->
<script src="<%=basePath%>/static/adminLTE/bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="<%=basePath%>/static/adminLTE/bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="<%=basePath%>/static/adminLTE/echarts.min.js"></script>
<script src="http://cdn.sockjs.org/sockjs-0.3.min.js"></script>
<script type="text/javascript">
   
   var myChart = echarts.init(document.getElementById('main'));
	
	option = {
    title: {
        text: '资产轨迹分析'
    },
    tooltip: {},
    legend: {
        data: ['信息强度峰值（Allocated Budget）', '（实际值）该苹果手机资产在不同锚点监测范围的信号强度（标签id：93E13300）']
    },
    radar: {
        // shape: 'circle',
        name: {
            textStyle: {
                color: '#fff',
                backgroundColor: '#999',
                borderRadius: 3,
                padding: [3, 5]
           }
        },
        indicator: [
           { name: '锚点1（陈艺魏办公室）', max: 6500},
           { name: '锚点2（苏奕祥办公位置）', max: 6500},
           { name: '锚点3（暂无）', max: 6500},
           { name: '锚点4（暂无）', max: 6500}
        ]
    },
    series: [{
        name: '预算 vs 开销（Budget vs spending）',
        type: 'radar',
        // areaStyle: {normal: {}},
        data : [
            {
                value : [7700, 7700, 7700, 7700],
                name : '信息强度峰值（Allocated Budget）'
            },
             {
                value : [2000, 8000, 9000, 5500],
                name : '（实际值）该苹果手机资产在不同锚点监测范围的信号强度（标签id：93E13300）'
            }
        ]
    }]
};
	
	 // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
	
</script>


</body>
</html>
