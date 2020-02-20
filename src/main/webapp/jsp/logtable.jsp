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
	<link rel="stylesheet" href="<%=path+"/css/public.css"%>" media="all"></head>
<body>

<input type="hidden" id="hid" value=<%=path%>>

<div class="layuimini-container">
	<div class="layuimini-main">
		<form class="layui-form" action="" lay-filter="frm">
			<div class="layui-form-item">

				<label class="layui-form-label">操作人ID</label>
				<div class="layui-input-inline">
					<input type="text" id="opeid" name="opeid" autocomplete="off" class="layui-input" placeholder="请输入操作人ID">
				</div>

				<label class="layui-form-label">操作类型</label>
				<div class="layui-input-inline">
					<input type="text" id="opetype" name="opetype" autocomplete="off" class="layui-input" placeholder="请输入操作类型">
				</div>

				<label class="layui-form-label">操作名称</label>
				<div class="layui-input-inline">
					<input type="text" id="opename" name="opename" autocomplete="off" class="layui-input" placeholder="请输入操作名称">
				</div>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				<button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">搜索</button>

			</div>

			<div class="layui-form-item">
				<div class="layui-inline">

					<label class="layui-form-label">操作角色</label>
					<div class="layui-input-inline">
						<select name="operole" id="operole" lay-filter="operole">
							<option value="" selected=""></option>
							<option value="0">后台管理员</option>
							<option value="1">驾校</option>
							<option value="2">教练</option>
							<option value="3">学员</option>
						</select>
					</div>

					<label class="layui-form-label">ip地址</label>
					<div class="layui-input-inline">
						<input type="text" id="opeip" name="opeip" autocomplete="off" class="layui-input" placeholder="请输入ip地址">
					</div>

					<label class="layui-form-label">操作时间</label>
					<div class="layui-input-inline">
						<input type="text" name="opetime" class="layui-input" id="test6" placeholder="请选择时间">
					</div>
				</div>
			</div>
		</form>
	</div>
</div>

<table class="layui-hide" id="test" lay-filter="test"></table>

<script src="<%=path+"/lib/layui-v2.5.5/layui.js"%>" charset="utf-8"></script>
<script src="<%=path+"/js/logtable.js"%>" charset="utf-8"></script>
<script>
	layui.use(['form','layer','laydate','jquery'], function () {
		var form = layui.form,
			layer = layui.layer,
			$=layui.jquery,
			laydate = layui.laydate;

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
			,range: true
		});
	});
</script>
</body>
</html>
