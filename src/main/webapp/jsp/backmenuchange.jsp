<%--
  Created by IntelliJ IDEA.
  User: Stephen
  Date: 2020/2/17
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = application.getContextPath();
%>
<html>
<head>
	<TITLE>菜单权限管理</TITLE>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<link rel="stylesheet" href="<%=path+"/lib/layui-v2.5.5/css/layui.css"%>" media="all">
	<link rel="stylesheet" href="<%=path+"/css/ztreedemo.css"%>" type="text/css">
	<link rel="stylesheet" href="<%=path+"/css/zTreeStyle/zTreeStyle.css"%>" type="text/css">
	<link rel="stylesheet" href="<%=path+"/css/public.css"%>" media="all">

</head>
<body>

<input type="hidden" id="hid" value=<%=path%>>

<form class="layui-form" action="" lay-filter="frm">

	<br>
	<div class="layui-form-item">
		<label class="layui-form-label">角色</label>
		<div class="layui-input-inline">
			<select name="role" id="role" lay-filter="rolemenu">
				<option value="0" selected="">超级管理员</option>
				<option value="1">普通管理员</option>
				<option value="2">驾校</option>
				<option value="3">教练</option>
			</select>
		</div>
	</div>

	<div class="content_wrap" style="padding-left: 70px">
		<div class="zTreeDemoBackground left">
			<ul id="treeDemo" class="ztree"></ul>
		</div>
	</div>
	<br>
	<div class="layui-form-item" style="padding-left: 25px">
		<div class="layui-input-block">
			<button class="layui-btn" lay-submit="" lay-filter="demo1">保存修改</button>
		</div>
	</div>
</form>


<script type="text/javascript" src="<%=path+"/js/jquery-3.4.1.js"%>"></script>
<script type="text/javascript" src="<%=path+"/lib/layui-v2.5.5/layui.js"%>" charset="utf-8"></script>
<script type="text/javascript" src="<%=path+"/js/ztree/jquery.ztree.core.js"%>"></script>
<script type="text/javascript" src="<%=path+"/js/ztree/jquery.ztree.excheck.js"%>"></script>
<script type="text/javascript" src="<%=path+"/js/ztree/jquery.ztree.exedit.js"%>"></script>
<script type="text/javascript" src="<%=path+"/js/back.js"%>"></script>


</body>
</html>
