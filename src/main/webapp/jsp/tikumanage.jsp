
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
	</head>
	<body>


			<div class="layui-tab layui-tab-card">
				<ul class="layui-tab-title">
					<li class="layui-this">科目一</li>
					<li>科目二</li>
					<li>科目三</li>
					<li>科目四</li>

				</ul>
				<div class="layui-tab-content" style="height: 100%;">
					<div class="layui-tab-item layui-show">
						<iframe  width="100%" height="100%" src="keyitiku.jsp"></iframe>
					</div>
					<div class="layui-tab-item layui-show">
						<iframe  width="100%" height="100%" src="keertiku.jsp"></iframe>
					</div><div class="layui-tab-item layui-show">
					<iframe  width="100%" height="100%" src="kesantiku.jsp"></iframe>
				</div><div class="layui-tab-item layui-show">
					<iframe  width="100%" height="100%" src="kesitiku.jsp"></iframe>
				</div>

				</div>
			</div>

	<script src="<%=path+"/lib/layui-v2.5.5/layui.js"%>" charset="utf-8"></script>
	<script>
		layui.use('element', function(){
			var element = layui.element;



		});
	</script>

	<script>

	</script>

	</body>
	</html>