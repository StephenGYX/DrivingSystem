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

<h2>全国学员订单状态饼图</h2>
<div class="main">
	<div id="pie">
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
				MakeChart(msg);
			}
			, error: function () {
				alert("服务器正忙.....");
			}
		});
	});


	//饼图
	//根据json数据生成饼状图，并将饼状图显示到div中
	function MakeChart(value) {
		chartData = eval(value);
		//饼状图
		chart = new AmCharts.AmPieChart();
		chart.dataProvider = chartData;
		//标题数据
		chart.titleField = "name";
		//值数据
		chart.valueField = "value";
		//边框线颜色
		chart.outlineColor = "#fff";
		//边框线的透明度
		chart.outlineAlpha = .8;
		//边框线的狂宽度
		chart.outlineThickness = 1;
		chart.depth3D = 20;
		chart.angle = 30;
		chart.write("pie");
	}

</script>


</body>
</html>
