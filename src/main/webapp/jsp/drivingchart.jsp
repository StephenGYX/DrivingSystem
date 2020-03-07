<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
Created by IntelliJ IDEA.
User: Stephen
Date: 2020/2/14
Time: 17:58
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String  Path = application.getContextPath();
%>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<head>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href=<%=Path+"/lib/layui-v2.5.5/css/layui.css"%>>
	<link rel="stylesheet" href="<%=Path+"/lib/lay-module/step-lay/step.css"%>" media="all">
	<script src=<%=Path+"/lib/layui-v2.5.5/layui.js"%>></script>
	<script type="text/javascript" src=<%=Path+"/lib/jquery-3.4.1/jquery-3.4.1.min.js"%>></script>
	<script type="text/javascript" src=<%=Path+"/js/json2.js"%>></script>
	<script type="text/javascript" src=<%=Path+"/js/echarts.min.js"%>></script>
	<script src=<%=Path+"/js/lay-config.js?v=1.0.4"%> charset="utf-8"></script>
	<title>Title</title>
</head>
<body>

<table>
	<tr>
		<td>
			<div id="main" style="width: 600px;height:400px;"></div>
			<script type="text/javascript">
				// 基于准备好的dom，初始化echarts实例
				var myChart = echarts.init(document.getElementById('main'));
				var url = '/springboot/chart';
				// 指定图表的配置项和数据
				$.getJSON(url).done(function(json) {
					var ary = new Array();
					var ary1 = new Array();
					for(var i=0;i<json.length;i++){
						ary.push(json[i].pname)
						ary1.push(json[i].pcount)
					}

					option = {
						title : {
							text: '所有教练的学员人数'
						},
						tooltip : {
							trigger: 'axis'
						},
						legend: {
							data:['学员人数']
						},
						toolbox: {
							show : true,
							feature : {
								dataView : {show: true, readOnly: false},
								magicType : {show: true, type: ['line', 'bar']},
								restore : {show: true},
								saveAsImage : {show: true}
							}
						},
						calculable : true,
						xAxis : [
							{
								type : 'category',
								data :ary

							}
						],
						yAxis : [
							{
								type : 'value'
							}
						],
						series : [
							{
								name:'人数',
								type:'bar',
								data:ary1,
								markPoint : {
									data : [
										{type : 'max', name: '最大值'},
										{type : 'min', name: '最小值'}
									]
								},
								markLine : {
									data : [
										{type : 'average', name: '平均值'}
									]
								}
							},

						]
					};
					myChart.setOption(option);
				});

			</script>
		</td>
	</tr>
</table>
</body>
<script>
</script>
</html>
