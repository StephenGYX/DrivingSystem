<%--
Created by IntelliJ IDEA.
User: Stephen
Date: 2020/2/14
Time: 17:58
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String  Path = application.getContextPath();
%>
<html>
<head>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href=<%=Path+"/lib/layui-v2.5.5/css/layui.css"%>>
	<link rel="stylesheet" href="<%=Path+"/lib/lay-module/step-lay/step.css"%>" media="all">
	<script src=<%=Path+"/lib/layui-v2.5.5/layui.js"%>></script>
	<script type="text/javascript" src=<%=Path+"/lib/jquery-3.4.1/jquery-3.4.1.min.js"%>></script>
	<script type="text/javascript" src=<%=Path+"/js/json2.js"%>></script>
	<script src=<%=Path+"/js/lay-config.js?v=1.0.4"%> charset="utf-8"></script>
	<title>Title</title>

</head>
<body>

<div>
	<div class="txt">
		<div class="layui-form-item">
			<label class="layui-form-label">输入账号</label>
			<div class="layui-input-block">
				<input type="text" id="carnum" name="title" lay-verify="title" autocomplete="off" placeholder="请输入账号" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">输入密码</label>
			<div class="layui-input-block">
				<input type="text" id="carbrand" name="title" lay-verify="title" autocomplete="off" placeholder="请输入密码" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">输入名称</label>
			<div class="layui-input-block">
				<input type="text" id="carmodel" name="title" lay-verify="title" autocomplete="off" placeholder="请输入名称" class="layui-input">
			</div>
		</div>
		<div class="layuimini-container">
			<div class="layuimini-main">


				<div class="layui-form-item" id="area-picker">
					<div class="layui-form-label">账号角色</div>
					<div class="layui-input-inline" style="padding-top: 7px;">
						<select id="prov" name="province" class="province-selector"  lay-filter="province-1">
							<option value="0">超级管理员</option>
							<option value="1">普通管理员</option>
						</select>
					</div>
				</div>
			</div>
		</div>
		<div class="layui-btn" id="layui-btnn" >保存</div>
</div>

</div>

</body>
<script type="text/javascript">
	$("#layui-btnn").on('click',function(){
		layui.use('layer', function() {
			var layer = layui.layer;//引入layer组件
			var carnum=$('#carnum').val();
			var carbrand=$('#carbrand').val();
			var carmodel=$('#carmodel').val();
			var rid=$('#prov').val();

			if(carnum==''||carbrand==''||carmodel==''){
				layer.msg('请输入完整',{icon: 2});
				return false;
			}else{
				$.ajax({
					url: '/springboot/addbackuser',
					method: 'post',
					data: {bacc:carnum,bpass:carbrand,bname:carmodel,bstate:rid},
					dataType: 'text'
				});
				layer.msg('保存成功')

				setTimeout( function(){
					window.parent.location.reload();
				}, 2000 );//延迟两秒
			}
		});

	});
</script>
</html>
