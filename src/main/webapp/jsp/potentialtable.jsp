<%--
  Created by IntelliJ IDEA.
  User: Stephen
  Date: 2020/2/20
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = application.getContextPath();
%>
<html>
<head>
	<meta charset="utf-8">
	<title>潜在客户咨询</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<link rel="stylesheet" href="<%=path+"/lib/layui-v2.5.5/css/layui.css"%>" media="all">
	<link rel="stylesheet" href="<%=path+"/css/public.css"%>" media="all">
</head>
<body>

<input type="hidden" id="hid" value=<%=path%>>

<div class="layuimini-container">
	<div class="layuimini-main">
		<form class="layui-form" action="" lay-filter="frm">
			<div class="layui-form-item">

				<label class="layui-form-label">姓名</label>
				<div class="layui-input-inline">
					<input type="text" id="gname" name="gname" autocomplete="off" class="layui-input"
					       placeholder="请输入咨询者姓名">
				</div>

				<label class="layui-form-label">电话</label>
				<div class="layui-input-inline">
					<input type="text" id="gphone" name="gphone" autocomplete="off" class="layui-input"
					       placeholder="请输入咨询者电话">
				</div>


			</div>

			<div class="layui-form-item">
				<div class="layui-inline">

					<label class="layui-form-label">跟进状态</label>
					<div class="layui-input-inline">
						<select name="gstate" id="gstate" lay-filter="gstate">
							<option value="" selected=""></option>
							<option value="1">有意向待沟通</option>
							<option value="2">有意向已沟通</option>
							<option value="3">无意向购买</option>
							<option value="4">已成交</option>
							<option value="5">已删除</option>
						</select>
					</div>

					<label class="layui-form-label">操作时间</label>
					<div class="layui-input-inline">
						<input type="text" name="gtime" class="layui-input" id="test6" placeholder="请选择时间">
					</div>

					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					<button type="submit" class="layui-btn layui-btn-danger" lay-submit="" lay-filter="addnews">新增</button>
					<button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">搜索</button>
				</div>
			</div>
		</form>
	</div>
</div>

<table class="layui-hide" id="test" lay-filter="test"></table>

<script src="<%=path+"/lib/layui-v2.5.5/layui.js"%>" charset="utf-8"></script>
<script src="<%=path+"/js/potentialtable.js"%>" charset="utf-8"></script>

<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">更新信息</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
</script>

<script>
	var path = "<%=path%>";

	layui.use(['form', 'layer', 'laydate', 'jquery'], function () {
		var form = layui.form,
			layer = layui.layer,
			$ = layui.jquery,
			laydate = layui.laydate;

		form.on('submit(addnews)', function (data) {
			layer.open({
				type: 2,
				area: ['90%', '90%'],
				title: false,
				offset: '20px',
				shadeClose: true,
				scrollbar: true,
				content: ['addpotential.jsp']
			});
			return false;
		});

		//常规用法
		laydate.render({
			elem: '#test1'
		});

		//常规用法
		laydate.render({
			elem: '#test2'
		});

		//日期范围
		laydate.render({
			elem: '#test6'
			, range: true
		});
	});
</script>
</body>
</html>
