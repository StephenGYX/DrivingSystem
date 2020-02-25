
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
		<script type="text/javascript" src="<%=path+"/js/jquery-3.4.1.js"%>"></script>
		<link rel="stylesheet" href="<%=path+"/lib/layui-v2.5.5/css/layui.css"%>" media="all">

	</head>

	<body>
	<script type="text/html" id="editpanel">
		<div id="layout1">
			<form class="layui-form"  onsubmit="return false">
			<input type="hidden" name="id" id="iid"><br><br>
				<input type="hidden" name="opman" id="opman" value="nini">
				<input type="hidden" name="subject" value="2">
			<div class="layui-form-item">
				<label class="layui-form-label">视频路径:</label>
				<div class="layui-input-block">
					<input type="text" name="url" required lay-verify="required" id="url" placeholder="请输入题目内容" autocomplete="off"
					       class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">视频标题:</label>
				<div class="layui-input-block">
					<input type="text" name="info" required lay-verify="required" id="info"
					       autocomplete="off" class="layui-input">
				</div>
			</div>
				<div class="layui-form-item">
					<div class="layui-input-block" id="btgrouplogin">
						<button class="layui-btn layui-btn-warm" lay-submit id="confirmbtn" lay-filter="formDemo">确认</button>

					</div>
				</div>

					</form>
		</div>
	</script>
	<form class="layui-form">

		<div class="layui-form-item">
			<%--		<div class="layui-block">--%>
				<br><br>
			<label class="layui-form-label" >视频id ：</label>
			<div class="layui-input-inline">
				<input name="id" id="query_id" class="layui-input" type="text" autocomplete="off" >
			</div>

			<label class="layui-form-label" >视频标题 ：</label>
			<div class="layui-input-inline">
				<input name="info" id="query_info"  class="layui-input" type="text" autocomplete="off" >
			</div>
				<div class="layui-block">
					<button class="layui-btn " id="query_btn"  type="button">查询</button>

						<button class="layui-btn layui-btn-warm " id="add"  type="button">新增视频</button>

				</div>


		</div>



	</form>

			<table id="demo" lay-filter="test"></table>
			<script type="text/html" id="stateBar">

				<a class="layui-btn layui-btn-xs" title="编辑" lay-event="edit">编辑</a>
				<a class="layui-btn layui-btn-danger layui-btn-xs" title="删除" lay-event="delete">删除</a>

			</script>


	<script src="<%=path+"/lib/layui-v2.5.5/layui.js"%>" charset="utf-8"></script>
	<script>

		layui.use(['table','layer','form'], function () {

			var table = layui.table;
			var form = layui.form;

			form.on('submit(formDemo)', function(data){
				var opration="";
				if ($('#confirmbtn').attr("title")==="add") {
					opration="insertvideo"
				}else if ($('#confirmbtn').attr("title")==="edit") {
					opration="updatevideo"
				}
				$.ajax({
					type: "POST",
					url: "<%=path%>/"+opration,
					dataType: "text",
					data: data.field,
					success: function (msg) {
						if (msg === "succ") {
							layer.alert('更新成功！', {icon: 1});
							// obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
							table.reload('usertable', {
								url: "<%=path%>/videoList/2"


							});
						}else {
							layer.alert('更新失败！', {icon: 2});
						}
					}

				});
				return false;
			});
			$("#add").click(function () {

				layer.open({
					type: 1,
					content: $('#editpanel').html() ,//这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
					area: ['900px',''],

					title:'新增视频',
					success:function () {
						$('#url').val("");
						$('#info').val("");
						$('#confirmbtn').attr("title","add");

					}
				});

			});
			$("#query_btn").click(function () {

				var id= $('#query_id').val();
				var info=$('#query_info').val();
				table.reload('usertable', {
					url: "<%=path%>/videoList/2"//数据接口
					, where: { //设定异步数据接口的额外参数，任意设
						id:id,
						info:info
					}
					, page: {
						curr: 1 //重新从第 1 页开始
					}
				});

			});
			//第一个实例
			table.render({
				elem: '#demo'
				, height: 452

				, url: "<%=path%>/videoList/2" //数据接口
				, page: true //开启分页
				, limit: 10
				, cols: [[ //表头
					{field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
					,{field: 'url', title: '视频路径', minwidth: 260}
					, {field: 'info', title: '视频标题', width: 220}
					, {field: 'opman', title: '操作人', width: 120}
					, {field: 'addtime', title: '添加时间', width: 180}

					,{field: 'opreate', title: '操作', width: 120,toolbar: '#stateBar'}


				]]
				, id: 'usertable'
			});

			table.on('tool(test)', function(obj){
				var layEvent = obj.event;
				var data = obj.data;

				if (layEvent==="edit") {

					layer.open({
						type: 1,
						content: $('#editpanel').html() ,//这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
						area: ['700px'],

						title:'视频信息修改',
						success:function () {
							$('#iid').val(data.id);
							$('#url').val(data.url);
							$('#info').val(data.info);
							$('#confirmbtn').attr("title","edit");

						}
					});
				}else {
					layer.confirm('确定吗执行该操作吗？', function (index) {
						$.ajax({
							type: "POST",
							url: "<%=path%>/deletevideo",
							dataType: "text",
							data: {id: data.id},
							success: function (msg) {
								if (msg === "succ") {
									layer.alert('记录已删除！', {icon: 1});
									obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
								}else {
									layer.alert('记录删除失败！', {icon: 2});

								}


							}


						})


					})

					}
					})
				})

	</script>


	</body>
	</html>