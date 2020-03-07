<%--
  Created by IntelliJ IDEA.
  User: Stephen
  Date: 2020/3/5
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = application.getContextPath();
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>后台新增用户统计</title>

	<script src="<%=path+"/js/amchart/jquery-1.7.1.js"%>" type="text/javascript"></script>
	<script src="<%=path+"/js/amchart/amcharts.js"%>" type="text/javascript"></script>
	<script src="<%=path+"/js/amchart/serial.js"%>" type="text/javascript"></script>
	<script src="<%=path+"/js/amchart/pie.js"%>" type="text/javascript"></script>

	<style type="text/css">
		.main {
			width: 700px;
			height: 400px;
			border: 1px solid #ccc;
			margin: 0 auto;
			margin-top: 100px;
			overflow: hidden;
		}

		#cylindrical {
			width: 700px;
			height: 400px;
			margin-top: -15px;
		}

		#line {
			width: 700px;
			height: 400px;
			margin-top: -15px;
		}

		#pie {
			width: 700px;
			height: 400px;
			margin-top: -15px;
		}
	</style>
</head>
<body>

<h2>全国学员订单状态柱状图</h2>
<div class="main">
	<div id="cylindrical">
	</div>
</div>

<script type="text/javascript">

	var path = "<%=path%>";

	$(document).ready(function () {

		$.ajax({
			type: "post"
			, url: path + '/backchart/queryStudyChart'
			//预期服务器返回的数据类型;
			, datatype: "text"
			//从servlet接收的数据
			, success: function (msg) {
				GetSerialChart(msg);
			}
			, error: function () {
				alert("服务器正忙.....");
			}
		});
	});

	//柱状图
	function GetSerialChart(e) {

		chart = new AmCharts.AmSerialChart();
		chart.dataProvider = e;
		//json数据的key
		chart.categoryField = "name";
		//不选择
		chart.rotate = false;
		//值越大柱状图面积越大
		chart.depth3D = 20;
		//柱子旋转角度角度
		chart.angle = 30;
		var mCtCategoryAxis = chart.categoryAxis;
		mCtCategoryAxis.axisColor = "#efefef";
		//背景颜色透明度
		mCtCategoryAxis.fillAlpha = 0.5;
		//背景边框线透明度
		mCtCategoryAxis.gridAlpha = 0;
		mCtCategoryAxis.fillColor = "#efefef";
		var valueAxis = new AmCharts.ValueAxis();
		//左边刻度线颜色
		valueAxis.axisColor = "#ccc";
		//标题
		valueAxis.title = "全国学员订单状态柱状图";
		//刻度线透明度
		valueAxis.gridAlpha = 0.2;
		chart.addValueAxis(valueAxis);
		var graph = new AmCharts.AmGraph();
		graph.title = "value";
		graph.valueField = "value";
		graph.type = "column";
		//鼠标移入提示信息
		graph.balloonText = "[[category]] [[value]]";
		//边框透明度
		graph.lineAlpha = 0.3;
		//填充颜色
		graph.fillColors = "#b9121b";
		graph.fillAlphas = 1;

		chart.addGraph(graph);

		// CURSOR
		var chartCursor = new AmCharts.ChartCursor();
		chartCursor.cursorAlpha = 0;
		chartCursor.zoomable = false;
		chartCursor.categoryBalloonEnabled = false;
		chart.addChartCursor(chartCursor);

		chart.creditsPosition = "top-right";

		//显示在Main div中
		chart.write("cylindrical");
	}

</script>


</body>
</html>
