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

<h2>三月份学员新增人数折线图</h2>
<div class="main">
	<div id="line">
	</div>
</div>

<script type="text/javascript">

	var path = "<%=path%>";

	$(document).ready(function () {

		$.ajax({
			type: "post"
			, url: path + '/backchart/queryRegNumChart'
			//预期服务器返回的数据类型;
			, datatype: "text"
			//从servlet接收的数据
			, success: function (msg) {
				zhexiantu(msg);
			}
			, error: function () {
				alert("服务器正忙.....");
			}
		});
	});

	function zhexiantu(e){
		var chart = new AmCharts.AmSerialChart();
		chart.dataProvider = e;
		chart.categoryField = "name";
		chart.angle = 30;
		chart.depth3D = 20;
		//标题
		//chart.addTitle("3D折线图Demo", 15);
		var graph = new AmCharts.AmGraph();
		chart.addGraph(graph);
		graph.valueField = "value";
		//背景颜色透明度
		graph.fillAlphas = 0.3;
		//类型
		graph.type = "line";
		//圆角
		graph.bullet = "round";
		//线颜色
		graph.lineColor = "#8e3e1f";
		//提示信息
		graph.balloonText = "[[name]]: [[value]]";
		var categoryAxis = chart.categoryAxis;
		categoryAxis.autoGridCount = false;
		categoryAxis.gridCount = e.length;
		categoryAxis.gridPosition = "start";
		chart.write("line");
	}

</script>


</body>
</html>
