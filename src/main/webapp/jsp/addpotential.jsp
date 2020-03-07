<%--
  Created by IntelliJ IDEA.
  User: Stephen
  Date: 2020/2/28
  Time: 10:19
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
	<title>新增资讯</title>

	<link rel="stylesheet" href="<%=path+"/lib/layui-v2.5.5/css/layui.css"%>" media="all">
</head>
<input type="hidden" id="hid" value=<%=path%>>
<br><br>
<form class="layui-form" action="" lay-filter="frm">
	<div class="layui-form-item">
		<label class="layui-form-label">姓名</label>
		<div class="layui-input-block">
			<input type="text" id="gname" name="gname" lay-verify="required" lay-reqtext="姓名不能为空，控制在10字以内"
			       autocomplete="off" class="layui-input" style="width: 87%"
			       placeholder="请输入咨询者姓名，控制在10字以内">
		</div>
	</div>

	<div class="layui-form-item">
		<label class="layui-form-label">电话</label>
		<div class="layui-input-block">
			<input type="text" id="gphone" name="gphone" lay-verify="required" lay-reqtext="电话不能为空，控制在11字以内"
			       autocomplete="off" class="layui-input" style="width: 87%"
			       placeholder="请输入咨询者电话，控制在11字以内">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">跟进状态</label>
		<div class="layui-input-inline">
			<select name="gstate" id="gstate" lay-filter="gstate" lay-verify="required" lay-reqtext="跟进状态不能为空，请选择">
				<option value="" selected=""></option>
				<option value="1">有意向待沟通</option>
				<option value="2">有意向已沟通</option>
				<option value="3">无意向购买</option>
				<option value="4">已成交</option>
			</select>
		</div>
	</div>

	<div class="layui-form-item">
		<label class="layui-form-label">需求意向</label>
		<div class="layui-input-block">
			<textarea id="gdesire" name="gdesire" placeholder="请输入沟通内容，意向，地址，预计学车时间" class="layui-textarea"></textarea>
		</div>
	</div>

	<div class="layui-form-item" style="padding-left: 110px">
		<button type="submit" class="layui-btn" lay-submit="" lay-filter="demo2">确认新增</button>
	</div>
</form>
<body>

<input type="hidden" id="jid" value="">

<script type="text/javascript" src="<%=path+"/js/jquery-3.4.1.js"%>"></script>
<script type="text/javascript" src="<%=path+"/js/json2.js"%>"></script>
<script type="text/javascript" src="<%=path+"/lib/layui-v2.5.5/layui.js"%>" charset="utf-8"></script>

<!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
<script type="text/javascript" src="<%=path+"/js/wangEditor/wangEditor.js"%>"></script>
<script type="text/javascript" src="<%=path+"/js/newstable.js"%>" charset="utf-8"></script>

<%--编辑器初始化--%>
<%--回显表格中的数据--%>
<script type="text/javascript">

	var path = "<%=path%>";

	layui.use(['form', 'layer', 'jquery'], function () {
		var form = layui.form,
			layer = layui.layer,
			$ = layui.jquery;

		//绑定的按钮是submit 监听提交 lay-filter="search"
		form.on('submit(demo2)', function (data) {
			var formData = data.field;

			$.ajax({
				type: "post"
				,
				url: path + '/potential/insertPotentialContent'
				//预期服务器返回的数据类型;
				,
				datatype: "text"
				//从该js会发出到服务器的数据
				,
				data: formData
				//从servlet接收的数据
				,
				success: function (msg) {
					if (msg === 1) {
						layer.msg("新增成功！");
						parent.location.reload();
					} else {
						layer.msg("修改失败！")
					}
				}
				,
				error: function () {
					alert("服务器正忙.....");
				}
			});
			return false;//false：阻止表单跳转  true：表单跳转
		});
	});
</script>


<%--layui组件初始化--%>
<script>
	layui.use(['form', 'layer', 'laydate', 'layedit', 'jquery'], function () {
		var form = layui.form,
			layer = layui.layer,
			$ = layui.jquery,
			laydate = layui.laydate
			, layedit = layui.layedit;

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