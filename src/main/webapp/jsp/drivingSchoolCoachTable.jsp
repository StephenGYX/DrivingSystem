	<%--
  Created by IntelliJ IDEA.
  User: Stephen
  Date: 2020/2/14
  Time: 17:58
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
		<title>layui</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="<%=path+"/lib/layui-v2.5.5/css/layui.css"%>" media="all">
		<link rel="stylesheet" href="<%=path+"/css/public.css"%>" media="all">
	</head>
	<body>
	<div class="layuimini-container">
		<div class="layuimini-main">

			<fieldset class="table-search-fieldset">
				<legend>搜索信息</legend>
				<div style="margin: 10px 10px 10px 10px">
					<form class="layui-form layui-form-pane" action="">
						<div class="layui-form-item">
							<div class="layui-inline">
								<label class="layui-form-label">用户姓名</label>
								<div class="layui-input-inline">
									<input type="text" name="username" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">用户性别</label>
								<div class="layui-input-inline">
									<input type="text" name="sex" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">用户城市</label>
								<div class="layui-input-inline">
									<input type="text" name="city" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">用户职业</label>
								<div class="layui-input-inline">
									<input type="text" name="classify" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-inline">
								<button type="submit" class="layui-btn layui-btn-primary"  lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</button>
							</div>
						</div>
					</form>
				</div>
			</fieldset>

			<script type="text/html" id="toolbarDemo">
				<div class="layui-btn-container">
					<button class="layui-btn layui-btn-sm data-add-btn"> 添加用户 </button>
					<button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn"> 删除用户 </button>
				</div>
			</script>

			<table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

			<script type="text/html" id="currentTableBar">
				<a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
				<a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
			</script>

		</div>
	</div>
	<script src="<%=path+"/lib/layui-v2.5.5/layui.js"%>" charset="utf-8"></script>
	<script>
		layui.use(['form', 'table'], function () {
			var $ = layui.jquery,
				form = layui.form,
				table = layui.table,
				layuimini = layui.layuimini;

			table.render({
				elem: '#currentTableId',
				url: "<%=path+"/drivingSchool/QueryMyCoach"%>",
				toolbar: '#toolbarDemo',
				defaultToolbar: ['filter', 'exports', 'print', {
					title: '提示',
					layEvent: 'LAYTABLE_TIPS',
					icon: 'layui-icon-tips'
				}],
				cols: [[
					{type: "checkbox", width: 50, fixed: "left"},
					{field: 'pid', width: 80, title: 'ID', sort: true},
					{field: 'pname', width: 80, title: '姓名'},
					{field: 'paccount', width: 180, title: '账号', sort: true},
					{field: 'psex', width: 80, title: '性别'},
					{field: 'pphone', width: 80, title: '电话', sort: true},
					{field: 'pemail', width: 200, title: '邮箱', sort: true},
					{field: 'pdrivingid', width: 80, title: '驾校ID'},
					{field: 'ppassword', width: 135, title: '密码', sort: true},
					{field: 'page', title: '年龄', minWidth: 150},
					{title: '操作', minWidth: 50, templet: '#currentTableBar', fixed: "right", align: "center"}
				]],
				limits: [5, 10, 20,30,50,100],
				limit: 10,
				page: true
			});

			// 监听搜索操作
			form.on('submit(data-search-btn)', function (data) {
				var result = JSON.stringify(data.field);
				layer.alert(result, {
					title: '最终的搜索信息'
				});

				//执行搜索重载
				table.reload('currentTableId', {
					page: {
						curr: 1
					}
					, where: {
						searchParams: result
					}
				}, 'data');

				return false;
			});

			// 监听添加操作
			$(".data-add-btn").on("click", function () {

				var index = layer.open({
					title: '添加用户',
					type: 2,
					shade: 0.2,
					maxmin:true,
					shadeClose: true,
					area: ['100%', '100%'],
					content: '/page/table/add.html',
				});
				$(window).on("resize", function () {
					layer.full(index);
				});

				return false;
			});

			// 监听删除操作
			$(".data-delete-btn").on("click", function () {
				var checkStatus = table.checkStatus('currentTableId')
					, data = checkStatus.data;
				layer.alert(JSON.stringify(data));
			});

			//监听表格复选框选择
			table.on('checkbox(currentTableFilter)', function (obj) {
				console.log(obj)
			});

			table.on('tool(currentTableFilter)', function (obj) {
				var data = obj.data;
				if (obj.event === 'edit') {

					var index = layer.open({
						title: '编辑用户',
						type: 2,
						shade: 0.2,
						maxmin:true,
						shadeClose: true,
						area: ['100%', '100%'],
						content: '/page/table/edit.html',
					});
					$(window).on("resize", function () {
						layer.full(index);
					});
					return false;
				} else if (obj.event === 'delete') {
					layer.confirm('真的删除行么', function (index) {
						obj.del();
						layer.close(index);
					});
				}
			});

		});
	</script>

	<script>

	</script>

	</body>
	</html>