<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<script type="text/javascript" src=<%=Path+"/js/preg.js"%>></script>
	<script type="text/javascript" src=<%=Path+"/js/backpractisereg.js"%>></script>
	<script src=<%=Path+"/js/lay-config.js?v=1.0.4"%> charset="utf-8"></script>
	<title>Title</title>
</head>
<body style="margin-left: 400px;
padding-top: 100px;">
<form class="layui-form" action="/springboot/preg" method="post">
	<div class="layuimini-container">
		<div class="layuimini-main">


			<div class="layui-form-item" id="driving">
				<div class="layui-form-label">选择驾校</div>
				<div class="layui-input-inline" style="padding-top: -2px;">
					<select id="mySelect" name="mySelect" lay-verify="required"  lay-filter="business" class="select">
						<option value="">--请选择驾校--</option>
					</select>
				</div>
			</div>
		</div>
	</div>
	<div class="layui-form-item"   >
		<label class="layui-form-label">账号</label>
		<div class="layui-input-inline" >
			<input type="text" name="username" required  lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input" id="username">
		</div>
	</div>
	<div class="layui-form-item" >
		<label class="layui-form-label">密码</label>
		<div class="layui-input-inline">
			<input type="password" onkeyup="value=value.replace(/[\u4e00-\u9fa5]/ig,'')" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" id="password">
		</div>
	</div>
	<div class="layui-form-item" >
		<label class="layui-form-label">确认密码</label>
		<div class="layui-input-inline">
			<input type="password" onkeyup="value=value.replace(/[\u4e00-\u9fa5]/ig,'')" name="password1" required lay-verify="required" placeholder="请再次输入密码" autocomplete="off" class="layui-input" id="password1">
		</div>
	</div>
	<div class="layui-form-item" >
		<label class="layui-form-label">请选择性别</label>
		<div class="layui-input-inline" >
			<input type="radio" name="sex" required lay-verify="required"  autocomplete="off" class="layui-input" id="sex" value="1"><b style="font-size: 16px">男</b>
			<input type="radio" name="sex" required lay-verify="required"  autocomplete="off" class="layui-input" id="sex1" value="2"><b style="font-size: 16px">女</b>

		</div>
	</div>
	<div class="layui-form-item" >
		<label class="layui-form-label">年龄</label>
		<div class="layui-input-inline">
			<input onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" name="age" required lay-verify="required" placeholder="请输入年龄" autocomplete="off" class="layui-input" id="age">
		</div>
	</div>
	<div class="layui-form-item" >
		<label class="layui-form-label">手机号码</label>
		<div class="layui-input-inline">
			<input onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" name="phone" required lay-verify="required" placeholder="请输入手机号码" autocomplete="off" class="layui-input" id="phone">
		</div>
	</div>

	<div class="layui-form-item" >
		<label class="layui-form-label">邮箱地址</label>
		<div class="layui-input-inline">
			<input type="text" name="email" required lay-verify="required" placeholder="请输入邮箱" autocomplete="off" class="layui-input" id="email">
		</div>
	</div>
	<div class="layui-form-item" >
		<label class="layui-form-label">姓名</label>
		<div class="layui-input-inline">
			<input type="text" name="name" required lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input" id="name">
		</div>
	</div>

	<div class="layui-form-item" >
		<label class="layui-form-label">身份证号码</label>
		<div class="layui-input-inline">
			<input type="text" onkeyup="value=value.replace(/[\u4e00-\u9fa5]/ig,'')" name="idcard" required lay-verify="required" placeholder="请输入身份证号码" autocomplete="off" class="layui-input" id="idcard" >
		</div>
	</div>

		<div class="layuimini-container">
			<div class="layuimini-main">


					<div class="layui-form-item" id="area-picker">
						<div class="layui-form-label">请选择住址</div>
						<div class="layui-input-inline" style="width: 200px;">
							<select name="province" class="province-selector"  lay-filter="province-1">
								<option value="">请选择省</option>
							</select>
						</div>
						<div class="layui-input-inline" style="width: 200px;">
							<select name="city" class="city-selector"  lay-filter="city-1">
								<option value="">请选择市</option>
							</select>
						</div>
						<div class="layui-input-inline" style="width: 200px;">
							<select name="county" class="county-selector"  lay-filter="county-1">
								<option value="">请选择区</option>
							</select>
						</div>
					</div>


			</div>
		</div>
	<div class="layui-form-item" >
		<label class="layui-form-label">个人简介</label>
		<div class="layui-input-inline">
	<textarea id="question" placeholder="请介绍您自己（限200字）" name="question" cols="70" rows="10" style="resize:none;height: 110px"></textarea>
		</div>
	</div>
	<div class="layui-form-item" >
		<label class="layui-form-label">教龄</label>
		<div class="layui-input-inline">
			<input type="text" name="workexperience" required lay-verify="required" placeholder="请输入您的教龄" autocomplete="off" class="layui-input" id="workexperience" >
		</div>
	</div>

	<button lay-submit="" lay-filter="suu" class="layui-btn layui-btn-normal tijiao" style="margin-left: 160px" >提交</button>
</form>

<script>
	layui.use(['layer', 'form', 'layarea'], function () {
		var layer = layui.layer
			, form = layui.form
			, layarea = layui.layarea;
		layarea.render({
			elem: '#area-picker',
			change: function (res) {
				//选择结果
				console.log(res);

			}

			});

	});
</script>
</body>

</html>
