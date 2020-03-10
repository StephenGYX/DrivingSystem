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
	<style type="text/css">

		#main1{
			width:100vw;height:110vh;margin-left:2vw;margin-left: 100px;
		}
	</style>
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








<div id="main1"></div>
<script type="text/javascript">
	// 饼状图插件的部分内容
	var chart = echarts.init(document.getElementById('main1'));

	$.ajax({

		url: '/springboot/vehiclechart',
		method: 'post',
		dataType: 'json',
		success: function (msg) {
			var ary = new Array();
			var ary1 = new Array();
			for(var i=0;i<msg.length;i++){
				ary.push(msg[i].pcount)
				ary1.push(msg[i].vcarstate)
			}

			var seriesdata=new Array();
			var optionbar = {
				color: ['#df6c33', '#018dfe','#0FCE40','#9F9F9F'],//饼状图每部分的颜色
				tooltip: {
					trigger: 'item',
					// formatter: "{a} <br/>{b}: {c} ({d}%)",
					formatter: "{c}",//鼠标滑过时候的显示
					// show:false,
				},
				title: {
					text: '教练车使用情况',
					// x 设置水平安放位置，默认左对齐，可选值：'center' ¦ 'left' ¦ 'right' ¦ {number}（x坐标，单位px）
					x: 'center',
					// y 设置垂直安放位置，默认全图顶端，可选值：'top' ¦ 'bottom' ¦ 'center' ¦ {number}（y坐标，单位px）
					y: 'top',
					// itemGap设置主副标题纵向间隔，单位px，默认为10，
					itemGap: 30,
					backgroundColor: '#EEE',
					// 主标题文本样式设置
					textStyle: {
						fontSize: 26,
						fontWeight: 'bolder',
						color: '#000080'
					},
					// 副标题文本样式设置
					subtextStyle: {
						fontSize: 18,
						color: '#8B2323'
					}
				},
				legend: {
					// orient 设置布局方式，默认水平布局，可选值：'horizontal'（水平） ¦ 'vertical'（垂直）
					orient: 'vertical',
					// x 设置水平安放位置，默认全图居中，可选值：'center' ¦ 'left' ¦ 'right' ¦ {number}（x坐标，单位px）
					x: 'left',
					// y 设置垂直安放位置，默认全图顶端，可选值：'top' ¦ 'bottom' ¦ 'center' ¦ {number}（y坐标，单位px）
					y: 'center',
					itemWidth: 24,   // 设置图例图形的宽
					itemHeight: 18,  // 设置图例图形的高
					textStyle: {
						color: '#666'  // 图例文字颜色
					},
					// itemGap设置各个item之间的间隔，单位px，默认为10，横向布局时为水平间隔，纵向布局时为纵向间隔
					itemGap: 30,
					backgroundColor: '#eee',  // 设置整个图例区域背景颜色
					data:['正常','使用中','维修中','报废']
				},
				series: [{
					type: 'pie',
					radius: ['35%', '50%'],//控制饼状图的大小
					center: ['50%', '50%'],//控制饼状图所在的位置
					avoidLabelOverlap: true,

					label: {
						normal: {
							formatter: '{c}' ,//自定义显示格式(b:name, c:value, d:百分比
						},
						emphasis: {
							show: true,
							textStyle: {
								fontSize: '10',//字体大小
							}
						}
					},
					labelLine: {
						normal: {
							show: true
						}
					},
					data: seriesdata

				}]
			};
			for(var j=0;j<msg.length;j++)
			{ var obj=new Object();
				obj.name=ary1[j];
				obj.value=ary[j];
				seriesdata[j]=obj;
			}

			chart.setOption(optionbar)
			// //设置默认选中高亮部分
			// chart.dispatchAction({
			// 	type: 'highlight',
			// 	seriesIndex: 0,
			// 	dataIndex: 0
			// });
			// chart.on('mouseover', function (e) {
			// 	//当检测到鼠标悬停事件，取消默认选中高亮
			// 	chart.dispatchAction({
			// 		type: 'downplay',
			// 		seriesIndex: 1,
			// 		dataIndex: 0
			// 	});
			// 	//高亮显示悬停的那块
			// 	chart.dispatchAction({
			// 		type: 'highlight',
			// 		seriesIndex: 1,
			// 		dataIndex: e.dataIndex
			// 	});
			// });
			// //检测鼠标移出后显示之前默认高亮的那块
			// chart.on('mouseout', function (e) {
			// 	chart.dispatchAction({
			// 		type: 'highlight',
			// 		seriesIndex: 0,
			// 		dataIndex: 0
			// 	});
			// });
		}
	});


</script>
</body>

</html>
