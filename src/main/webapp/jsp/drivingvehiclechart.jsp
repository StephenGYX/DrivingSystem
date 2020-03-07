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
	<meta charset="utf-8">
	<title></title>
	<style type="text/css">

		#main1{
			width:100vw;height:110vh;margin-left:2vw;margin-left: 100px;
		}
	</style>
</head>
<body>


<div id="main1"></div>
<script type="text/javascript">
	// 饼状图插件的部分内容
	var chart = echarts.init(document.getElementById('main1'));
	var optionbar = {
		color:['#df6c33','#018dfe'],//饼状图每部分的颜色
		tooltip: {
			trigger: 'item',
			// formatter: "{a} <br/>{b}: {c} ({d}%)",
			formatter: "{d}%",//鼠标滑过时候的显示
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
			data: ['正常','使用中','维修中','报废']
		},
		series: [{
			type: 'pie',
			radius: ['35%', '50%'],//控制饼状图的大小
			center: ['50%', '50%'],//控制饼状图所在的位置
			avoidLabelOverlap: true,

			label: {
				normal: {
					formatter: '{d}%' //自定义显示格式(b:name, c:value, d:百分比
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
			data: [
				{value:335, name:'正常'},
				{value:310, name:'使用中'},
				{value:234, name:'维修中'},
				{value:135, name:'报废'},
			],
		}]
	};


	chart.setOption(optionbar)
	//设置默认选中高亮部分
	chart.dispatchAction({
		type: 'highlight',
		seriesIndex: 0,
		dataIndex: 0
	});
	chart.on('mouseover', function(e) {
		//当检测到鼠标悬停事件，取消默认选中高亮
		chart.dispatchAction({
			type: 'downplay',
			seriesIndex: 1,
			dataIndex: 0
		});
		//高亮显示悬停的那块
		chart.dispatchAction({
			type: 'highlight',
			seriesIndex: 1,
			dataIndex: e.dataIndex
		});
	});
	//检测鼠标移出后显示之前默认高亮的那块
	chart.on('mouseout', function(e) {
		chart.dispatchAction({
			type: 'highlight',
			seriesIndex: 0,
			dataIndex: 0
		}); });

</script>
</body>

</html>
