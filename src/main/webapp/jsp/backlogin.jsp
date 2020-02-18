<%--
  Created by IntelliJ IDEA.
  User: Stephen
  Date: 2020/2/15
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = application.getContextPath();
%>
<html>
<head>
	<meta charset="UTF-8">
	<title>驾考后台管理登录</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Access-Control-Allow-Origin" content="*">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">

	<link rel="stylesheet" href="<%=path+"/lib/layui-v2.5.5/css/layui.css"%>" media="all">

	<!--[if lt IE 9]>
	<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
	<script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>

	<![endif]-->
	<style>
		html, body {width: 100%;height: 100%;overflow: hidden}
		body {background: #009688;}
		body:after {content:'';background-repeat:no-repeat;background-size:cover;-webkit-filter:blur(3px);-moz-filter:blur(3px);-o-filter:blur(3px);-ms-filter:blur(3px);filter:blur(3px);position:absolute;top:0;left:0;right:0;bottom:0;z-index:-1;}
		.layui-container {width: 100%;height: 100%;overflow: hidden}
		.admin-login-background {width:360px;height:300px;position:absolute;left:50%;top:40%;margin-left:-180px;margin-top:-100px;}
		.logo-title {text-align:center;letter-spacing:2px;padding:14px 0;}
		.logo-title h1 {color:#009688;font-size:25px;font-weight:bold;}
		.login-form {background-color:#fff;border:1px solid #fff;border-radius:3px;padding:14px 20px;box-shadow:0 0 8px #eeeeee;}
		.login-form .layui-form-item {position:relative;}
		.login-form .layui-form-item label {position:absolute;left:1px;top:1px;width:38px;line-height:36px;text-align:center;color:#d2d2d2;}
		.login-form .layui-form-item input {padding-left:36px;}
		.captcha {width:60%;display:inline-block;}
		.captcha-img {display:inline-block;width:34%;float:right;}
		.captcha-img img {height:34px;border:1px solid #e6e6e6;height:36px;width:100%;}
	</style>
</head>
<body>
<input type="hidden" id="hid" value=<%=path%>>

<div class="layui-container">
	<div class="admin-login-background">
		<div class="layui-form login-form">
			<form class="layui-form" action="" method="post">
				<div class="layui-form-item logo-title">
					<h1>驾考后台管理系统</h1>
				</div>
				<div class="layui-form-item">
					<label class="layui-icon layui-icon-username"></label>
					<input type="text" name="account" lay-verify="required|account" placeholder="请输入账号" autocomplete="off" class="layui-input" value="gaoyaoxin">
				</div>
				<div class="layui-form-item">
					<label class="layui-icon layui-icon-password"></label>
					<input type="password" name="password" lay-verify="required|password" placeholder="请输入密码" autocomplete="off" class="layui-input" value="gaoyaoxin">
				</div>
				<div class="layui-form-item">
					<label class="layui-icon layui-icon-vercode"></label>
					<input type="text" name="captcha" lay-verify="required|captcha" placeholder="请输入验证码" autocomplete="off" class="layui-input verification captcha" value="xszg">
					<div class="captcha-img">
						<img id="captchaPic" src="<%=path+"/images/captcha.jpg"%>">
					</div>
				</div>
<%--				<div class="layui-form-item">--%>
<%--					<input type="checkbox" name="rememberMe" value="true" lay-skin="primary" title="记住密码">--%>
<%--				</div>--%>
				<div class="layui-form-item">
					<button type="submit" class="layui-btn layui-btn-fluid" lay-submit="" lay-filter="login">登 入</button>

<%--					<button class="layui-btn layui-btn-fluid" lay-submit="" lay-filter="login">登 入</button>--%>
				</div>
			</form>
		</div>
	</div>
</div>

<script src="<%=path+"/lib/jquery-3.4.1/jquery-3.4.1.min.js"%>" charset="utf-8"></script>
<script src="<%=path+"/lib/layui-v2.5.5/layui.js"%>" charset="utf-8"></script>
<script src="<%=path+"/lib/jq-module/jquery.particleground.min.js"%>" charset="utf-8"></script>
<script src="<%=path+"/js/json2.js"%>" charset="utf-8"></script>
<script src="<%=path+"/js/backlogin.js"%>" charset="utf-8"></script>

</body>
</html>
