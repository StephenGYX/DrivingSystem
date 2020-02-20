
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
			{{#  if(d.eorderstate == 0 && d.eclasshour1 == '100'){ }}
			<button data-method="dialog" class="layui-btn" id="test1" lay-event="test1">科目一考试安排</button>
			{{#  }
			else if(d.eorderstate == 1 && d.eclasshour2 == '100'){ }}
			<a class="layui-btn layui-btn-xs data-count-edit" lay-event="test2">科目二考试安排</a>
			{{#  }
			else if(d.eorderstate == 2 && d.eclasshour3 == '100'){ }}
			<a class="layui-btn layui-btn-xs data-count-edit" lay-event="test3">科目三考试安排</a>
			{{#  }
			else if(d.eorderstate == 3 && d.eclasshour4 == '100'){ }}
			<a class="layui-btn layui-btn-xs data-count-edit" lay-event="test4">科目四考试安排</a>
			{{#  }
			else if(d.eorderstate == 4){ }}
			<a class="layui-btn layui-btn-xs data-count-edit" lay-event="takeCertificate">领证安排</a>
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
							btn: ['确定', '取消'],
							btn1: function(index, layero){
								//layer.getChildFrame("form", index)获取iframe的表单
								//serializeArray jquery方法，将表单对象序列化为数组
								var formData = serializeObject($, layer.getChildFrame("form", index).serializeArray());
								$.ajax({
									url:'<%=path%>',
									type:'post',
									data: formData,
									success:function(data){
										layer.close(index);
									},error:function (err) {
										console.log(err);
									}
								});
							},
							//要弹出的窗口的路径
							content: "<%=path%>"+"/jsp/drivingSchoolKaoShiArrange.jsp"  //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
							,success: function(layero, index){
								console.log(layero, index);
							}
						});
					}


			}


			if(layEvent === 'test2'){
				var layer = layui.layer, $ = layui.jquery;
				var row_data = data  // 整行的数据
					,cid = row_data.cid ; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名
				layer.confirm("您确定要禁用用户 ："+row_data.cname+" 吗?", function (index) {
					$(function() {
						$.ajax({
							method : "POST",
							url : "<%=path%>"+"/drivingSchool/StudentTableOperation?do=stop&cid="+cid+"",
							dataType : "text",
							success : function(msg) {
								if(msg>0){
									layer.alert(row_data.cname+"禁用成功");
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
			else if(layEvent === 'test3'){
				var layer = layui.layer, $ = layui.jquery;
				var row_data = data  // 整行的数据
					,cid = row_data.cid ; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名

				layer.prompt({
					formType: 2,
					value: '',
					title: '请输入您为用户： '+row_data.cname+ '重置的密码'
				}, function(value, index, elem){

					// alert(elem.value);

					$.ajax({
						type: "post",
						url: "<%=path%>"+"/drivingSchool/StudentTableOperation",
						data: {
							"cid":cid,
							"do": "rePsw",
							"password":value
						},
						success : function(msg) {
							if(msg>0){
								layer.alert("用户 ："+row_data.cname+" 重置密码为"+value+"成功");
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

			}else if(layEvent === 'test4'){
				var layer = layui.layer, $ = layui.jquery;
				var row_data = data  // 整行的数据
					,cid = row_data.cid ; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名
				layer.confirm("您确定要删除用户 ："+row_data.cname+" 吗?", function (index) {

					$.ajax({
						method : "POST",
						url:"<%=path%>"+"/drivingSchool/StudentTableOperation",
						type:'post',
						data: {
							"cid":cid,
							"do": "delete"

						},
						success:function(msg){
							if(msg>0){

								layer.alert("用户 ："+row_data.cname+" 删除成功！");
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

							alert("服务器正忙");
						}
					});


				});
			}else if(layEvent === 'takeCertificate'){
				var layer = layui.layer, $ = layui.jquery;
				var row_data = data  // 整行的数据
					,cid = row_data.cid ; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名
				layer.confirm("您确定要通过对用户 ："+row_data.cname+" 的审核吗?", function (index) {
					layer.close(index);

					layer.prompt({
						formType: 2,
						value: '',
						title: '请输入您为用户： '+row_data.cname+ '分配的教练工号'
					}, function(value, index1, elem){
						$.ajax({
							method : "POST",
							url:"<%=path%>"+"/drivingSchool/StudentTableOperation",
							type:'post',
							data: {
								"cid":cid,
								"do": "examinePass",
								"pid":value
							},
							success:function(msg){
								if(msg=="2"){

									layer.alert("用户 ："+row_data.cname+" 已经通过审核！");
									layer.close(index1);
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
								}else if(msg=="404"){
									layer.alert("该教练不存在，请查询后输入");
								}

							},error:function (err) {

								alert("服务器正忙");
							}
						});



					});

				});
			}else if(layEvent === 'examineNoPass'){
				var layer = layui.layer, $ = layui.jquery;
				var row_data = data  // 整行的数据
					,cid = row_data.cid ; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名
				layer.confirm("您确定不通过对用户 ："+row_data.cname+" 的审核吗?", function (index) {

					$.ajax({
						method : "POST",
						url:"<%=path%>"+"/drivingSchool/StudentTableOperation",
						type:'post',
						data: {
							"cid":cid,
							"do": "examineNoPass"

						},
						success:function(msg){
							if(msg>0){

								layer.alert("用户 ："+row_data.cname+" 未通过审核！");
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

							alert("服务器正忙");
						}
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
