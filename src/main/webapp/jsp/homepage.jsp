<%--
  Created by IntelliJ IDEA.
  User: lsl
  Date: 2019/12/25
  Time: 5:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String Path = application.getContextPath();

%><%@ page  isELIgnored = "false" %>
<html>
<head>
	<meta charset="utf-8">
	<title>Title</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href=<%=Path+"/lib/layui-v2.5.5/css/layui.css"%>>
	<link rel="stylesheet" href="<%=Path+"/lib/lay-module/step-lay/step.css"%>" media="all">
	<script src=<%=Path+"/lib/layui-v2.5.5/layui.js"%>></script>
	<script type="text/javascript" src=<%=Path+"/lib/jquery-3.4.1/jquery-3.4.1.min.js"%>></script>
	<script type="text/javascript" src=<%=Path+"/js/json2.js"%>></script>
	<script src=<%=Path+"/js/lay-config.js?v=1.0.4"%> charset="utf-8"></script>
</head>
<body>
<%@ page  isELIgnored = "false" %>

<!-- 增加搜索条件 -->
<div class="demoTable">
	搜索ID：
	<div class="layui-inline">
		<input class="layui-input" name="id" id="demoReload" autocomplete="off">
	</div>
	<button class="layui-btn" data-type="reload" >搜索</button>
</div>
<%--创建表格--%>
<table id="demo" lay-filter="test"></table>

<script>
	layui.use('table', function(){
		var table = layui.table;

		//第一个实例
		table.render({
			elem: '#demo'
			,height: 272
			,url: '/springboot/table' //数据接口
			,page: true //开启分页
			,parseData:function (res) {
				return{
					"code":0,
					"msg":0,
					"count":0,
					"data":res
				}
			}
			,cols: [[ //表头
				{field: 'vcarnum', title: '车牌', width:80, sort: true, fixed: 'left'}
				,{field: 'vbrand', title: '品牌', width:80
				},
				{field: 'vmodel', title: '型号', width:80
				},
				{field: 'vcoordinate', title: '坐标', width:80
				},
				{field: 'vdrivingid', title: '驾校', width:80
				},
				{field: 'vcarstate', title: '状态', width:80
				}

			]]

		});

	});



	var $ = layui.$, active = {
		reload: function(){
			var demoReload = $('#demoReload');

			//执行重载
			table.reload('testReload', {
				page: {
					curr: 1 //重新从第 1 页开始
				}
				,where: {
					key: {
						id: demoReload.val()
					}
				}
			}, 'data');
		}
	};

	$('.demoTable .layui-btn').on('click', function(){
		var type = $(this).data('type');
		active[type] ? active[type].call(this) : '';
	});

	layui.use(['laypage', 'layer'], function() {
		var laypage = layui.laypage;
		laypage.render({
			elem: '#demo11'
			,count: 100
			,limit: 5
			,limits: [5, 30, 50]
		});
	});
</script>

<div id="demo11"></div>
</body>
</html>
