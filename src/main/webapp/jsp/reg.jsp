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
	<link rel="stylesheet" href=<%=Path+"/lib/layui-v2.5.5/css/layui.css"%>>
	<script src=<%=Path+"/lib/layui-v2.5.5/layui.js"%>></script>
	<script type="text/javascript" src=<%=Path+"/lib/jquery-3.4.1/jquery-3.4.1.min.js"%>></script>
	<script type="text/javascript" src=<%=Path+"/js/json2.js"%>></script>
	<script type="text/javascript" src=<%=Path+"/js/reg.js"%>></script>
	<title>Title</title>
</head>
<body style="margin-left: 600px;
padding-top: 300px;">
<form class="layui-form" action="/springboot/reg" method="post">
	<div class="layui-form-item">
		<label class="layui-form-label">账号</label>
		<div class="layui-input-inline">
			<input type="text" name="username" required  lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input" id="username">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">密码</label>
		<div class="layui-input-inline">
			<input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" id="password">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">确认密码</label>
		<div class="layui-input-inline">
			<input type="password" name="password1" required lay-verify="required" placeholder="请再次输入密码" autocomplete="off" class="layui-input" id="password1">
		</div>
	</div>

	<button lay-submit="" lay-filter="suu" class="layui-btn layui-btn-normal tijiao" style="margin-left: 160px">提交</button>
</form>
</body>

</html>
