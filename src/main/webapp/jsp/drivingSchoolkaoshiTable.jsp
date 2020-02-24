
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
				<a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="deleteList">删除</a>
			</div>
		</script>

		<table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

		<script type="text/html" id="currentTableBar">
<%--			state=0 代表目前还没通过科目一，学时==XX 说明学时足够了，time1为空，说明此时还没考试安排，可以进行考试安排--%>
			{{#  if(d.eorderstate == 0 && d.eclasshour1 == '100' &&  (d.etesttime1 == null || d.etesttime1.trim()  == '') ){ }}
			<button data-method="dialog" class="layui-btn" id="test1" lay-event="test1">科目一考试安排</button>
			{{#  }
			else if(d.eorderstate == 1 && d.eclasshour2 == '100' &&  (d.etesttime2 == null || d.etesttime2.trim()  == '')){ }}
			<button data-method="dialog" class="layui-btn" id="test2" lay-event="test2">科目二考试安排</button>
			{{#  }
			else if(d.eorderstate == 2 && d.eclasshour3 == '100' &&  (d.etesttime3 == null || d.etesttime3.trim()  == '')){ }}
			<button data-method="dialog" class="layui-btn" id="test3" lay-event="test3">科目三考试安排</button>
			{{#  }
			else if(d.eorderstate == 3 && d.eclasshour4 == '100' &&  (d.etesttime4 == null || d.etesttime4.trim()  == '')){ }}
			<button data-method="dialog" class="layui-btn" id="test4" lay-event="test4">科目四考试安排</button>
			{{#  }
			else if(d.eorderstate == 4){ }}
			<a class="layui-btn layui-btn-xs data-count-edit" lay-event="takeCertificate">领证安排</a>
			{{#  }


<%--         	state=0 代表目前还没通过科目一 ，学时==XX 说明学时足够了，time1不为空，说明已经报名过了，可以进行撤销安排的操作--%>
			else if(d.eorderstate == 0  && d.eclasshour1 == '100' && d.etesttime1 !=null && d.etesttime1.trim() != ''){ }}
			<a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="revoke1">撤回科目一安排</a>
			{{#  }
			else if(d.eorderstate == 1  && d.eclasshour2 == '100' && d.etesttime2 !=null && d.etesttime2.trim() != ''){ }}
			<a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="revoke2">撤回科目二安排</a>
			{{#  }
			else if(d.eorderstate == 2  && d.eclasshour3 == '100' && d.etesttime3 !=null && d.etesttime3.trim() != ''){ }}
			<a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="revoke3">撤回科目三安排</a>
			{{#  }

			else if(d.eorderstate == 3  && d.eclasshour4 == '100' && d.etesttime4 !=null && d.etesttime4.trim() != ''){ }}
			<a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="revoke4">撤回科目四安排</a>
			{{#  }







else { }}
		     --------暂无考试安排 --------
			{{#  }

			}}

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
			url: "<%=path%>"+"/drivingSchool/QueryStudentKaoShiTable",
			toolbar: '#toolbarDemo',
			defaultToolbar: ['filter', 'exports', 'print', {
				title: '提示',
				layEvent: 'LAYTABLE_TIPS',
				icon: 'layui-icon-tips'
			}],
			cols: [[
				{type: "checkbox", width: 50, fixed: "left"},
				{field: 'cid', width: 70, title: 'ID', sort: true},
				{field: 'cname', width: 100, title: '学员姓名'},
				{field: 'caccount', width: 110, title: '学员账号', sort: true},
				{field: 'csex', width: 50, title: '性别'},
				{field: 'cphone', width: 120, title: '电话', sort: true},
				{field: 'cemail', width: 150, title: '邮箱', sort: true},
				{field: 'cidcard', width: 150, title: '身份证'},
				{field: 'cstate', width: 130, title: '账号状态', sort: true
					,templet: function (a)
					{
						if (a.cstate==1){
							return "启用";
						} else if (a.cstate==0) {
							return "禁用";
						}
						else if (a.cstate==2) {
							return "已删除";
						}
					}
			},
				{field: 'cpritiseid', width: 100, title: '教练ID', sort: true},
				{field: 'eclasshour1', width: 50, title: '1', sort: true},
				{field: 'eclasshour2', width: 50, title: '2', sort: true},
				{field: 'eclasshour3', width: 50, title: '3', sort: true},
				{field: 'eclasshour4', width: 50, title: '4', sort: true},

				{title: '操作', minWidth: 150, templet: '#currentTableBar', fixed: "right", align: "center"}
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

		//将表单转为js对象数据
		function serializeObject($, array){
			var obj=new Object();
			$.each(array, function(index,param){
				if(!(param.name in obj)){
					obj[param.name]=param.value;
				}
			});
			return obj;
		};

		//监听行工具事件
		table.on('tool(currentTableFilter)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
			var data = obj.data //获得当前行数据
				,layEvent = obj.event; //获得 lay-event 对应的值
              console.log(data);

			if(layEvent === 'test1'){
				var layer = layui.layer, $ = layui.jquery;
				var row_data = data  // 整行的数据
					,cid = row_data.cid ; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名


					var othis = $(this), //othis当前button对象
						method = othis.data('method');//data-method="dialog"中的值

					if(method == "dialog"){
						layer.open({
							type: 2,
							area: ['500px', '300px'],
							btn: ['确定安排考试', '取消'],
							btn1: function(index, layero){
								//layer.getChildFrame("form", index)获取iframe的表单
								//serializeArray jquery方法，将表单对象序列化为数组
								var formData = serializeObject($, layer.getChildFrame("form", index).serializeArray());
								console.log(formData);
								var s = JSON.stringify(formData);
								console.log(s);
								$.ajax({
									url:"<%=path%>"+"/drivingSchool/kaoShiArrange?cid="+cid+"&pid="+row_data.cpritiseid+"",
									type:'post',
									data: formData,
									success:function(msg){
										if(msg>0){
											layer.alert("用户 ："+row_data.cname+"安排科目一考试成功");
											layer.close(index);
											//执行重载
											table.reload('currentTableId', {
												page: {
													curr: 1 //重新从第 1 页开始
												}
												,where: {
													userAccount:$("#userAccount").val(),
													username:$("#username").val(),
													startTime:$("#startTime").val(),
													stopTime:$("#stopTime").val()
												}
											});
										}
									},error:function (err) {
										console.log(err);
									}
								});
							},
							//要弹出的窗口的路径
							content: "<%=path%>"+"/drivingSchool/kaoShiDialog?test="+layEvent+""  //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
							,success: function(layero, index){
								console.log(layero, index);
							}
						});
					}
			}else if(layEvent === 'test2'){
				var layer = layui.layer, $ = layui.jquery;
				var row_data = data  // 整行的数据
					,cid = row_data.cid ; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名


				var othis = $(this), //othis当前button对象
					method = othis.data('method');//data-method="dialog"中的值

				if(method == "dialog"){
					layer.open({
						type: 2,
						area: ['500px', '300px'],
						btn: ['确定安排考试', '取消'],
						btn1: function(index, layero){
							//layer.getChildFrame("form", index)获取iframe的表单
							//serializeArray jquery方法，将表单对象序列化为数组
							var formData = serializeObject($, layer.getChildFrame("form", index).serializeArray());
							console.log(formData);
							var s = JSON.stringify(formData);
							console.log(s);
							$.ajax({
								url:"<%=path%>"+"/drivingSchool/kaoShiArrange?cid="+cid+"&pid="+row_data.cpritiseid+"",
								type:'post',
								data: formData,
								success:function(msg){
									if(msg>0){
										layer.alert("用户 ："+row_data.cname+"安排科目二考试成功");
										layer.close(index);
										//执行重载
										table.reload('currentTableId', {
											page: {
												curr: 1 //重新从第 1 页开始
											}
											,where: {
												userAccount:$("#userAccount").val(),
												username:$("#username").val(),
												startTime:$("#startTime").val(),
												stopTime:$("#stopTime").val()
											}
										});
									}

								},error:function (err) {
									console.log(err);
								}
							});
						},
						//要弹出的窗口的路径
						content: "<%=path%>"+"/drivingSchool/kaoShiDialog?test="+layEvent+""  //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
						,success: function(layero, index){
							console.log(layero, index);
						}
					});
				}

			}
			else if(layEvent === 'test3'){
				var layer = layui.layer, $ = layui.jquery;
				var row_data = data  // 整行的数据
					,cid = row_data.cid ; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名


				var othis = $(this), //othis当前button对象
					method = othis.data('method');//data-method="dialog"中的值

				if(method == "dialog"){
					layer.open({
						type: 2,
						area: ['500px', '300px'],
						btn: ['确定安排考试', '取消'],
						btn1: function(index, layero){
							//layer.getChildFrame("form", index)获取iframe的表单
							//serializeArray jquery方法，将表单对象序列化为数组
							var formData = serializeObject($, layer.getChildFrame("form", index).serializeArray());
							console.log(formData);
							var s = JSON.stringify(formData);
							console.log(s);
							$.ajax({
								url:"<%=path%>"+"/drivingSchool/kaoShiArrange?cid="+cid+"&pid="+row_data.cpritiseid+"",
								type:'post',
								data: formData,
								success:function(msg){
									if(msg>0){
										layer.alert("用户 ："+row_data.cname+"安排科目三考试成功");
										layer.close(index);
										//执行重载
										table.reload('currentTableId', {
											page: {
												curr: 1 //重新从第 1 页开始
											}
											,where: {
												userAccount:$("#userAccount").val(),
												username:$("#username").val(),
												startTime:$("#startTime").val(),
												stopTime:$("#stopTime").val()
											}
										});
									}

								},error:function (err) {
									console.log(err);
								}
							});
						},
						//要弹出的窗口的路径
						content: "<%=path%>"+"/drivingSchool/kaoShiDialog?test="+layEvent+""  //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
						,success: function(layero, index){
							console.log(layero, index);
						}
					});
				}

			}else if(layEvent === 'test4'){
				var layer = layui.layer, $ = layui.jquery;
				var row_data = data  // 整行的数据
					,cid = row_data.cid ; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名


				var othis = $(this), //othis当前button对象
					method = othis.data('method');//data-method="dialog"中的值

				if(method == "dialog"){
					layer.open({
						type: 2,
						area: ['500px', '300px'],
						btn: ['确定安排考试', '取消'],
						btn1: function(index, layero){
							//layer.getChildFrame("form", index)获取iframe的表单
							//serializeArray jquery方法，将表单对象序列化为数组
							var formData = serializeObject($, layer.getChildFrame("form", index).serializeArray());
							console.log(formData);
							var s = JSON.stringify(formData);
							console.log(s);
							$.ajax({
								url:"<%=path%>"+"/drivingSchool/kaoShiArrange?cid="+cid+"&pid="+row_data.cpritiseid+"",
								type:'post',
								data: formData,
								success:function(msg){
									if(msg>0){
										layer.alert("用户 ："+row_data.cname+"安排科目四考试成功");
										layer.close(index);
										//执行重载
										table.reload('currentTableId', {
											page: {
												curr: 1 //重新从第 1 页开始
											}
											,where: {
												userAccount:$("#userAccount").val(),
												username:$("#username").val(),
												startTime:$("#startTime").val(),
												stopTime:$("#stopTime").val()
											}
										});
									}
								},error:function (err) {
									console.log(err);
								}
							});
						},
						//要弹出的窗口的路径
						content: "<%=path%>"+"/drivingSchool/kaoShiDialog?test="+layEvent+""  //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
						,success: function(layero, index){
							console.log(layero, index);
						}
					});
				}
			}else if(layEvent === 'revoke1'){
				var layer = layui.layer, $ = layui.jquery;
				var row_data = data  // 整行的数据
					,cid = row_data.cid ; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名
				layer.confirm("您确定要撤回用户 ："+row_data.cname+" 的科目一考试安排吗?", function (index) {


					$(function() {
						$.ajax({
							method : "POST",
							url : "<%=path%>"+"/drivingSchool/kaoShiRevoke?do=Revoke1&cid="+cid+"&pid="+row_data.cpritiseid+"",
							dataType : "text",
							success : function(msg) {
								if(msg>0){
									layer.alert(row_data.cname+"的科目一考试已被取消！");
									layer.close(index);
									//执行重载
									table.reload('currentTableId', {
										page: {
											curr: 1 //重新从第 1 页开始
										}
										,where: {
											userAccount:$("#userAccount").val(),
											username:$("#username").val(),
											startTime:$("#startTime").val(),
											stopTime:$("#stopTime").val()
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


			}else if(layEvent === 'revoke2'){
				var layer = layui.layer, $ = layui.jquery;
				var row_data = data  // 整行的数据
					,cid = row_data.cid ; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名

				layer.confirm("您确定要撤回用户 ："+row_data.cname+" 的科目二考试安排吗?", function (index) {


					$(function() {
						$.ajax({
							method : "POST",
							url : "<%=path%>"+"/drivingSchool/kaoShiRevoke?do=Revoke2&cid="+cid+"&pid="+row_data.cpritiseid+"",
							dataType : "text",
							success : function(msg) {
								if(msg>0){
									layer.alert(row_data.cname+"的科目二考试已被取消！");
									layer.close(index);
									//执行重载
									table.reload('currentTableId', {
										page: {
											curr: 1 //重新从第 1 页开始
										}
										,where: {
											userAccount:$("#userAccount").val(),
											username:$("#username").val(),
											startTime:$("#startTime").val(),
											stopTime:$("#stopTime").val()
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

			}else if(layEvent === 'revoke3'){
				var layer = layui.layer, $ = layui.jquery;
				var row_data = data  // 整行的数据
					,cid = row_data.cid ; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名

				layer.confirm("您确定要撤回用户 ："+row_data.cname+" 的科目三考试安排吗?", function (index) {


					$(function() {
						$.ajax({
							method : "POST",
							url : "<%=path%>"+"/drivingSchool/kaoShiRevoke?do=Revoke3&cid="+cid+"&pid="+row_data.cpritiseid+"",
							dataType : "text",
							success : function(msg) {
								if(msg>0){
									layer.alert(row_data.cname+"的科目三考试已被取消！");
									layer.close(index);
									//执行重载
									table.reload('currentTableId', {
										page: {
											curr: 1 //重新从第 1 页开始
										}
										,where: {
											userAccount:$("#userAccount").val(),
											username:$("#username").val(),
											startTime:$("#startTime").val(),
											stopTime:$("#stopTime").val()
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


			}else if(layEvent === 'revoke4'){
				var layer = layui.layer, $ = layui.jquery;
				var row_data = data  // 整行的数据
					,cid = row_data.cid ; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名
				layer.confirm("您确定要撤回用户 ："+row_data.cname+" 的科目四考试安排吗?", function (index) {


					$(function() {
						$.ajax({
							method : "POST",
							url : "<%=path%>"+"/drivingSchool/kaoShiRevoke?do=Revoke4&cid="+cid+"&pid="+row_data.cpritiseid+"",
							dataType : "text",
							success : function(msg) {
								if(msg>0){
									layer.alert(row_data.cname+"的科目四考试已被取消！");
									layer.close(index);
									//执行重载
									table.reload('currentTableId', {
										page: {
											curr: 1 //重新从第 1 页开始
										}
										,where: {
											userAccount:$("#userAccount").val(),
											username:$("#username").val(),
											startTime:$("#startTime").val(),
											stopTime:$("#stopTime").val()
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




	});
	});
</script>
<script>

</script>

</body>
</html>
