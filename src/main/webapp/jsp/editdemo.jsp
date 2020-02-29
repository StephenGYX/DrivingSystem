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
	<title>修改资讯</title>

	<link rel="stylesheet" href="<%=path+"/lib/layui-v2.5.5/css/layui.css"%>" media="all">
</head>
<input type="hidden" id="hid" value=<%=path%>>
<br><br>
<form class="layui-form" action="" lay-filter="frm">
	<div class="layui-form-item">
		<label class="layui-form-label">文章标题</label>
		<div class="layui-input-block">
			<input type="text" id="jtitle" name="jtitle" lay-verify="required" lay-reqtext="文章标题不能为空，控制在20字以内"
			       autocomplete="off" class="layui-input" style="width: 87%"
			       value="111" placeholder="请输入文章标题，控制在20字以内">
		</div>
	</div>

	<div class="layui-form-item">
		<label class="layui-form-label">文章简介</label>
		<div class="layui-input-block">
			<input type="text" id="jabstract" name="jabstract" lay-verify="required" lay-reqtext="文章简介不能为空，控制在100字以内"
			       autocomplete="off" class="layui-input" style="width: 87%"
			       value="5555" placeholder="请输入文章简介，控制在100字以内">
		</div>
	</div>

	<div class="layui-form-item">
		<label class="layui-form-label">文章作者</label>
		<div class="layui-input-inline">
			<input type="text" id="jauthor" name="jauthor" lay-verify="required" lay-reqtext="文章作者不能为空，控制在20字以内"
			       autocomplete="off" class="layui-input"
			       value="333" placeholder="请输入文章作者，控制在20字以内">
		</div>

		<label class="layui-form-label">浏览量</label>
		<div class="layui-input-inline">
			<input type="text" id="jliulan" name="jliulan" lay-verify="required|number" lay-reqtext="文章浏览量不能为空，控制在10字以内"
			       autocomplete="off" class="layui-input"
			       value="333" placeholder="请输入文章浏览量，控制在10字以内">
		</div>

		<label class="layui-form-label">更新时间</label>
		<div class="layui-input-inline">
			<input type="text" id="jtime" disabled="disabled" name="jtime" autocomplete="off" class="layui-input"
			       value="444">
		</div>
	</div>

	<br>
	<div style="text-align: left;padding-left: 110px;width: 80%">
		<div id="editor"></div>
	</div>
	<br>

	<div class="layui-form-item" style="padding-left: 110px">
		<button type="submit" class="layui-btn" lay-submit="" lay-filter="demo2">确认修改</button>
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
	var E = window.wangEditor;
	var editor = new E('#editor');
	editor.create();

	function selectinfo(data) {

		$("#jid").val(data.jid);
		$("#jtitle").val(data.jtitle);
		$("#jabstract").val(data.jabstract);
		$("#jauthor").val(data.jauthor);
		$("#jtime").val(data.jtime);
		$("#jliulan").val(data.jliulan);
		editor.txt.html(data.jtext);
	}


	layui.use(['form', 'layer', 'laydate', 'jquery'], function () {
		var form = layui.form,
			layer = layui.layer,
			$ = layui.jquery,
			laydate = layui.laydate;

		//绑定的按钮是submit 监听提交 lay-filter="search"
		form.on('submit(demo2)', function (data) {
			var formData = data.field;
			var jtitle = formData.jtitle;
			var jabstract = formData.jabstract;
			var jauthor = formData.jauthor;
			var jliulan = formData.jliulan;
			var jtext = editor.txt.html();
			var jid = $("#jid").val();

			console.log(jtext);

			$.ajax({
				type: "post"
				,
				url: path + '/homepage/updateNewsContent'
				//预期服务器返回的数据类型;
				,
				datatype: "text"
				//从该js会发出到服务器的数据
				,
				data: {
					"jid": jid,
					"jtitle": jtitle,
					"jabstract": jabstract,
					"jauthor": jauthor,
					"jliulan": jliulan,
					"jtext": jtext
				}
				//从servlet接收的数据
				,
				success: function (msg) {
					if (msg === 1) {
						layer.msg("修改成功！");
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

		//创建一个编辑器
		var editIndex = layedit.build('LAY_demo_editor');

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