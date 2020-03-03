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
		<label class="layui-form-label">文章标题</label>
		<div class="layui-input-block">
			<input type="text" id="jtitle" name="jtitle" lay-verify="required" lay-reqtext="文章标题不能为空，控制在20字以内"
			       autocomplete="off" class="layui-input" style="width: 87%"
			       placeholder="请输入文章标题，控制在20字以内">
		</div>
	</div>

	<div class="layui-form-item">
		<label class="layui-form-label">文章简介</label>
		<div class="layui-input-block">
			<input type="text" id="jabstract" name="jabstract" lay-verify="required" lay-reqtext="文章简介不能为空，控制在100字以内"
			       autocomplete="off" class="layui-input" style="width: 87%"
			       placeholder="请输入文章简介，控制在100字以内">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">文章类型</label>
		<div class="layui-input-inline">
			<select name="jtype" id="jtype" lay-filter="jtype" lay-verify="required" lay-reqtext="文章类型不能为空，请选择">
				<option value="" selected=""></option>
				<option value="1">新闻资讯</option>
				<option value="2">考试攻略</option>
			</select>
		</div>
	</div>

	<div class="layui-form-item">
		<label class="layui-form-label">文章作者</label>
		<div class="layui-input-inline">
			<input type="text" id="jauthor" name="jauthor" lay-verify="required" lay-reqtext="文章作者不能为空，控制在20字以内"
			       autocomplete="off" class="layui-input"
			       placeholder="请输入文章作者">
		</div>
	</div>

	<div class="layui-form-item">
		<label class="layui-form-label">浏览量</label>
		<div class="layui-input-inline">
			<input type="text" id="jliulan" name="jliulan" lay-verify="required|number" lay-reqtext="文章浏览量不能为空，控制在10字以内"
			       autocomplete="off" class="layui-input"
			       placeholder="请输入文章浏览量">
		</div>
	</div>

	<br>
	<div style="text-align: left;padding-left: 110px;width: 80%">
		<div id="editor"></div>
	</div>
	<br>

	<div class="layui-form-item" style="padding-left: 110px">
		<button type="submit" class="layui-btn" lay-submit="" lay-filter="demo2">确认新增</button>
	</div>
</form>
<body>

<input type="hidden" id="jid" value="">

<script type="text/javascript" src="http://localhost:3000/wangEditor.js"></script>
<script type="text/javascript" src="<%=path+"/js/wangEditor/plupload.full.min.js"%>"></script>
<script type="text/javascript" src="<%=path+"/js/wangEditor/zh_CN.js"%>"></script>
<script type="text/javascript" src="<%=path+"/js/wangEditor/qiniu.js"%>"></script>


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

	editor.customConfig.uploadImgServer = '<%=path%>/image/upload'; //上传URL
	editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024;
	editor.customConfig.uploadImgMaxLength = 5;
	editor.customConfig.uploadFileName = 'myFileName';

	//上传图片
	editor.customConfig.uploadImgHooks = {
		customInsert: function (insertImg, result, editor) {

			// 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
			// insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果

			// 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
			var url = result.data;
			insertImg(url);

			// result 必须是一个 JSON 格式字符串！！！否则报错
		}
	};

	editor.customConfig.uploadImgShowBase64 = true;  // 使用 base64 保存图片
	editor.customConfig.showLinkImg = false;	// 隐藏“网络图片”tab
	editor.customConfig.menus = [
		'head',  // 标题
		'bold',  // 粗体
		'fontSize',  // 字号
		'fontName',  // 字体
		'italic',  // 斜体
		'underline',  // 下划线
		'strikeThrough',  // 删除线
		'foreColor',  // 文字颜色
		'backColor',  // 背景颜色
		'link',  // 插入链接
		'justify',  // 对齐方式
		'quote',  // 引用
		'emoticon',  // 表情
		'image',  // 插入图片
		'video',  // 插入视频
		'undo',  // 撤销
		'redo'  // 重复
	];
	editor.create();


	layui.use(['form', 'layer', 'jquery'], function () {
		var form = layui.form,
			layer = layui.layer,
			$ = layui.jquery;

		//绑定的按钮是submit 监听提交 lay-filter="search"
		form.on('submit(demo2)', function (data) {
			var formData = data.field;
			var jtitle = formData.jtitle;
			var jabstract = formData.jabstract;
			var jauthor = formData.jauthor;
			var jliulan = formData.jliulan;
			var jtype = formData.jtype;
			var jtext = editor.txt.html();

			console.log(formData);

			$.ajax({
				type: "post"
				,
				url: path + '/homepage/insertNewsContent'
				//预期服务器返回的数据类型;
				,
				datatype: "text"
				//从该js会发出到服务器的数据
				,
				data: {
					"jtitle": jtitle,
					"jabstract": jabstract,
					"jauthor": jauthor,
					"jliulan": jliulan,
					"jtype": jtype,
					"jtext": jtext
				}
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