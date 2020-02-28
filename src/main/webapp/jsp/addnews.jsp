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
	editor.customConfig.uploadImgShowBase64 = true;  // 使用 base64 保存图片
	editor.customConfig.showLinkImg = false;	// 隐藏“网络图片”tab
	editor.customConfig.qiniu = true;  //开启七牛服务器
	editor.create();

	// 初始化七牛上传
	uploadInit();

	// 初始化七牛上传的方法
	function uploadInit() {
		var btnId = editor.imgMenuId;
		var containerId = editor.toolbarElemId;
		var textElemId = editor.textElemId;

		// 创建上传对象
		var uploader = Qiniu.uploader({
			runtimes: 'html5,flash,html4',    //上传模式,依次退化
			browse_button: btnId,       //上传选择的点选按钮，**必需**
			uptoken_url: '/uptoken',
			//Ajax请求upToken的Url，**强烈建议设置**（服务端提供）
			uptoken: '<Your upload token>',
			//若未指定uptoken_url,则必须指定 uptoken ,uptoken由其他程序生成
			unique_names: true,
			// 默认 false，key为文件名。若开启该选项，SDK会为每个文件自动生成key（文件名）
			save_key: true,
			// 默认 false。若在服务端生成uptoken的上传策略中指定了 `sava_key`，则开启，SDK在前端将不对key进行任何处理
			domain: 'http://7xrjl5.com1.z0.glb.clouddn.com/',
			//bucket 域名，下载资源时用到，**必需**
			container: containerId,           //上传区域DOM ID，默认是browser_button的父元素，
			max_file_size: '100mb',           //最大文件体积限制
			flash_swf_url: '../js/plupload/Moxie.swf',  //引入flash,相对路径
			filters: {
				mime_types: [
					//只允许上传图片文件 （注意，extensions中，逗号后面不要加空格）
					{title: "图片文件", extensions: "jpg,gif,png,bmp"}
				]
			},
			max_retries: 3,                   //上传失败最大重试次数
			dragdrop: true,                   //开启可拖曳上传
			drop_element: textElemId,        //拖曳上传区域元素的ID，拖曳文件或文件夹后可触发上传
			chunk_size: '4mb',                //分块上传时，每片的体积
			auto_start: true,                 //选择文件后自动上传，若关闭需要自己绑定事件触发上传
			init: {
				'FilesAdded': function (up, files) {
					plupload.each(files, function (file) {
						// 文件添加进队列后,处理相关的事情
						printLog('on FilesAdded');
					});
				},
				'BeforeUpload': function (up, file) {
					// 每个文件上传前,处理相关的事情
					printLog('on BeforeUpload');
				},
				'UploadProgress': function (up, file) {
					// 显示进度
					printLog('进度 ' + file.percent)
				},
				'FileUploaded': function (up, file, info) {
					// 每个文件上传成功后,处理相关的事情
					// 其中 info 是文件上传成功后，服务端返回的json，形式如
					// {
					//    "hash": "Fh8xVqod2MQ1mocfI4S4KpRL6D98",
					//    "key": "gogopher.jpg"
					//  }
					printLog(info);
					// 参考http://developer.qiniu.com/docs/v6/api/overview/up/response/simple-response.html

					var domain = up.getOption('domain');
					var res = $.parseJSON(info);
					var sourceLink = domain + res.key; //获取上传成功后的文件的Url

					printLog(sourceLink);

					// 插入图片到editor
					editor.cmd.do('insertHtml', '<img src="' + sourceLink + '" style="max-width:100%;"/>')
				},
				'Error': function (up, err, errTip) {
					//上传出错时,处理相关的事情
					printLog('on Error');
				},
				'UploadComplete': function () {
					//队列文件处理完毕后,处理相关的事情
					printLog('on UploadComplete');
				}
				// Key 函数如果有需要自行配置，无特殊需要请注释
				//,
				// 'Key': function(up, file) {
				//     // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
				//     // 该配置必须要在 unique_names: false , save_key: false 时才生效
				//     var key = "";
				//     // do something with key here
				//     return key
				// }
			}
		});
		// domain 为七牛空间（bucket)对应的域名，选择某个空间后，可通过"空间设置->基本设置->域名设置"查看获取
		// uploader 为一个plupload对象，继承了所有plupload的方法，参考http://plupload.com/docs
	}

	// 封装 console.log 函数
	function printLog(title, info) {
		window.console && console.log(title, info);
	}

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
				data: {"jtitle": jtitle, "jabstract": jabstract, "jauthor": jauthor, "jliulan": jliulan,"jtype":jtype,"jtext": jtext}
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