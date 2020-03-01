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
	String roleid = session.getAttribute("roleid") + "";
%>
<html>
<head>
	<meta charset="utf-8">
	<title>省市县区选择区</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="<%=path+"/lib/layui-v2.5.5/css/layui.css"%>" media="all">
	<link rel="stylesheet" href="<%=path+"/css/public.css"%>" media="all">
	<link rel="stylesheet" href="<%=path+"/lib/lay-module/step-lay/step.css"%>" media="all">


</head>

<body>

<div class="layuimini-container">
	<div class="layuimini-main">

		<form class="layui-form" action="" style="padding:20px;" method="post">


			<div class="layui-form layuimini-form">
				<div class="layui-form-item">
					<label class="layui-form-label required">用户名</label>
					<div class="layui-input-block">
						<input type="text" name="username" lay-verify="required" lay-reqtext="用户名不能为空"
						       placeholder="请输入用户名" value="" class="layui-input">
						<tip>填写驾校账号信息，该账号具有唯一性。</tip>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label required">联系人姓名</label>
					<div class="layui-input-block">
						<input type="text" name="dcontacts" lay-verify="required" lay-reqtext="联系人不能为空"
						       placeholder="请输入联系人姓名" value="" class="layui-input">
						<tip>填写驾校负责人真实姓名。</tip>
					</div>
				</div>


				<div class="layui-form-item">
					<label class="layui-form-label">密码</label>
					<div class="layui-input-block">
						<input type="password" name="password" lay-verify="required" placeholder="请输入驾校账号密码" value="" class="layui-input">
					</div>
				</div>
<%--				<div class="layui-form-item">--%>
<%--					<label class="layui-form-label required">性别</label>--%>
<%--					<div class="layui-input-block">--%>
<%--						<input type="radio" name="sex" value="男" title="男" checked="">--%>
<%--						<input type="radio" name="sex" value="女" title="女">--%>
<%--					</div>--%>
<%--				</div>--%>
				<div class="layui-form-item">
					<label class="layui-form-label required">联系电话</label>
					<div class="layui-input-block">
						<input type="number" name="phone" lay-verify="required" lay-reqtext="手机不能为空" placeholder="请输入手机"
						       value="" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">邮箱</label>
					<div class="layui-input-block">
						<input type="email" name="email" lay-verify="email" placeholder="请输入邮箱" value="" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">驾校名称</label>
					<div class="layui-input-block">
						<input type="text" name="dname" placeholder="请输入驾校名称" value="" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item" id="area-picker">
					<div class="layui-form-label">所在市区</div>
					<div class="layui-input-inline" style="width: 200px;">
						<select name="province" class="province-selector" data-value="福建省" lay-filter="province-1">
							<option value="">请选择省</option>
						</select>
					</div>
					<div class="layui-input-inline" style="width: 200px;">
						<select name="city" class="city-selector" data-value="" lay-filter="city-1">
							<option value="">请选择市</option>
						</select>
					</div>
					<div class="layui-input-inline" style="width: 200px;">
						<select name="county" class="county-selector" data-value="" lay-filter="county-1">
							<option value="">请选择区</option>
						</select>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label required">报名费用</label>
					<div class="layui-input-block">
						<input type="number" name="cost" lay-verify="required" lay-reqtext="报名费用不能为空" placeholder="报名最低价"
						       value="" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">招生信息</label>
					<div class="layui-input-block">
						<textarea name="remark" class="layui-textarea" placeholder="请输入驾校简介"></textarea>
					</div>
				</div>

				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="saveBtn">确认保存</button>
					</div>
				</div>
			</div>



		</form>

	</div>
</div>

<script src="<%=path+"/lib/layui-v2.5.5/layui.js"%>" charset="utf-8"></script>
<script src=<%=path+"/js/lay-config.js?v=1.0.4"%> charset="utf-8"></script>
<script>
	layui.use(['layer', 'form', 'layarea'], function () {
		var layer = layui.layer
			, form = layui.form,
			$ = layui.jquery
			, layarea = layui.layarea;
		//监听提交
		form.on('submit(saveBtn)', function (data) {
			var formData = data.field;


			$.ajax({
				url: "<%=path+"/fact/DSCreg"%>",//后台路径,
				type: "POST",
				data: {"dscParams": JSON.stringify(data.field)},
				dataType: "text",
				success: function (msg) {

					if (msg > 0) {

						layer.msg("注册成功", {icon: 6});



					} else {
						alert("222");
						layer.msg("注册失败", {icon: 5});
					}
				}

			});




			return false;
		});
		layarea.render({
			elem: '#area-picker',

		});
	});
</script>
</body>
</html>
