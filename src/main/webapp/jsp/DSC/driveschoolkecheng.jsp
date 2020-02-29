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
	<%--	<link rel="stylesheet" href="<%=path+"/css/frontlogin.css"%>" >--%>
</head>
<body>
<div class="layuimini-container" style="height: 100%">
	<div class="layuimini-main">

		<%--		<fieldset class="table-search-fieldset">--%>
		<%--			<legend>搜索信息</legend>--%>
		<%--			<div style="margin: 10px 10px 10px 10px">--%>
		<%--				<form class="layui-form layui-form-pane" action="">--%>
		<%--					<div class="layui-form-item">--%>
		<%--						<div class="layui-inline">--%>
		<%--							<label class="layui-form-label">驾校名</label>--%>
		<%--							<div class="layui-input-inline">--%>
		<%--								<input type="text" name="dname" id="dname" autocomplete="off" class="layui-input">--%>
		<%--							</div>--%>
		<%--						</div>--%>
		<%--						<div class="layui-inline">--%>
		<%--							<label class="layui-form-label">驾校联系人</label>--%>
		<%--							<div class="layui-input-inline">--%>
		<%--								<input type="text" name="dcontacts" id="dcontacts" autocomplete="off"--%>
		<%--								       class="layui-input">--%>
		<%--							</div>--%>
		<%--						</div>--%>
		<%--						<div class="layui-inline">--%>
		<%--							<label class="layui-form-label">用户状态</label>--%>
		<%--							<div class="layui-input-inline">--%>
		<%--								&lt;%&ndash;								<input type="text" name="daccountstate" id="daccountstate" autocomplete="off"&ndash;%&gt;--%>
		<%--								&lt;%&ndash;								       class="layui-input">&ndash;%&gt;--%>
		<%--								<select name="daccountstate">--%>
		<%--									<option value="">未选择</option>--%>
		<%--									<option value="1">启用</option>--%>
		<%--									<option value="2">禁用</option>--%>
		<%--									<option value="3">已删除</option>--%>

		<%--								</select>--%>
		<%--							</div>--%>
		<%--						</div>--%>
		<%--						&lt;%&ndash;							<div class="layui-inline">&ndash;%&gt;--%>
		<%--						&lt;%&ndash;								<label class="layui-form-label">用户职业</label>&ndash;%&gt;--%>
		<%--						&lt;%&ndash;								<div class="layui-input-inline">&ndash;%&gt;--%>
		<%--						&lt;%&ndash;									<input type="text" name="classify" autocomplete="off" class="layui-input">&ndash;%&gt;--%>
		<%--						&lt;%&ndash;								</div>&ndash;%&gt;--%>
		<%--						&lt;%&ndash;							</div>&ndash;%&gt;--%>
		<%--						<div class="layui-inline">--%>
		<%--							<button type="submit" class="layui-btn layui-btn-primary" lay-submit--%>
		<%--							        lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索--%>
		<%--							</button>--%>
		<%--						</div>--%>
		<%--					</div>--%>
		<%--				</form>--%>
		<%--			</div>--%>
		<%--		</fieldset>--%>


		<script type="text/html" id="currentTableBar">
			<a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit">编辑课程</a>
			<a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除课程</a>


		</script>


		<script type="text/html" id="toolbarDemo">
			<div class="layui-btn-container">
				<button class="layui-btn layui-btn-sm data-add-btn" lay-event="tianjia">> 添加课程</button>
				<%--						<button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="del"> 批量删除课程</button>--%>
			</div>
		</script>

		<table id="currentTableId" lay-filter="currentTableFilter"></table>


	</div>
