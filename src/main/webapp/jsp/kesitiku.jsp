
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
			<input type="hidden" name="iid" id="iid"><br><br>
			<div class="layui-form-item">
				<label class="layui-form-label">题目:</label>
				<div class="layui-input-block">
					<input type="text" name="icontent" required lay-verify="required" id="icontent" placeholder="请输入题目内容" autocomplete="off"
					       class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">选项1:</label>
				<div class="layui-input-block">
					<input type="text" name="ioption1" required lay-verify="required" id="ioption1"
					       autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">选项2:</label>
				<div class="layui-input-block">
					<input type="text" name="ioption2" required lay-verify="required" id="ioption2"
					       autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">选项3:</label>
				<div class="layui-input-block">
					<input type="text" name="ioption3" id="ioption3"
					       autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">选项4:</label>
				<div class="layui-input-block">
					<input type="text" name="ioption4"  id="ioption4"
					       autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">解析:</label>
				<div class="layui-input-block">
					<input type="text" name="ianalysis" required lay-verify="required" id="ianalysis"
					       autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">图片路径:</label>
				<div class="layui-input-block">
					<input type="text" name="picurl"  id="picurl"
					       autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">正确答案:</label>
				<div class="layui-input-block">
					<input type="text" name="irightkey" required lay-verify="required"  id="irightkey"
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
			<label class="layui-form-label" >题目id ：</label>
			<div class="layui-input-inline">
				<input name="iid" id="query_iid" class="layui-input" type="text" autocomplete="off" >
			</div>

			<label class="layui-form-label" >题目内容 ：</label>
			<div class="layui-input-inline">
				<input name="icontent" id="query_icontent"  class="layui-input" type="text" autocomplete="off" >
			</div>
				<div class="layui-block">
					<button class="layui-btn " id="query_bt"  type="button">查询</button>

						<button class="layui-btn layui-btn-warm " id="add"  type="button">新增题目</button>

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
					opration="inserttimu"
				}else if ($('#confirmbtn').attr("title")==="edit") {
					opration="updatetimu"
				}
				$.ajax({
					type: "POST",
					url: "<%=path%>/"+opration+"/ks",
					dataType: "text",
					data: data.field,
					success: function (msg) {
						if (msg === "succ") {
							layer.alert('更新成功！', {icon: 1});
							// obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
							table.reload('usertable', {
								url: "<%=path%>/timuList/ky"


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

					title:'新增题目',
					success:function () {
						$('#iid').val("");
						$('#icontent').val("");
						$('#ioption1').val("");
						$('#ioption2').val("");
						$('#ioption3').val("");
						$('#ioption4').val("");
						$('#irightkey').val("");
						$('#ianalysis').val("");
						$('#picurl').val("");
						$('#ioption4').val("");
						$('#confirmbtn').attr("title","add");

					}
				});

			});
			$("#query_bt").click(function () {

				var iid= $('#query_iid').val();
				var icontent=$('#icontent').val();
				table.reload('usertable', {
					url: "<%=path%>/timuList/ks"//数据接口
					, where: { //设定异步数据接口的额外参数，任意设
						iid:iid,
						icontent:icontent
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

				, url: "<%=path%>/timuList/ks" //数据接口
				, page: true //开启分页
				, limit: 10
				, cols: [[ //表头
					{field: 'iid', title: 'ID', width:80, sort: true, fixed: 'left'}
					,{field: 'icontent', title: '题目', minwidth: 260}
					, {field: 'ioption1', title: '选项A', width: 120}
					, {field: 'ioption2', title: '选项B', width: 120}
					, {field: 'ioption3', title: '选项C', width: 80}
					, {field: 'ioption4', title: '选项D', width: 80}
					, {field: 'irightkey', title: '正确答案', width: 80}
					, {field: 'ianalysis', title: '解析', width: 220}
					, {field: 'picurl', title: '图片路径', width: 120}
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

						title:'题目管理',
						success:function () {
							$('#iid').val(data.iid);
							$('#icontent').val(data.icontent);
							$('#ioption1').val(data.ioption1);
							$('#ioption2').val(data.ioption2);
							$('#ioption3').val(data.ioption3);
							$('#ioption4').val(data.ioption4);
							$('#irightkey').val(data.irightkey);
							$('#ianalysis').val(data.ianalysis);
							$('#picurl').val(data.picurl);
							$('#ioption4').val(data.ioption4);
							$('#confirmbtn').attr("title","edit");

						}
					});
				}else {
					layer.confirm('确定吗执行该操作吗？', function (index) {
						$.ajax({
							type: "POST",
							url: "<%=path%>/deletekaoti/ks",
							dataType: "text",
							data: {iid: data.iid},
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