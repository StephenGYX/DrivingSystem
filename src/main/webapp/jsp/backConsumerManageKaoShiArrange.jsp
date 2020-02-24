<%--
  Created by IntelliJ IDEA.
  User: 86158
  Date: 2020/1/2
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = application.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>考试安排</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="<%=path+"/lib/layui-v2.5.5/css/layui.css"%>" media="all">
	<link rel="stylesheet" href="<%=path+"/css/public.css"%>" media="all">
	<link rel="stylesheet" href="<%=path+"/css/drivingschoolKaoshiArrange.css"%>" media="all">
	<script src="<%=path+"/lib/layui-v2.5.5/layui.js"%>" charset="utf-8"></script>
</head>
<body>

<form class="layui-form" action="">


	<div class="layui-form-item">
		<div class="layui-input-block">

			<input type="hidden" name="${kaoshi}" value="${kaoshi}">

			<c:if test="${kaoshi =='test1'}">
				科目一考试时间：
				<input type="date" name="kaoShiTime1" value="" title="">
			</c:if>
			<c:if test="${kaoshi =='test2'}">
		        科目二考试时间：
				<input type="date" name="kaoShiTime2" value="" title="">
			</c:if>
			<c:if test="${kaoshi =='test3'}">
				科目三考试时间：
				<input type="date" name="kaoShiTime3" value="" title="">
			</c:if>
			<c:if test="${kaoshi =='test4'}">
		      	科目四考试时间：
				<input type="date" name="kaoShiTime4" value="" title="">
			</c:if>


		</div>
	</div>

</form>

<script>
	//Demo
	layui.use('form', function(){
		var form = layui.form;

		//监听提交
		form.on('submit(formDemo)', function(data){
			layer.msg(JSON.stringify(data.field));
			return false;
		});
	});
</script>
</body>
</html>
