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
	<script src="<%=path+"/lib/layui-v2.5.5/layui.js"%>" charset="utf-8"></script>
</head>
<body>

<form class="layui-form" action="">

	测试111111111111

<%--	<div class="layui-form-item">--%>
<%--		<label class="layui-form-label">文件的类型：</label>--%>
<%--		<div class="layui-input-block">--%>
<%--			<c:forEach items="${allFileType}" var="i" begin="0">--%>
<%--				<input type="checkbox" name="${i.fileType}" value="${i.fileType}" title="${i.fileType} "--%>
<%--				<c:if test="${i.fileStatus=='1'}">--%>
<%--					checked--%>
<%--				</c:if>--%>
<%--				>--%>
<%--			</c:forEach>--%>
<%--			--%>
<%--		</div>--%>
<%--	</div>--%>



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
