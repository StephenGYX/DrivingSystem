<%--
  Created by IntelliJ IDEA.
  User: Stephen
  Date: 2020/2/4
  Time: 17:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = application.getContextPath();
%>
<html>
<head>
	<title>文件上传</title>
	<link rel="stylesheet" href="<%=path+"/lib/layui-v2.5.5/css/layui.css"%>" media="all">

</head>
<body>
<input type="hidden" id="hid" value=<%=path%>>

<br>
<form class="layui-form" action="" lay-filter="frm">
	<div class="layui-form-item">
		<label class="layui-form-label">固定电话</label>
		<div class="layui-input-inline">
			<input type="text" id="fixedphone" name="fixedphone" lay-verify="required" lay-reqtext="固定电话不能为空，请输入" autocomplete="off" class="layui-input"
			     value="${sessionScope.workbuttonlink.fixedphone}"  placeholder="请输入固定电话">
		</div>
	</div>

	<div class="layui-form-item">
		<label class="layui-form-label">上班时间</label>
		<div class="layui-input-inline">
			<input type="text" id="worktime" name="worktime" lay-verify="required" lay-reqtext="上班时间不能为空，请输入" autocomplete="off" class="layui-input"
			     value="${sessionScope.workbuttonlink.worktime}"  placeholder="请输入上班时间">
		</div>
	</div>

	<div class="layui-form-item">
		<label class="layui-form-label">公司地址</label>
		<div class="layui-input-inline">
			<input type="text" id="workaddress" name="workaddress" lay-verify="required" lay-reqtext="地址不能为空，请输入" autocomplete="off" class="layui-input"
			    value="${sessionScope.workbuttonlink.workaddress}"   placeholder="请输入地址">
		</div>
	</div>

	<div class="layui-form-item">
		<label class="layui-form-label">移动电话</label>
		<div class="layui-input-inline">
			<input type="text" id="mobilephone" name="mobilephone" lay-verify="required|number" lay-reqtext="移动电话不能为空，请输入" autocomplete="off" class="layui-input"
			    value="${sessionScope.workbuttonlink.mobilephone}"   placeholder="请输入移动电话">
		</div>
	</div>

	<div class="layui-form-item">
		<label class="layui-form-label">企业邮箱</label>
		<div class="layui-input-inline">
			<input type="text" id="workemail" name="workemail" lay-verify="required|email" lay-reqtext="邮箱不能为空，请输入" autocomplete="off" class="layui-input"
			    value="${sessionScope.workbuttonlink.workemail}"   placeholder="请输入企业邮箱">
		</div>
	</div>

	<div class="layui-form-item">
		<label class="layui-form-label">企业QQ</label>
		<div class="layui-input-inline">
			<input type="text" id="workQQ" name="workQQ" lay-verify="required|number" lay-reqtext="QQ不能为空，请输入" autocomplete="off" class="layui-input"
			    value="${sessionScope.workbuttonlink.workQQ}"   placeholder="请输入企业QQ">
		</div>
	</div>

	<div class="layui-form-item">
		<div class="layui-upload" >
		<label class="layui-form-label">客服二维码</label>
			<button type="button" class="layui-btn layui-btn-normal" id="test8">选择图片</button>
			<div class="layui-upload-list">
				<img class="layui-upload-img" style="width: 150px;height: 150px;padding-left: 100px" id="demo2" src="${pageContext.request.contextPath}${sessionScope.workbuttonlink.workimage}">
				<p id="demoText"></p>
			</div>
		</div>
	</div>

	<div class="layui-upload">
		<button type="button" class="layui-btn" id="test9" style="width: 200px;display: none">开始上传</button>
	</div>

	<div class="layui-form-item">
		<div class="layui-input-block">
			<button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
		</div>
	</div>
</form>

<script type="text/javascript" src="<%=path+"/js/jquery-3.4.1.js"%>"></script>
<script type="text/javascript" src="<%=path+"/js/json2.js"%>"></script>
<script type="text/javascript" src="<%=path+"/lib/layui-v2.5.5/layui.js"%>" charset="utf-8"></script>
<script type="text/javascript" src="<%=path+"/js/fileupload.js"%>" charset="utf-8"></script>

<script>
	var path = "<%=path%>";

	layui.use(['form', 'layer', 'laydate', 'jquery'], function () {
		var form = layui.form,
			layer = layui.layer,
			$ = layui.jquery,
			laydate = layui.laydate;

		//常规用法
		laydate.render({
			elem: '#test1'
		});

		//常规用法
		laydate.render({
			elem: '#test2'
		});

		//日期范围
		laydate.render({
			elem: '#test6'
			, range: true
		});
	});
</script>

</body>
</html>