</div>
<script src="<%=path+"/lib/layui-v2.5.5/layui.js"%>" charset="utf-8"></script>
<script>

	// var param;
	// var strings;
	// //加载的时候获取参数(驾校ID)
	// window.onload = function () {
	// 	param = location.search;
	// 	strings = param.split("=");
	// 	console.log(param);
	// 	console.log(strings[0]);
	// 	console.log(strings[1]);
	// };


	layui.use(['form', 'table'], function () {
		var $ = layui.jquery,
			form = layui.form,
			table = layui.table,
			layuimini = layui.layuimini;
		var layer = layui.layer;

		table.render({
			elem: '#currentTableId',
			url: "<%=path+"/dSchool/QueryDSCkecheng"%>",
				// + "?did=" + strings[1],//后台路径
			toolbar: '#toolbarDemo',
			defaultToolbar: ['filter', 'exports', 'print', {
				title: '提示',
				layEvent: 'LAYTABLE_TIPS',
				icon: 'layui-icon-tips'
			}],
			cols: [[

				{field: 'kid', width: 60, title: '课程id', sort: true},
				// {field: 'caccount', width: 80, title: '账号', sort: true},
				{
					field: 'kname', width: 120, title: '课程名称', sort: true

				},
				{
					field: 'kjianjie', width: 80, title: '课程简介'

				},
				{field: 'kprice', width: 100, title: '价格', sort: true},
				{field: 'kjiazhaoleixing', width: 100, title: '驾照类型', sort: true},
				{field: 'beizhu', width: 100, title: '备注'},
				{field: 'kcosttime', width: 100, title: '总学时', sort: true},
				{field: 'kshijianduan', width: 100, title: '练车时间', sort: true},
				{title: '操作', minWidth: 120, templet: '#currentTableBar', fixed: "right", align: "center"}
			]],
			limits: [5, 10, 15],
			limit: 15,
			page: true
		});
		var result;
		// 监听搜索操作
		form.on('submit(data-search-btn)', function (data) {
			result = JSON.stringify(data.field);
			// layer.alert(result, {
			// 	title: '最终的搜索信息'
			// });

			//执行搜索重载
			table.reload('currentTableId', {
				page: {
					curr: $(".layui-laypage-em").next().html() //重新刷新表格在当前页
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
				title: '添加课程',
				type: 2,
				shade: 0.2,
				maxmin: true,
				shadeClose: false,
				area: ['70%', '70%'],
				content: 'kechenginfo.jsp',
				success:function (layero,index) {
					var iframe=window['layui-layer-iframe'+index];
					iframe.selectxingwei();
				}
			});
			$(window).on("resize", function () {
				layer.full(index);
			});

			return false;
		});


		<%--//监听事件--%>
		<%--table.on('toolbar(currentTableFilter)', function (obj) {--%>

		<%--	var checkStatus = table.checkStatus(obj.config.id),--%>
		<%--		data = checkStatus.data;--%>
		<%--	switch (obj.event) {--%>
		<%--		case 'add':--%>
		<%--			layer.msg('添加');--%>
		<%--			break;--%>
		<%--		case 'del':--%>
		<%--			layer.msg('删除');--%>
		<%--			layer.alert(JSON.stringify(data));--%>
		<%--			$.ajax({--%>
		<%--				url: "<%=path+"/dSchool/DelDSC"%>",//后台路径,--%>
		<%--				type: "POST",--%>
		<%--				data: {"delParams": JSON.stringify(data)},--%>
		<%--				dataType: "text",--%>
		<%--				success: function (msg) {--%>

		<%--					if (msg > 0) {--%>

		<%--						layer.msg("批量删除成功", {icon: 6});--%>
		<%--						table.reload('currentTableId', {--%>
		<%--								page: {--%>
		<%--									curr: $(".layui-laypage-em").next().html() //重新刷新表格在当前页--%>
		<%--								}--%>
		<%--								, where: {--%>
		<%--									// searchParams: JSON.stringify(data)--%>
		<%--								}--%>
		<%--							}--%>
		<%--						);--%>
		<%--						return false;--%>


		<%--					} else {--%>
		<%--						layer.msg("删除失败", {icon: 5});--%>
		<%--					}--%>
		<%--				}--%>

		<%--			});--%>
		<%--			break;--%>
		<%--		case 'update':--%>
		<%--			layer.msg('编辑');--%>
		<%--			break;--%>
		<%--	}--%>
		<%--	;--%>
		<%--});--%>


		//监听表格复选框选择
		table.on('checkbox(currentTableFilter)', function (obj) {
			console.log(obj)
		});



		table.on('tool(currentTableFilter)', function (obj) {
			var data = obj.data,layEvent = obj.event;
			if (obj.event === 'edit') {

				var row_data = data ; // 整行的数据
				var index = layer.open({
					title: '编辑用户',
					type: 2,
					shade: 0.2,
					maxmin: true,
					shadeClose: true,
					area: ['70%', '70%'],
					content: 'kechenginfo.jsp',
					success:function (layero,index) {
						var iframe=window['layui-layer-iframe'+index];
						iframe.selectinfo(row_data);
					}
				});
				$(window).on("resize", function () {
					layer.full(index);
				});
				return false;
			} else if (obj.event === 'delete') {
				layer.confirm('真的删除该课程么', function (index) {


					var row_data = data  // 整行的数据
						,kid = row_data.kid ; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名
					layer.confirm("您确定要删除课程 ："+row_data.kname+" 吗?", function (index) {
						$(function() {
							$.ajax({
								method : "POST",
								url : "<%=path%>"+"/dSchool/delkecheng?kid="+kid+"",
								dataType : "text",
								success : function(msg) {
									if(msg>0){
										layer.msg(row_data.kname+"删除成功");
										layer.close(index);
										//执行重载
										table.reload('currentTableId', {
											page: {
												curr: 1 //重新从第 1 页开始
											}
											,where: {
												searchParams: result
											}
										});
									}

								},
								error : function() {
									alert("服务器正忙");
								}
							});
						});
					});

				});
			}
		});

	})
	// ;})
</script>
<script>

</script>

</body>
</html>
