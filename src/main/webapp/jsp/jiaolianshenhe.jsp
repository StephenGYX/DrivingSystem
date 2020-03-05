<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = application.getContextPath();
%>
<html>
<head>
	<meta charset="utf-8">
	<title>教练审核</title>
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

		<fieldset class="table-search-fieldset">
			<legend>搜索信息</legend>
			<div style="margin: 10px 10px 10px 10px">
				<form class="layui-form layui-form-pane" action="">
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">教练名称</label>
							<div class="layui-input-inline">
								<input type="text" name="pname" id="pname" autocomplete="off" class="layui-input">
							</div>
						</div>
						<%--						<div class="layui-inline">--%>
						<%--							<label class="layui-form-label">驾校联系人</label>--%>
						<%--							<div class="layui-input-inline">--%>
						<%--								<input type="text" name="paccount" id="paccount" autocomplete="off"--%>
						<%--								       class="layui-input">--%>
						<%--							</div>--%>
						<%--						</div>--%>
						<div class="layui-inline">
							<label class="layui-form-label">性别</label>
							<div class="layui-input-inline">
								<%--								<input type="text" name="daccountstate" id="daccountstate" autocomplete="off"--%>
								<%--								       class="layui-input">--%>
								<select name="psex">
									<option value="">未选择</option>
									<option value="男">男</option>
									<option value="女">女</option>
									<%--									<option value="1">已拒绝</option>--%>

								</select>
							</div>
						</div>

						<div class="layui-inline">
							<button type="submit" class="layui-btn layui-btn-primary" lay-submit
							        lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索
							</button>
						</div>
					</div>
				</form>
			</div>
		</fieldset>

		<%--		<script type="text/html" id="toolbarDemo">--%>
		<%--			<div class="layui-btn-container">--%>
		<%--				<button class="layui-btn layui-btn-sm data-add-btn"> 添加用户</button>--%>
		<%--				<button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="del"> 删除用户</button>--%>
		<%--			</div>--%>
		<%--		</script>--%>

		<table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

		<script type="text/html" id="currentTableBar">
			<%--			<a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit">编辑</a>--%>
			<%--			<a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>--%>


			{{#  if(d.paccountstate == 5  ){ }}
			---------已被拒绝----------

			{{#  }
			else if(d.paccountstate == 1 ){ }}
			---------已通过已启用----------
			{{#  }

			else if(d.paccountstate == 4){ }}

			<a class="layui-btn layui-btn-xs data-count-edit" lay-event="start">审核通过</a>
			<a class="layui-btn layui-btn-xs layui-btn-danger data-count-edit" lay-event="stop">拒绝</a>
			{{#  }
			}}


		</script>

	</div>
</div>
<script type="text/javascript" src=<%=path + "/lib/jquery-3.4.1/jquery-3.4.1.min.js"%>></script>

<script src="<%=path+"/lib/layui-v2.5.5/layui.js"%>" charset="utf-8"></script>
<script>
	layui.use(['form', 'table'], function () {
		var $ = layui.jquery,
			form = layui.form,
			table = layui.table,
			layuimini = layui.layuimini;

		table.render({
			elem: '#currentTableId',
			url: "<%=path+"/dSchool/Queryjiaolianshenhe"%>",//后台路径
			toolbar: '#toolbarDemo',
			defaultToolbar: ['filter', 'exports', 'print', {
				title: '提示',
				layEvent: 'LAYTABLE_TIPS',
				icon: 'layui-icon-tips'
			}],
			cols: [[
				{type: "checkbox", width: 30, fixed: "left"},
				{field: 'pid', width: 60, title: 'id', sort: true},
				{field: 'paccount', width: 80, title: '账号', sort: true},
				{field: 'pname', minWidth: 100, title: '姓名'},
				{field: 'psex', width: 80, title: '性别', sort: true},
				{field: 'pphone', width: 100, title: '联系电话'},
				{field: 'pemail', title: '邮箱', minWidth: 120},
				// {field: 'dsynopsis', width: 100, title: '简介'},
				// {field: 'devaluatescore', width: 80, title: '总评分', sort: true},
				// {field: 'dgraduationnum', width: 100, title: '毕业人数', sort: true},
				// {field: 'denrollnum', width: 80, title: '注册人数', sort: true},
				{
					fixed: 'vphoto',
					title: '驾校资格证明', width: 80, templet: function (d) {
						return '<div ><img src="../' + d.pidimage + '"  width="50px" height="50px" onclick="showBigImage(this)"></a></div>';
					}
				},


				{
					field: 'dshenhestate', minWidth: 120, title: '账号审核状态'
					, templet: function (d) {
						if (d.paccountstate == '4') {
							return '未审核'
						} else if (d.paccountstate == '1') {
							return '已通过'
						} else {
							return '已拒绝'
						}

					}
				},
				// {
				// 	field: 'address', minWidth: 120, title: '住址'
				// 	, templet: function (d) {
				// 		return d.pprovince+d.pcity+d.parea;
				// 	}
				// },
				{title: '操作', minWidth: 350, templet: '#currentTableBar', fixed: "right", align: "center"}
			]],
			limits: [5, 10, 15],
			limit: 5,
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

		// // 监听添加操作
		// $(".data-add-btn").on("click", function () {
		//
		// 	var index = layer.open({
		// 		title: '添加用户',
		// 		type: 2,
		// 		shade: 0.2,
		// 		maxmin: true,
		// 		shadeClose: false,
		// 		area: ['70%', '70%'],
		// 		content: 'area.jsp'
		// 	});
		// 	$(window).on("resize", function () {
		// 		layer.full(index);
		// 	});
		//
		// 	return false;
		// });


		//监听表格复选框选择
		table.on('checkbox(currentTableFilter)', function (obj) {
			console.log(obj)
		});

		//监听行工具事件
		table.on('tool(currentTableFilter)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
			var data = obj.data //获得当前行数据
				, layEvent = obj.event; //获得 lay-event 对应的值

			console.log(data);

			if (layEvent === 'start') {
				var layer = layui.layer, $ = layui.jquery;
				var row_data = data  // 整行的数据
					, did = row_data.did; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名
				layer.confirm("您确定要通过教练 ：" + row_data.dname + " 的审核吗?", function (index) {
					$(function () {
						$.ajax({
							method: "POST",
							url: "<%=path%>" + "/dSchool/shenhejiaolianOperation?do=start&did=" + did + "",
							dataType: "text",
							success: function (msg) {
								if (msg > 0) {
									layer.msg(row_data.dname + "审核通过");
									layer.close(index);
									//执行重载
									table.reload('currentTableId', {
										page: {
											curr: 1 //重新从第 1 页开始
										}
										, where: {
											searchParams: result
										}
									});
								}

							},
							error: function () {
								alert("服务器正忙");
							}
						});
					});
				});

			} else if (layEvent === 'stop') {
				var layer = layui.layer, $ = layui.jquery;
				var row_data = data  // 整行的数据
					, did = row_data.did; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名
				layer.confirm("您确定要拒绝教练 ：" + row_data.dname + " 吗?", function (index) {
					$(function () {
						$.ajax({
							method: "POST",
							url: "<%=path%>" + "/dSchool/shenhejiaolianOperation?do=stop&did=" + did + "",
							dataType: "text",
							success: function (msg) {
								if (msg > 0) {
									layer.msg(row_data.dname + "审核禁止成功");
									layer.close(index);
									//执行重载
									table.reload('currentTableId', {
										page: {
											curr: 1 //重新从第 1 页开始
										}
										, where: {
											searchParams: result
										}
									});
								}

							},
							error: function () {
								alert("服务器正忙");
							}
						});

					});
				});

			}
				<%--else if(layEvent === 'rePassword'){--%>
				<%--	var layer = layui.layer, $ = layui.jquery;--%>
				<%--	var row_data = data  // 整行的数据--%>
				<%--		,did = row_data.did ; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名--%>

				<%--	layer.prompt({--%>
				<%--		formType: 2,--%>
				<%--		value: '',--%>
				<%--		title: '请输入您为驾校： '+row_data.dname+ '重置的密码'--%>
				<%--	}, function(value, index, elem){--%>

				<%--		// alert(elem.value);--%>

				<%--		$.ajax({--%>
				<%--			type: "post",--%>
				<%--			url: "<%=path%>"+"/dSchool/CoachTableOperation",--%>
				<%--			data: {--%>
				<%--				"did":did,--%>
				<%--				"do": "rePsw",--%>
				<%--				"password":value--%>
				<%--			},--%>
				<%--			success : function(msg) {--%>
				<%--				if(msg>0){--%>
				<%--					layer.alert("用户 ："+row_data.dname+" 重置密码为"+value+"成功");--%>
				<%--					layer.close(index);--%>
				<%--					//执行重载--%>
				<%--					table.reload('currentTableId', {--%>
				<%--						page: {--%>
				<%--							curr: 1 //重新从第 1 页开始--%>
				<%--						}--%>
				<%--						,where: {--%>
				<%--							searchParams: result--%>
				<%--						}--%>
				<%--					});--%>
				<%--				}--%>
				<%--			},--%>
				<%--			error : function() {--%>
				<%--				alert("服务器正忙");--%>
				<%--			}--%>

				<%--		});--%>
			// 	});

			else if (layEvent === 'delete') {
				var layer = layui.layer, $ = layui.jquery;
				var row_data = data  // 整行的数据
					, did = row_data.did; // 获取行数据的 账号 值 对数据进行检索 操作,row_data.X 这个X是你的字段名
				layer.confirm("您确定要删除驾校 ：" + row_data.dname + " 吗?", function (index) {

					$.ajax({
						method: "POST",
						url: "<%=path%>" + "/dSchool/CoachTableOperation",
						type: 'post',
						data: {
							"did": did,
							"do": "delete"
						},
						success: function (msg) {
							if (msg > 0) {

								layer.alert("用户 ：" + row_data.dname + " 删除成功！");
								layer.close(index);
								//执行重载
								table.reload('currentTableId', {
									page: {
										curr: 1 //重新从第 1 页开始
									}
									, where: {
										searchParams: result
									}
								});
							}

						}, error: function (err) {

							alert("服务器正忙");
						}
					});


				});
			} else if (layEvent === 'seepract') {
				//查看教练
				var layer = layui.layer;
				var row_data = data  // 整行的数据
					, did = row_data.did; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名
				//此处可走一个ajax把对应的驾校信息存入session；
				var index = layer.open({
					title: '查看教练',
					type: 2,
					shade: 0.2,
					maxmin: true,
					shadeClose: false,
					area: ['70%', '70%'],
					content: '/backPractise/toMyDrivingSchool?did=' + row_data.did
				});


				window.location.href = "<%=path%>" + "/jsp/drivingSchoolStudentTable.jsp?did=" + did + ""
			} else if (layEvent === 'pingjia') {
				var layer = layui.layer;
				var row_data = data; // 整行的数据
				alert("进入评价")
				var index = layer.open({
					title: '查看评价',
					type: 2,
					shade: 0.2,
					maxmin: true,
					shadeClose: false,
					area: ['70%', '70%'],
					content: 'DSC/DschPingJia.jsp?did=' + row_data.did
				});
			}

			// table.on('tool(currentTableFilter)', function (obj) {
			// 	var data = obj.data;
			// 	if (obj.event === 'edit') {
			//
			// 		var index = layer.open({
			// 			title: '编辑用户',
			// 			type: 2,
			// 			shade: 0.2,
			// 			maxmin: true,
			// 			shadeClose: true,
			// 			area: ['100%', '100%'],
			// 			content: '/page/table/edit.html',
			// 		});
			// 		$(window).on("resize", function () {
			// 			layer.full(index);
			// 		});
			// 		return false;
			// 	} else if (obj.event === 'delete') {
			// 		layer.confirm('真的删除行么', function (index) {
			// 			obj.del();
			// 			layer.close(index);
			// 		});
			// 	}
			// });

		});
	})
</script>
<script>


	function showBigImage(e) {

		var width = $(e).width();
		var height = $(e).height();
		var scaleWH = width / height;
		var bigH = 600;
		var bigW = scaleWH * bigH;
		if (bigW > 900) {
			bigW = 900;
			bigH = bigW / scaleWH;
		}

		// 放大预览图片
		layer.open({
			type: 1,
			title: false,
			closeBtn: 1,
			shadeClose: true,
			area: [bigW + 'px', bigH + 'px'], //宽高
			content: "<img width='" + bigW + "' height='" + bigH + "' src=" + $(e).attr('src') + " />"
		});


	}
</script>

</body>
</html>
