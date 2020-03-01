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

		<fieldset class="table-search-fieldset">
			<legend>搜索信息</legend>
			<div style="margin: 10px 10px 10px 10px">
				<form class="layui-form layui-form-pane" action="">
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">驾校名</label>
							<div class="layui-input-inline">
								<input type="text" name="dname" id="dname" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">驾校联系人</label>
							<div class="layui-input-inline">
								<input type="text" name="dcontacts" id="dcontacts" autocomplete="off"
								       class="layui-input">
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">用户状态</label>
							<div class="layui-input-inline">
								<%--								<input type="text" name="daccountstate" id="daccountstate" autocomplete="off"--%>
								<%--								       class="layui-input">--%>
								<select name="daccountstate">
									<option value="">未选择</option>
									<option value="1">启用</option>
									<option value="2">禁用</option>
									<option value="3">已删除</option>

								</select>
							</div>
						</div>
						<%--							<div class="layui-inline">--%>
						<%--								<label class="layui-form-label">用户职业</label>--%>
						<%--								<div class="layui-input-inline">--%>
						<%--									<input type="text" name="classify" autocomplete="off" class="layui-input">--%>
						<%--								</div>--%>
						<%--							</div>--%>
						<div class="layui-inline">
							<button type="submit" class="layui-btn layui-btn-primary" lay-submit
							        lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索
							</button>
						</div>
					</div>
				</form>
			</div>
		</fieldset>

		<script type="text/html" id="toolbarDemo">
			<div class="layui-btn-container">
				<button class="layui-btn layui-btn-sm data-add-btn"> 添加用户</button>
				<button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="del"> 删除用户</button>
			</div>
		</script>

		<table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

		<script type="text/html" id="currentTableBar">
			<%--			<a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit">编辑</a>--%>
			<%--			<a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>--%>


			{{#  if(d.daccountstate == 2  ){ }}
			<a class="layui-btn layui-btn-xs data-count-edit" lay-event="start">启用</a>
			<a class="layui-btn layui-btn-xs data-count-edit" lay-event="rePassword">重置密码</a>
			<a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
			<a class="layui-btn layui-btn-xs data-count-edit" lay-event="seepract">查看教练</a>
			<a class="layui-btn layui-btn-xs data-count-edit" lay-event="pingjia">查看评价</a>
			<a class="layui-btn layui-btn-xs data-count-edit" lay-event="updataa">修改信息</a>
			{{#  }
			else if(d.daccountstate == 1 ){ }}
			<a class="layui-btn layui-btn-xs data-count-edit" lay-event="stop">禁用</a>
			<a class="layui-btn layui-btn-xs data-count-edit" lay-event="rePassword">重置密码</a>
			<a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
			<a class="layui-btn layui-btn-xs data-count-edit" lay-event="seepract">查看教练</a>
			<a class="layui-btn layui-btn-xs data-count-edit" lay-event="pingjia">评价</a>
			<a class="layui-btn layui-btn-xs data-count-edit" lay-event="updataa">修改信息</a>
			{{#  }

			else if(d.daccountstate == 3){ }}
			---------已删除----------
			{{#  }
			}}


		</script>

	</div>
</div>
<script src="../lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
	layui.use(['form', 'table'], function () {
		var $ = layui.jquery,
			form = layui.form,
			table = layui.table,
			layuimini = layui.layuimini;

		table.render({
			elem: '#currentTableId',
			url: "<%=path+"/dSchool/QueryDSC"%>",//后台路径
			toolbar: '#toolbarDemo',
			defaultToolbar: ['filter', 'exports', 'print', {
				title: '提示',
				layEvent: 'LAYTABLE_TIPS',
				icon: 'layui-icon-tips'
			}],
			cols: [[
				{type: "checkbox", width: 30, fixed: "left"},
				{field: 'did', width: 60, title: 'id', sort: true},
				{field: 'daccount', width: 80, title: '账号', sort: true},
				{field: 'dname', minWidth: 100, title: '驾校名'},
				{field: 'dcontacts', width: 80, title: '驾校联系人', sort: true},
				{field: 'dtelephone', width: 100, title: '联系电话'},
				{field: 'demail', title: '邮箱', minWidth: 120},
				{field: 'dsynopsis', width: 100, title: '概要'},
				{field: 'devaluatescore', width: 80, title: '总评分', sort: true},
				{field: 'dgraduationnum', width: 100, title: '毕业人数', sort: true},
				{field: 'denrollnum', width: 80, title: '注册人数', sort: true},
				{fixed: 'vphoto',
					title: '图片',width:80,templet: function (d) {
						return '<div ><img src="'+d.vphoto+'"  width="50px" height="50px" onclick="showBigImage(this)"></a></div>';
					}
				},

				{
					field: 'daccountstate', minWidth: 100, title: '账号状态'
					, templet: function (d) {
						if (d.daccountstate == 1) {
							return '启用'
						}
						if (d.daccountstate == 2) {
							return '禁用'
						} else {
							return '已删除'
						}

					}
				},
				{
					field: 'address', minWidth: 120, title: '住址'
					, templet: function (d) {
						return d.dprovince+d.dcity+d.darea;
					}
				},
				{title: '操作', minWidth: 380, templet: '#currentTableBar', fixed: "right", align: "center"}
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

		// 监听添加操作
		$(".data-add-btn").on("click", function () {

			var index = layer.open({
				title: '添加用户',
				type: 2,
				shade: 0.2,
				maxmin: true,
				shadeClose: false,
				area: ['70%', '70%'],
				content: 'area.jsp'
			});
			$(window).on("resize", function () {
				layer.full(index);
			});

			return false;
		});


		//监听事件
		table.on('toolbar(currentTableFilter)', function (obj) {

			var checkStatus = table.checkStatus(obj.config.id),
				data = checkStatus.data;
			switch (obj.event) {
				case 'add':
					layer.msg('添加');
					break;
				case 'del':
					layer.msg('删除');
					layer.alert(JSON.stringify(data));
					$.ajax({
						url: "<%=path+"/dSchool/DelDSC"%>",//后台路径,
						type: "POST",
						data: {"delParams": JSON.stringify(data)},
						dataType: "text",
						success: function (msg) {

							if (msg > 0) {

								layer.msg("批量删除成功", {icon: 6});
								table.reload('currentTableId', {
										page: {
											curr: $(".layui-laypage-em").next().html() //重新刷新表格在当前页
										}
										, where: {
											// searchParams: JSON.stringify(data)
										}
									}
								);
								return false;


							} else {
								layer.msg("删除失败", {icon: 5});
							}
						}

					});
					break;
				case 'update':
					layer.msg('编辑');
					break;
			}
			;
		});


		<%--// 监听删除操作--%>
		<%--$(".data-delete-btn").on("click", function () {--%>
		<%--	var checkStatus = table.checkStatus('currentTableId')--%>
		<%--		, data = checkStatus.data;--%>
		<%--	// layer.alert(JSON.stringify(data));--%>
		<%--	alert("321");--%>
		<%--	console.log(JSON.stringify(data));--%>

		<%--	$.ajax({--%>
		<%--		url: "<%=path+"/dSchool/DelDSC"%>",//后台路径,--%>
		<%--		type: "POST",--%>
		<%--		data: {"delParams": JSON.stringify(data)},--%>
		<%--		dataType: "text",--%>
		<%--		success: function (msg) {--%>

		<%--			if (msg > 0) {--%>

		<%--				layer.msg("删除成功", {icon: 6});--%>
		<%--				table.reload('currentTableId', {--%>
		<%--					page: {--%>
		<%--						curr:1--%>
		<%--							// $(".layui-laypage-em").next().html() //重新刷新表格在当前页--%>
		<%--					}--%>
		<%--					, where: {--%>
		<%--						// searchParams: JSON.stringify(data)--%>
		<%--					}--%>
		<%--				}--%>

		<%--				);--%>
		<%--				return false;--%>


		<%--			} else {--%>
		<%--				layer.msg("删除失败", {icon: 5});--%>
		<%--			}--%>
		<%--		}--%>

		<%--	});--%>


		<%--});--%>

		//监听表格复选框选择
		table.on('checkbox(currentTableFilter)', function (obj) {
			console.log(obj)
		});

		//监听行工具事件
		table.on('tool(currentTableFilter)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
			var data = obj.data //获得当前行数据
				,layEvent = obj.event; //获得 lay-event 对应的值

			console.log(data);

			if(layEvent === 'start'){
				var layer = layui.layer, $ = layui.jquery;
				var row_data = data  // 整行的数据
					,did = row_data.did ; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名
				layer.confirm("您确定要启用用户 ："+row_data.dname+" 吗?", function (index) {
					$(function() {
						$.ajax({
							method : "POST",
							url : "<%=path%>"+"/dSchool/CoachTableOperation?do=start&did="+did+"",
							dataType : "text",
							success : function(msg) {
								if(msg>0){
									layer.alert(row_data.dname+"启用成功");
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

			} else if(layEvent === 'stop'){
				var layer = layui.layer, $ = layui.jquery;
				var row_data = data  // 整行的数据
					,did = row_data.did ; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名
				layer.confirm("您确定要禁用用户 ："+row_data.dname+" 吗?", function (index) {
					$(function() {
						$.ajax({
							method : "POST",
							url : "<%=path%>"+"/dSchool/CoachTableOperation?do=stop&did="+did+"",
							dataType : "text",
							success : function(msg) {
								if(msg>0){
									layer.alert(row_data.dname+"禁用成功");
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

			}
			else if(layEvent === 'rePassword'){
				var layer = layui.layer, $ = layui.jquery;
				var row_data = data  // 整行的数据
					,did = row_data.did ; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名

				layer.prompt({
					formType: 2,
					value: '',
					title: '请输入您为驾校： '+row_data.dname+ '重置的密码'
				}, function(value, index, elem){

					// alert(elem.value);

					$.ajax({
						type: "post",
						url: "<%=path%>"+"/dSchool/CoachTableOperation",
						data: {
							"did":did,
							"do": "rePsw",
							"password":value
						},
						success : function(msg) {
							if(msg>0){
								layer.alert("用户 ："+row_data.dname+" 重置密码为"+value+"成功");
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

			}else if(layEvent === 'delete'){
				var layer = layui.layer, $ = layui.jquery;
				var row_data = data  // 整行的数据
					,did = row_data.did ; // 获取行数据的 账号 值 对数据进行检索 操作,row_data.X 这个X是你的字段名
				layer.confirm("您确定要删除驾校 ："+row_data.dname+" 吗?", function (index) {

					$.ajax({
						method : "POST",
						url:"<%=path%>"+"/dSchool/CoachTableOperation",
						type:'post',
						data: {
							"did":did,
							"do": "delete"
						},
						success:function(msg){
							if(msg>0){

								layer.alert("用户 ："+row_data.dname+" 删除成功！");
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

						},error:function (err) {

							alert("服务器正忙");
						}
					});


				});
			}


			else if (layEvent === 'updataa') {
				var layer = layui.layer;
				var row_data = data ; // 整行的数据
				alert("进入修改");
				var index = layer.open({
					title: '查看评价',
					type: 2,
					shade: 0.2,
					maxmin: true,
					shadeClose: false,
					area: ['70%', '70%'],
					content: 'DSC/DSCHinfo2.jsp',
					success:function (layero,index) {
						var iframe=window['layui-layer-iframe'+index];
						iframe.selectinfo(row_data);
					}
				});
			}





			else if(layEvent === 'seepract'){
				//查看教练
				var layer = layui.layer;
				var row_data = data  // 整行的数据
					,did = row_data.did ; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名
				//此处可走一个ajax把对应的驾校信息存入session；
				var index = layer.open({
					title: '查看教练',
					type:2 ,
					shade: 0.2,
					maxmin: true,
					shadeClose: false,
					area: ['70%', '70%'],
					content:"<%=path%>"+
						'/backPractise/toMyDrivingSchool?do=onlySee&did='+row_data.did
				});





				<%--window.location.href="<%=path%>"+"/jsp/drivingSchoolStudentTable.jsp?did="+did+""--%>
			}
			else if (layEvent === 'pingjia') {
				var layer = layui.layer;
				var row_data = data ; // 整行的数据
				alert("进入评价");
				var index = layer.open({
					title: '查看评价',
					type: 2,
					shade: 0.2,
					maxmin: true,
					shadeClose: false,
					area: ['70%', '70%'],
					content: 'DSC/DschPingJia.jsp?did='+row_data.did
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

	});})
</script>
<script>

</script>

</body>
</html>
