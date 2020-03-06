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
			<div class="layui-card-header"><i class="fa fa-line-chart icon"></i>各个驾校拥有的教练数目</div>
			<div class="layui-card-body">
				<div id="echarts-records" style="width: 100%;min-height:500px"></div>
			</div>
		</div>
<%--		<div class="layui-col-xs12 layui-col-md3">--%>
<%--			<div id="echarts-pies" style="background-color:#ffffff;min-height:400px;padding: 10px"></div>--%>
<%--		</div>--%>


		<div class="layui-card">
			<div class="layui-card-header"><i class="fa fa-line-chart icon"></i>各个驾校拥有的教练数目</div>
			<div class="layui-card-body">
				<div id="shengfen" style="width: 100%;min-height:500px"></div>
			</div>
		</div>

		<div class="layui-col-xs12 layui-col-md3">
			<div id="echarts-pies" style="background-color:#ffffff;min-height:400px;padding: 10px"></div>
		</div>


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
				text: '各个驾校教练人数统计'
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

				}
			],
			yAxis: [
				{
					type: 'value'
				}
			],

			itemStyle: {
				normal: {
					// 随机显示
					color:function(d){return "#"+Math.floor(Math.random()*(256*256*256-1)).toString(16);}

					// 定制显示（按顺序）
					// color: function(params) {
					// 	var colorList = ['#C33531','#EFE42A','#64BD3D','#EE9201','#29AAE3', '#B74AE5','#0AAF9F','#E89589','#16A085','#4A235A','#C39BD3 ','#F9E79F','#BA4A00','#ECF0F1','#616A6B','#EAF2F8','#4A235A','#3498DB' ];
					// 	return colorList[params.dataIndex]
					// }
				},
			},


			series: [

			]
		};
		echartsRecords.setOption(optionRecords);







		var names=[];    //类别数组（实际用来盛放X轴坐标值）
		var nums=[];    //销量数组（实际用来盛放Y坐标值）


		$.ajax({
			type : "post",
			async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
			url : "<%=path+"/dSchool/echartPJ"%>",    //请求发送到TestServlet处
			data : {},
			dataType : "json",        //返回数据形式为json
			success : function(result) {
				//请求成功时执行该函数内容，result即为服务器返回的json对象
				if (result) {
					for(var i=0;i<result.length;i++){
						names.push(result[i].dname);    //挨个取出类别并填入类别数组
					}
					for(var i=0;i<result.length;i++){
						var obj = new Object();
						    obj.name=result[i].dname;
							obj.value=result[i].renshu;
							obj.color="#"+Math.floor(Math.random()*(256*256*256-1)).toString(16);
						nums.push(obj);    //挨个取出销量并填入销量数组
					}
					console.log(nums);
					echartsRecords.hideLoading();    //隐藏加载动画
					echartsRecords.setOption({        //加载数据图表
						title: {
							text: '各个驾校教练人数统计'
						},

						xAxis: {
							data: names
						},
						legend: {
							data: names	},
						series: [
							{
							// 根据名字对应到相应的系列
							// name: ['数量'],
							type: 'bar',
							// areaStyle: {},
							data: nums
						}


						]
					});

				}

			},
			error : function(errorMsg) {
				//请求失败时执行该函数
				alert("图表请求数据失败!");
				echartsRecords.hideLoading();
			}
		});
		var abc= optionRecords;
		var zhu = echarts.init(document.getElementById('shengfen'),'walden');
		zhu.setOption(abc);
		$.ajax({
			type : "post",
			async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
			url : "<%=path+"/dSchool/echartshengfen"%>",    //请求发送到TestServlet处
			data : {},
			dataType : "json",        //返回数据形式为json
			success : function(result) {
				//请求成功时执行该函数内容，result即为服务器返回的json对象
				var names2=[]; var nums2=[];
				console.log(result);
				if (result) {
					for(var i=0;i<result.length;i++){
						names2.push(result[i].dprovince);    //挨个取出类别并填入类别数组
					}
					for(var i=0;i<result.length;i++){
						// var obj = new Object();
						// obj.name=result[i].dprovince;
						// obj.value=result[i].renshu;
						nums2.push(result[i].renshu);    //挨个取出销量并填入销量数组
					}
					// console.log(nums);
					zhu.hideLoading();    //隐藏加载动画
					zhu.setOption({
						//加载数据图表
						title: {
							text: '各个省份驾校数统计'
						},
						xAxis: {
							data: names2
						},
						legend: {
							data: names2	},
						series: [
							{
								// 根据名字对应到相应的系列

								type: 'bar',
								// areaStyle: {},
								data: nums2
							},	{
								// 根据名字对应到相应的系列
								// name: ['数量'],
								type: 'line',
								// areaStyle: {},
								data: nums2
							}


						]
					});

				}

			},
			error : function(errorMsg) {
				//请求失败时执行该函数
				alert("图表请求数据失败!");
				zhu.hideLoading();
			}
		});




		var echartsPies = echarts.init(document.getElementById('echarts-pies'), 'walden');



		$.ajax({
			type : "post",
			async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
			url : "<%=path+"/dSchool/echartcar"%>",    //请求发送到TestServlet处
			data : {},
			dataType : "json",        //返回数据形式为json
			success : function(result) {
				//请求成功时执行该函数内容，result即为服务器返回的json对象
				var names3=[]; var nums3=[];
				console.log(result);
				if (result) {
					for(var i=0;i<result.length;i++){
						names3.push(result[i].dname);    //挨个取出类别并填入类别数组
					}
					for(var i=0;i<result.length;i++){
						var obj = new Object();
						obj.name=result[i].dname;
						obj.value=result[i].renshu;
						nums3.push(obj);    //挨个取出销量并填入销量数组
					}
					// console.log(nums);
					echartsPies.hideLoading();    //隐藏加载动画
					var optionPies = {
						title: {
							text: '玫瑰图',
							left: 'center'
						},
						tooltip: {
							trigger: 'item',
							formatter: '{a} <br/>{b} : {c} ({d}%)'
						},
						legend: {
							orient: 'vertical',
							left: 'right',
							data: names3	},
						series: [
							{
								name: '各个状态车辆占比',
								type: 'pie',
								radius: '55%',
								center: ['50%', '60%'],
								roseType: 'radius',
								data: nums3

								,emphasis: {
									itemStyle: {
										shadowBlur: 10,
										shadowOffsetX: 0,
										shadowColor: 'rgba(0, 0, 0, 0.5)'
									}
								}
							}
						]
					};
					echartsPies.setOption(optionPies);
				}

			},
			error : function(errorMsg) {
				//请求失败时执行该函数
				alert("图表请求数据失败!");
				zhu.hideLoading();
			}
		});











		// echarts 窗口缩放自适应
		window.onresize = function(){
			zhu.resize();
			echartsPies.resize();
			echartsRecords.resize();
		}








	})

</script>

<script>

</script>

</body>
</html>
