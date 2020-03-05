<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = application.getContextPath();
%>
<html>
<head>
	<meta charset="utf-8">
	<title>layui</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="<%=path+"/lib/layui-v2.5.5/css/layui.css"%>" media="all">
	<link rel="stylesheet" href="<%=path+"/css/public.css"%>" media="all">
	<link rel="stylesheet" href="<%=path+"/lib/font-awesome-4.7.0/css/font-awesome.min.css"%>" media="all">
	<%--	<link rel="stylesheet" href="<%=path+"/css/frontlogin.css"%>" >--%>
</head>
<body>
<div class="layuimini-container" style="height: 100%">
	<div class="layuimini-main">

		<div class="layui-card">
			<div class="layui-card-header"><i class="fa fa-line-chart icon"></i>报表统计</div>
			<div class="layui-card-body">
				<div id="echarts-records" style="width: 100%;min-height:500px"></div>
			</div>
		</div>
<%--		<div class="layui-col-xs12 layui-col-md3">--%>
<%--			<div id="echarts-pies" style="background-color:#ffffff;min-height:400px;padding: 10px"></div>--%>
<%--		</div>--%>
		<%--		<script type="text/html" id="toolbarDemo">--%>
		<%--			<div class="layui-btn-container">--%>
		<%--				<button class="layui-btn layui-btn-sm data-add-btn"> 添加用户</button>--%>
		<%--				<button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="del"> 删除用户</button>--%>
		<%--			</div>--%>
		<%--		</script>--%>



	</div>
</div>

<script src="<%=path+"/lib/layui-v2.5.5/layui.js"%>" charset="utf-8"></script>

<script src="<%=path+"/js/lay-config.js?v=1.0.4"%>" charset="utf-8"></script>
<script>




	layui.use(['form', 'table','echarts'], function () {
		var $ = layui.jquery,
			form = layui.form,
			table = layui.table,
			layuimini = layui.layuimini,
		echarts = layui.echarts;
		// var echartsPies = echarts.init(document.getElementById('echarts-pies'), 'walden');

		var echartsRecords = echarts.init(document.getElementById('echarts-records'),'walden');
		var optionRecords = {
			title: {
				text: '指标名称-报表图'
			},
			tooltip: {
				trigger: 'axis',
				axisPointer: {
					type: 'cross',
					label: {
						backgroundColor: '#6a7985'
					}
				}
			},
			legend: {
				data: ['邮件营销', '联盟广告', '视频广告', '直接访问', '搜索引擎']
			},
			toolbox: {
				feature: {
					saveAsImage: {}
				}
			},
			grid: {
				left: '3%',
				right: '4%',
				bottom: '3%',
				containLabel: true
			},
			xAxis: [
				{
					type: 'category',
					boundaryGap: false,
					data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
				}
			],
			yAxis: [
				{
					type: 'value'
				}
			],
			series: [
				{
					name: '邮件营销',
					type: 'line',
					stack: '总量',
					areaStyle: {},
					data: [120, 132, 101, 134, 90, 230, 210]
				},
				{
					name: '联盟广告',
					type: 'line',
					areaStyle: {},
					data: [220, 182, 191, 234, 290, 330, 310]
				},
				{
					name: '视频广告',
					type: 'line',
					stack: '总量',
					areaStyle: {},
					data: [150, 232, 201, 154, 190, 330, 410]
				},
				{
					name: '直接访问',
					type: 'line',
					stack: '总量',
					areaStyle: {},
					data: [320, 332, 301, 334, 390, 330, 320]
				},
				{
					name: '搜索引擎',
					type: 'line',
					stack: '总量',
					label: {
						normal: {
							show: true,
							position: 'top'
						}
					},
					areaStyle: {},
					data: [820, 932, 901, 934, 1290, 1330, 1320]
				}
			]
		};
		echartsRecords.setOption(optionRecords);

		// var optionPies = {
		// 	title: {
		// 		text: '指标名称-玫瑰图',
		// 		left: 'center'
		// 	},
		// 	tooltip: {
		// 		trigger: 'item',
		// 		formatter: '{a} <br/>{b} : {c} ({d}%)'
		// 	},
		// 	legend: {
		// 		orient: 'vertical',
		// 		left: 'left',
		// 		data: ['直接访问', '邮件营销', '联盟广告', '视频广告', '搜索引擎']
		// 	},
		// 	series: [
		// 		{
		// 			name: '访问来源',
		// 			type: 'pie',
		// 			radius: '55%',
		// 			center: ['50%', '60%'],
		// 			roseType: 'radius',
		// 			data: [
		// 				{value: 335, name: '直接访问'},
		// 				{value: 310, name: '邮件营销'},
		// 				{value: 234, name: '联盟广告'},
		// 				{value: 135, name: '视频广告'},
		// 				{value: 368, name: '搜索引擎'}
		// 			],
		// 			emphasis: {
		// 				itemStyle: {
		// 					shadowBlur: 10,
		// 					shadowOffsetX: 0,
		// 					shadowColor: 'rgba(0, 0, 0, 0.5)'
		// 				}
		// 			}
		// 		}
		// 	]
		// };
		//
		//




		// echartsPies.setOption(optionPies);
		var names=[];    //类别数组（实际用来盛放X轴坐标值）
		var nums=[];    //销量数组（实际用来盛放Y坐标值）


		<%--$.ajax({--%>
		<%--	type : "post",--%>
		<%--	async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）--%>
		<%--	url : "<%=path+"/dSchool/echartPJ"%>",    //请求发送到TestServlet处--%>
		<%--	data : {},--%>
		<%--	dataType : "json",        //返回数据形式为json--%>
		<%--	success : function(result) {--%>
		<%--		//请求成功时执行该函数内容，result即为服务器返回的json对象--%>
		<%--		if (result) {--%>
		<%--			for(var i=0;i<result.length;i++){--%>
		<%--				names.push(result[i].dname);    //挨个取出类别并填入类别数组--%>
		<%--			}--%>
		<%--			for(var i=0;i<result.length;i++){--%>
		<%--				var obj = new Object();--%>
		<%--				    obj.name=result[i].dname;--%>
		<%--					obj.value=result[i].renshu;--%>
		<%--				nums.push(obj);    //挨个取出销量并填入销量数组--%>
		<%--			}--%>
		<%--			console.log(nums);--%>
		<%--			// echartsRecords.hideLoading();    //隐藏加载动画--%>
		<%--			// echartsRecords.setOption({        //加载数据图表--%>
		<%--			// 	// xAxis: {--%>
		<%--			// 	// 	data: names--%>
		<%--			// 	// },--%>
		<%--			//--%>
		<%--			// 	series: [{--%>
		<%--			// 		// 根据名字对应到相应的系列--%>
		<%--			// 		// name: ['数量'],--%>
		<%--			// 		// type: 'bar',--%>
		<%--			// 		data: nums--%>
		<%--			// 	}]--%>
		<%--			// });--%>

		<%--		}--%>

		<%--	},--%>
		<%--	error : function(errorMsg) {--%>
		<%--		//请求失败时执行该函数--%>
		<%--		alert("图表请求数据失败!");--%>
		<%--		echartsRecords.hideLoading();--%>
		<%--	}--%>
		<%--});--%>










		// echarts 窗口缩放自适应
		window.onresize = function(){
			echartsRecords.resize();
		}








	})

</script>

<script>

</script>

</body>
</html>
