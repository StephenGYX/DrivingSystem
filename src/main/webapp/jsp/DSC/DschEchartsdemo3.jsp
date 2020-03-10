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
			<div class="layui-card-header"><i class="fa fa-line-chart icon"></i>各个驾校最近四月报名人数折线图</div>
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
			// title: {
			// 	text: '指标名称-报表图'
			// },
			tooltip: {
				trigger: 'axis',
				axisPointer: {
					type: 'cross',
					label: {
						backgroundColor: '#6a7985'
					}
				}
			},
			// legend: {
			// 	data: ['邮件营销', '联盟广告', '视频广告', '直接访问', '搜索引擎']
			// },
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
					data: ['12月', '1月', '2月', '3月']
				}
			],
			yAxis: [
				{
					type: 'value'
				}
			],
			series: [

			]
		};
		echartsRecords.setOption(optionRecords);







		var names=[];    //类别数组（实际用来盛放X轴坐标值）
		var nums=[];    //人数（实际用来盛放Y坐标值）
		var yuefen=[];   //横坐标 月份
         var bigary=new Array();

		$.ajax({
			type : "post",
			async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
			url : "<%=path+"/dSchool/echartyuefen"%>",    //请求发送到TestServlet处
			data : {},
			dataType : "json",        //返回数据形式为json
			success : function(result) {
				//请求成功时执行该函数内容，result即为服务器返回的json对象
				if (result) {
					// for(var i=0;i<result.length;i++){
					// 	names.push(result[i].dname);    //挨个取出类别并填入类别数组
					// }
					for(var i=0;i<result.length;i++){
						bigary[i]=new Array();
						bigary[i]=	result[i]
						names.push(result[i].name)
						// for(var j=0;j<bigary.length;j++){
						// nums.push(obj);    //挨个取出销量并填入销量数组
					}
					console.log(nums);
					echartsRecords.hideLoading();    //隐藏加载动画
					echartsRecords.setOption({        //加载数据图表
						xAxis: {
							data: ['12月', '1月', '2月', '3月']
						},
						legend: {
							data: names
						},
						series: result
					});

				}

			},
			error : function(errorMsg) {
				//请求失败时执行该函数
				alert("图表请求数据失败!");
				echartsRecords.hideLoading();
			}
		});










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
