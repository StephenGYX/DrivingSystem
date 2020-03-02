
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = application.getContextPath();
%>
<html>
<head>
	<meta charset="utf-8">
	<title>培训记录表</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="<%=path+"/lib/layui-v2.5.5/css/layui.css"%>" media="all">
	<link rel="stylesheet" href="<%=path+"/css/public.css"%>" media="all">
	<script src="<%=path+"/js/drivingSchoolStudentTable.js"%>" charset="utf-8"></script>
</head>
<body>

<%--<input type="hidden" value="#{pid}">--%>

<div class="layuimini-container">
	<div class="layuimini-main">

		<fieldset class="table-search-fieldset">
			<legend>搜索信息</legend>
			<div style="margin: 10px 10px 10px 10px">
				<form class="layui-form layui-form-pane" action="">

					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">学员账号</label>
							<div class="layui-input-inline">
								<input type="text" id="userAccount" name="userAccount" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">学员姓名</label>
							<div class="layui-input-inline">
								<input type="text" id="username" name="username" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">时间</label>
							<div class="layui-input-inline">
								<input type="date" id="startTime" name="startTime" autocomplete="off" class="layui-input">
							</div>
							<label class="layui-form-label">至</label>
							<div class="layui-input-inline">
								<input type="date" id="stopTime" name="stopTime" autocomplete="off" class="layui-input">
							</div>
						</div>


						<div class="layui-inline">
							<button type="submit" class="layui-btn layui-btn-primary" lay-submit  lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</button>
						</div>
					</div>

				</form>
			</div>
		</fieldset>

		<script type="text/html" id="toolbarDemo">
			<div class="layui-btn-container">
<%--				<a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="deleteList">删除</a>--%>
			</div>
		</script>

		<table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>



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
			url: "<%=path%>"+"/backConsumer/QueryStudentKaoShiTable",
			toolbar: '#toolbarDemo',
			defaultToolbar: ['filter', 'exports', 'print', {
				title: '提示',
				layEvent: 'LAYTABLE_TIPS',
				icon: 'layui-icon-tips'
			}],
			cols: [[
				{field: 'cid', width: 70, title: 'ID', sort: true},
				{field: 'cname', width: 100, title: '学员姓名'},
				{field: 'caccount', width: 110, title: '学员账号', sort: true},
				{field: 'csex', width: 50, title: '性别'},
				{field: 'eorderstate', width: 100, title: '学习阶段', sort: true
					,templet: function (a)
					{
						if (a.eorderstate==0){
							return "科目一";
						} else if (a.eorderstate==1) {
							return "科目二";
						}
						else if (a.eorderstate==2) {
							return "科目三";
						}
						else if (a.eorderstate==3) {
							return "科目四";
						}
						else if (a.eorderstate==4) {
							return "领证";
						}
						else if (a.eorderstate==5) {
							return "毕业";
						}
					}
				},
				{field: 'eclasshour1', width: 130, title: '科目一学时', sort: true},
				{field: 'eclasshour2', width: 130, title: '科目二学时', sort: true},
				{field: 'eclasshour3', width: 130, title: '科目三学时', sort: true},
				{field: 'eclasshour4', width: 130, title: '科目四学时', sort: true},
				{field: 'pname', width: 110, title: '教练姓名', sort: true},
			]],
			limits: [5, 10, 15],
			limit: 10,
			page: true
		});

		// 监听搜索操作
		form.on('submit(data-search-btn)', function (data) {
			var result = JSON.stringify(data.field);
			// layer.alert(result, {
			// 	title: '最终的搜索信息'
			// });

			//执行搜索重载
			table.reload('currentTableId', {
				page: {
					curr: 1
				}
				, where: {
					searchParams: result,
					userAccount:$("#userAccount").val(),
					username:$("#username").val(),
					startTime:$("#startTime").val(),
					stopTime:$("#stopTime").val()

				}
			}, 'data');

			return false;
		});




	});
</script>
<script>

</script>

</body>
</html>
