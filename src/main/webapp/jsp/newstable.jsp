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
	<title>日志管理</title>
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

				<label class="layui-form-label">文章标题</label>
				<div class="layui-input-inline">
					<input type="text" id="jtitle" name="jtitle" autocomplete="off" class="layui-input"
					       placeholder="请输入文章标题">
				</div>

				<label class="layui-form-label">文章作者</label>
				<div class="layui-input-inline">
					<input type="text" id="jauthor" name="jauthor" autocomplete="off" class="layui-input"
					       placeholder="请输入文章作者">
				</div>

				<label class="layui-form-label">文章状态</label>
				<div class="layui-input-inline">
					<select name="jstatue" id="jstatue" lay-filter="jstatue">
						<option value="" selected=""></option>
						<option value="1">启用</option>
						<option value="2">禁用</option>
						<option value="3">已删除</option>
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">文章类型</label>
					<div class="layui-input-inline">
						<select name="jtype" id="jtype" lay-filter="jtype">
							<option value="" selected=""></option>
							<option value="1">新闻资讯</option>
							<option value="2">考试攻略</option>
						</select>
					</div>

					<label class="layui-form-label">操作时间</label>
					<div class="layui-input-inline">
						<input type="text" name="jtime" class="layui-input" id="test6" placeholder="请选择时间">
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
<script src="<%=path+"/js/newstable.js"%>" charset="utf-8"></script>

<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-xs" lay-event="enable">启用</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="disable">禁用</a>
	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="delete">删除</a>
</script>

<script>
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
				content: ['addnews.jsp']
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
