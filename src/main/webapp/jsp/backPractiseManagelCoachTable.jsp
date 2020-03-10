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
		<script src=<%=path+"/lib/layui-v2.5.5/layui.js"%>></script>
		<script type="text/javascript" src=<%=path+"/lib/jquery-3.4.1/jquery-3.4.1.min.js"%>></script>
		<script type="text/javascript" src=<%=path+"/js/json2.js"%>></script>
		<script src="<%=path+"/js/practiseManage.js"%>" type="text/javascript"></script>
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
								<label class="layui-form-label">教练ID</label>
								<div class="layui-input-inline">
									<input type="text" id="pid" name="pid" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">教练账号</label>
								<div class="layui-input-inline">
									<input type="text" id="userAccount" name="userAccount" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">教练姓名</label>
								<div class="layui-input-inline">
									<input type="text" id="username" name="username" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">状态</label>
								<div class="layui-input-inline">
									<select name="state" id="state" lay-filter="state">
									<option value="" selected=""></option>
									<option value="0">禁用</option>
									<option value="1">启用</option>
									<option value="2">已删除</option>
									</select>
								</div>
							</div>

							<%--为空说明是后台登录，可以通过驾校名进行查询--%>
							<div class="layui-inline">
								<c:if test="${requestScope.did==null or requestScope.did==''}">
									<label class="layui-form-label">驾校名</label>
								</c:if>
								<div class="layui-input-inline">
									<c:if test="${requestScope.did==null or requestScope.did==''}">

										<select name="schoolName" id="schoolName" lay-filter="schoolName">
											<option value="" selected=""></option>
											<c:forEach items="${requestScope.drivingschools}" var="i">
												<option value=${i.did}>${i.dname}</option>
											</c:forEach>

										</select>
									</c:if>
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

					<c:if test="${requestScope.doThing=='Manage'}" >
						<button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn"> 删除用户 </button>
					</c:if>
				</div>
			</script>

			<table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

			<script type="text/html" id="currentTableBar">
				{{#  if(d.paccountstate == 0  ){ }}
				<c:if test="${requestScope.doThing=='onlySee'}" >
					------------只可读------------
				</c:if>
				<c:if test="${requestScope.doThing=='Manage'}" >
					<a class="layui-btn layui-btn-xs data-count-edit" lay-event="start">启用</a>
					<a class="layui-btn layui-btn-xs data-count-edit" lay-event="rePassword">重置密码</a>
					<a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
					<a class="layui-btn layui-btn-xs data-count-edit" lay-event="seeMyStudent">查看学员</a>
					<a class="layui-btn layui-btn-xs data-count-edit" data-method="dialog" lay-event="myEval">所受评价</a>
				</c:if>


				{{#  }
				else if(d.paccountstate == 1 ){ }}
				<c:if test="${requestScope.doThing=='onlySee'}" >
					------------只可读------------
				</c:if>
				<c:if test="${requestScope.doThing=='Manage'}" >
					<a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="stop">禁用</a>
					<a class="layui-btn layui-btn-xs data-count-edit" lay-event="rePassword">重置密码</a>
					<a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
					<a class="layui-btn layui-btn-xs data-count-edit" lay-event="seeMyStudent">查看学员</a>
					<a class="layui-btn layui-btn-xs data-count-edit" data-method="dialog"  lay-event="myEval">所受评价</a>
				</c:if>
				{{#  }
				else if(d.paccountstate == 2){ }}
				---------已删除----------
				{{#  }
				}}

			</script>

		</div>
	</div>
	<script src="<%=path+"/lib/layui-v2.5.5/layui.js"%>" charset="utf-8"></script>



	<input type="hidden" id="param" value="${requestScope.did}">
	<input type="hidden" id="doThing" value="${requestScope.doThing}">
<%--	<input type="text" id="doThing" value="${requestScope.doThing}">--%>
<%--	<input  id="aa" value="${requestScope.did}">--%>
	<script>



		layui.use(['form', 'table'], function () {
			var $ = layui.jquery,
				form = layui.form,
				table = layui.table,
				layuimini = layui.layuimini;

			table.render({
				elem: '#currentTableId',
				url: "<%=path%>"+"/backPractise/queryAllCoach?did="+$("#param").val()+"",
				toolbar: '#toolbarDemo',
				defaultToolbar: ['filter', 'exports', 'print', {
					title: '提示',
					layEvent: 'LAYTABLE_TIPS',
					icon: 'layui-icon-tips'
				}],
				cols: [[
					{type: "checkbox", width: 50, fixed: "left"},
					{field: 'pid', width: 80, title: 'ID', sort: true},
					{field: 'pphoto',title: '图片',width:60,
						templet: function (d) {
							return '<div ><img src="'+d.pphoto+'"  width="50px" height="50px" onclick="showBigImage(this)"></a></div>';

					}
					},
					{field: 'pname', width: 80, title: '姓名'},
					{field: 'paccount', width: 180, title: '账号', sort: true},
					{field: 'psex', width: 80, title: '性别'},
					{field: 'pphone', width: 80, title: '电话', sort: true},
					{field: 'pemail', width: 200, title: '邮箱', sort: true},
					{field: 'pdrivingid', width: 80, title: '驾校ID'},
					{field: 'paccountstate', width: 100, title: '账号状态', sort: true
						,templet: function (a)
						{
							if (a.paccountstate==1){
								return "启用";
							} else if (a.paccountstate==0) {
								return "禁用";
							}
							else if (a.paccountstate==2) {
								return "已删除";
							}
						}
					},


					{field: 'page', title: '年龄', minWidth: 90},
					{title: '操作', minWidth: 400, templet: '#currentTableBar', fixed: "right", align: "center"}
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
						stopTime:$("#stopTime").val(),
						didSearch:$("#schoolName option:selected").val(),
						pid:$("#pid").val(),
						state:$("#state option:selected").val()

					}
				}, 'data');

				return false;
			});

			//监听行工具事件
			table.on('tool(currentTableFilter)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
				var data = obj.data //获得当前行数据
					,layEvent = obj.event; //获得 lay-event 对应的值

				console.log(data);

				if(layEvent === 'start'){
					var layer = layui.layer, $ = layui.jquery;
					var row_data = data  // 整行的数据
						,pid = row_data.pid ; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名
					layer.confirm("您确定要启用用户 ："+row_data.pname+" 吗?", function (index) {
						$(function() {
							$.ajax({
								method : "POST",
								url : "<%=path%>"+"/backPractise/CoachTableOperation?do=start&pid="+pid+"",
								dataType : "text",
								success : function(msg) {
									if(msg>0){
										layer.alert(row_data.pname+"启用成功");
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
												stopTime:$("#stopTime").val(),
												didSearch:$("#schoolName option:selected").val(),
												pid:$("#pid").val(),
												state:$("#state option:selected").val()
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
						,pid = row_data.pid ; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名
					layer.confirm("您确定要禁用用户 ："+row_data.pname+" 吗?", function (index) {
						$(function() {
							$.ajax({
								method : "POST",
								url : "<%=path%>"+"/backPractise/CoachTableOperation?do=stop&pid="+pid+"",
								dataType : "text",
								success : function(msg) {
									if(msg>0){
										layer.alert(row_data.pname+"禁用成功");
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
												stopTime:$("#stopTime").val(),
												didSearch:$("#schoolName option:selected").val(),
												pid:$("#pid").val(),
												state:$("#state option:selected").val()
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
						,pid = row_data.pid ,
						paccount=row_data.paccount; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名

					layer.prompt({
						formType: 2,
						value: '',
						title: '请输入您为用户： '+row_data.pname+ '重置的密码'
					}, function(value, index, elem){

						// alert(elem.value);

						$.ajax({
							type: "post",
							url: "<%=path%>"+"/backPractise/CoachTableOperation",
							data: {
								"paccount":paccount,
								"pid":pid,
								"do": "rePsw",
								"password":value
							},
							success : function(msg) {
								if(msg>0){
									layer.alert("用户 ："+row_data.pname+" 重置密码为"+value+"成功");
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
											stopTime:$("#stopTime").val(),
											didSearch:$("#schoolName option:selected").val(),
											pid:$("#pid").val(),
											state:$("#state option:selected").val()
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
						,pid = row_data.pid ; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名
					layer.confirm("您确定要删除用户 ："+row_data.pname+" 吗?", function (index) {

						$.ajax({
							method : "POST",
							url:"<%=path%>"+"/backPractise/CoachTableOperation",
							type:'post',
							data: {
								"pid":pid,
								"do": "delete"
							},
							success:function(msg){
								if(msg>0){

									layer.alert("用户 ："+row_data.pname+" 删除成功！");
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
											stopTime:$("#stopTime").val(),
											didSearch:$("#schoolName option:selected").val(),
											pid:$("#pid").val(),
											state:$("#state option:selected").val()
										}
									});
								}

							},error:function (err) {

								alert("服务器正忙");
							}
						});


					});
				}
				else if(layEvent === 'seeMyStudent'){
					var layer = layui.layer, $ = layui.jquery;
					var row_data = data  // 整行的数据
						,pid = row_data.pid ; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名
					window.location.href="<%=path%>"+"/backPractise/seeMyStudent?do=onlySee&pid="+pid+""

				}else if(layEvent === 'myEval'){
					var layer = layui.layer, $ = layui.jquery;
					var row_data = data  // 整行的数据
						,pid = row_data.pid ; // 获取行数据的 id 值 对数据进行检索 操作,row_data.X 这个X是你的字段名


					var othis = $(this), //othis当前对象
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
								console.log(formData);
								var s = JSON.stringify(formData);
								console.log(s);

							},
							//要弹出的窗口的路径
							content: "<%=path%>"+"/backPractise/practiseEval?pid="+pid+"&did="+$("#param").val()+"" //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
							,success: function(layero, index){
								console.log(layero, index);
							}
						});
					}
				}





			// // 监听添加操作
			// $(".data-add-btn").on("click", function () {
			//
			// 	var index = layer.open({
			// 		title: '添加用户',
			// 		type: 2,
			// 		shade: 0.2,
			// 		maxmin:true,
			// 		shadeClose: true,
			// 		area: ['100%', '100%'],
			// 		content: '/page/table/add.html',
			// 	});
			// 	$(window).on("resize", function () {
			// 		layer.full(index);
			// 	});
			//
			// 	return false;
			// });

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

				//将表单转为js对象数据
				function serializeObject($, array){
					var obj=new Object();
					$.each(array, function(index,param){
						if(!(param.name in obj)){
							obj[param.name]=param.value;
						}
					});
					return obj;
				}

		});
		});
	</script>

	<<script>

		function showBigImage(e) {
			layer.open({
				type: 1,
				title: false,
				closeBtn: 0,
				shadeClose: true, //点击阴影关闭
				area: [$(e).width + 'px', $(e).height + 'px'], //宽高
				content: "<img src=" + $(e).attr('src') + " />"
			});
		}

	</script>

	</body>
	</html>