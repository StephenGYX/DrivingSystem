<%@ page import="com.drivingsys.bean.Drivingschool" %><%--
Created by IntelliJ IDEA.
User: Stephen
Date: 2020/2/14
Time: 17:58
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = application.getContextPath();
	String wenben="";
	if (session.getAttribute("drivingschool")!= null)
	{
		Drivingschool dsc = (Drivingschool) (session.getAttribute("drivingschool"));
		wenben = dsc.getDsynopsis();
	}

//	System.out.println("webben+" + wenben);
%>
<html>
<head>
	<meta charset="utf-8">
	<title>驾校信息修改页面</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="<%=path+"/lib/layui-v2.5.5/css/layui.css"%>" media="all">
	<link rel="stylesheet" href="<%=path+"/css/public.css"%>" media="all">
	<%--	<link rel="stylesheet" href="<%=path+"/lib/lay-module/step-lay/step.css"%>" media="all">--%>

	<link rel="stylesheet" href=<%=path+"/lib/jq-module/zyupload/zyupload-1.0.0.min.css"%> media="all">

</head>

<body>

<div class="layuimini-container">
	<div class="layuimini-main">
		<%--		<input type="hidden" value="${sessionScope.drivingschool.dsynopsis}" id="wb">--%>
		<form class="layui-form" action="" style="padding:20px;" method="post">
			<input type="hidden" name="xingwei" id="xingwei" value="see">

			<div class="layui-form layuimini-form">
				<div class="layui-form-item">
					<label class="layui-form-label required">用户名</label>
					<div class="layui-input-inline">
						<input type="hidden" name="did" id="did" value="${sessionScope.drivingschool.did}">
						<input type="text" name="username" lay-verify="required" lay-reqtext="用户名不能为空"
						       placeholder="请输入用户名" value="${sessionScope.drivingschool.daccount}" class="layui-input"
						       id="username">
						<%--						onfocus="this.blur()--%>
						<%--						<input type="hidden" name="did" value="${sessionScope.drivingschool.did}">--%>
						<%--						<span name="username">${sessionScope.drivingschool.dname}</span>--%>
						<%--						<tip>填写驾校账号信息，该账号具有唯一性。</tip>--%>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label required">联系人姓名</label>
					<div class="layui-input-inline">
						<input type="text" name="dcontacts" lay-verify="required" lay-reqtext="联系人不能为空"
						       placeholder="请输入联系人姓名" value="${sessionScope.drivingschool.dcontacts}"
						       class="layui-input" id="dcontacts">
						<tip>填写驾校负责人真实姓名。</tip>
					</div>
				</div>


<%--				<div class="layui-form-item">--%>
<%--					<label class="layui-form-label required">密码</label>--%>
<%--					<div class="layui-input-inline">--%>
<%--						<input type="password" id="dpassword" name="password" lay-verify="required"--%>
<%--						       placeholder="请输入驾校账号密码" value="${sessionScope.drivingschool.dpassword}"--%>
<%--						       class="layui-input">--%>
<%--					</div>--%>
<%--				</div>--%>

				<div class="layui-form-item">
					<label class="layui-form-label required">联系电话</label>
					<div class="layui-input-inline">
						<input type="number" name="phone" lay-verify="required" lay-reqtext="手机不能为空" placeholder="请输入手机"
						       value="${sessionScope.drivingschool.dphone}" class="layui-input" id="dphone">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">邮箱</label>
					<div class="layui-input-inline">
						<input type="email" name="email" lay-verify="email" placeholder="请输入邮箱"
						       value="${sessionScope.drivingschool.demail}" class="layui-input" id="demail">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">驾校名称</label>
					<div class="layui-input-inline">
						<input type="text" id="dname" name="dname" placeholder="请输入驾校名称"
						       value="${sessionScope.drivingschool.dname}" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item" id="area-picker">
					<div class="layui-form-label">所在市区</div>
					<div class="layui-input-inline" style="width: 200px;">
						<select name="province" class="province-selector"
						        data-value="${sessionScope.drivingschool.dprovince}" lay-filter="province-1"
						        id="dprovince">
							<option value="">请选择省</option>
						</select>
					</div>
					<div class="layui-input-inline" style="width: 200px;">
						<select name="city" class="city-selector" data-value="${sessionScope.drivingschool.dcity}"
						        lay-filter="city-1" id="dcity">
							<option value="">请选择市</option>
						</select>
					</div>
					<div class="layui-input-inline" style="width: 200px;">
						<select name="county" class="county-selector" data-value="${sessionScope.drivingschool.darea}"
						        lay-filter="county-1" id="darea">
							<option value="">请选择区</option>
						</select>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label required">报名费用</label>
					<div class="layui-input-inline">
						<input type="number" name="cost" lay-verify="required" lay-reqtext="报名费用不能为空"
						       placeholder="报名最低价"
						       value="${sessionScope.drivingschool.dprice}" class="layui-input" id="dprice">
					</div>
				</div>
				<%--				${sessionScope.practise.pphoto}--%>
				<%--				<div class="layui-form-item layui-form-text">--%>
				<%--					<label class="layui-form-label">招生信息</label>--%>
				<%--					<div class="layui-input-inline">--%>
				<%--						<textarea name="remark" class="layui-textarea" placeholder="请输入驾校简介"--%>
				<%--						          id="dsynopsis">${sessionScope.drivingschool.dsynopsis}</textarea>--%>
				<%--					</div>--%>
				<%--				</div>--%>
				<div class="layui-form-item ">
					<label class="layui-form-label">图片上传</label>
					<div class="layui-input-block">
						<button type="button" id="test1">驾校图片上传</button>
						<blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
							预览图：

							<div class="layui-upload-list">
								<img class="layui-upload-img" style="width: 150px;height: 150px;padding-left: 100px"
								     id="demo2" src='<%=path%>/${sessionScope.drivingschool.dschoolimage}' onclick="showBigImage(this)">
								<p id="demoText"></p>
							</div>
						</blockquote>
					</div>
				</div>
				<label class="layui-form-label">驾校主页信息设置</label><br>
				<div style="text-align: left;padding-left: 110px;width: 80%">

					<div id="editor">
						<p><%=wenben%>
						</p>
					</div>
				</div>


				<div class="layui-upload">
					<button type="button" class="layui-btn" id="sureup" style="width: 200px;display: none">开始上传</button>
				</div>
				<input type="hidden" name="upxingwei" id="upxingwei" value="1">

				<div class="layui-form-item">
					<div class="layui-input-inline">
						<button class="layui-btn" lay-submit lay-filter="saveBtn" id="test2">确认保存</button>
					</div>
				</div>
			</div>


		</form>

	</div>
</div>
<script src="<%=path+"/lib/jquery-3.4.1/jquery-3.4.1.min.js"%>" charset="utf-8"></script>
<script type="text/javascript" src="<%=path+"/js/wangEditor/wangEditor.js"%>"></script>

<script src="<%=path+"/lib/jq-module/zyupload/zyupload-1.0.0.min.js"%>" charset="utf-8"></script>
<script src="<%=path+"/lib/layui-v2.5.5/layui.js"%>" charset="utf-8"></script>
<script src=<%=path+"/js/lay-config.js?v=1.0.4"%> charset="utf-8"></script>
<script>
	var E = window.wangEditor;
	var editor = new E('#editor');

	editor.customConfig.uploadImgServer = '<%=path%>/dscimage/upload'; //上传URL
	editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024;
	editor.customConfig.uploadImgMaxLength = 5;
	editor.customConfig.uploadFileName = 'myFileName';
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
		'undo',  // 撤销
		'redo'  // 重复
	];
	<%--editor.txt.html(<%=wenben%>);--%>
	editor.create();


	layui.use(['layer', 'form', 'layarea', 'upload'], function () {
		var layer = layui.layer
			, form = layui.form,
			$ = layui.jquery
			, layarea = layui.layarea
			, upload = layui.upload;

		var formData;
		//监听提交
		form.on('submit(saveBtn)', function (data) {
			formData = data.field;
			var jtext = editor.txt.html();
			$('#sureup').click();
			$.ajax({
				url: "<%=path+"/fact/DSCupdatainfo"%>",//后台路径,
				type: "POST",
				// data: {"did": function () {
				// 		return $('#did').val();
				// 	}},
				data: {
					dscParams: JSON.stringify(formData)
					, dsynopsis: jtext
				},
				dataType: "text",

				success: function (msg) {
					alert(msg);
					if (msg > 0) {

						layer.msg("提交成功", {icon: 6});


					} else {

						layer.msg("提交失败", {icon: 5});
					}
				}

			});


			return false;
		});
		layarea.render({
			elem: '#area-picker',

		});

		//多图片上传 现改为单
		upload.render({
			elem: '#test1'
			, url: "<%=path+"/fact/upload"%>" //改成您自己的上传接口
			// , multiple: true
			, auto: false //选择文件后不自动上传
			, bindAction: '#sureup' //指向一个按钮触发上传
			// , number: 3
			, data: {
				"did": function () {
					return $('#did').val();
				}
				// , "jxxx":function () {
				// 	return $('#upxingwei').val();
				// }
			}
			, choose: function (obj) {
				// $('#demo2').height(180);
				//将每次选择的文件追加到文件队列
				var files = obj.pushFile();
				//预读本地文件，如果是多文件，则会遍历。(不支持ie8/9)
				obj.preview(function (index, file, result) {
					// var fileshu = $('#demo2').find('img').length;
					// if (file.size > 0 && fileshu === 0) {
					// 	$('#demo2').empty();
					// }
					// // if (fileshu)
					// // 添加图片 demo2-预览的dom元素的id
					// $('#demo2').append(
					// 	'<div  id="container' + index + '" style="margin-top: -12px;float: left;padding-top: 10px"><div class="layui-btn-container">' +
					// 	'<button id="upload_img_' + index + '" class="layui-btn layui-btn-danger layui-btn<-xs">删除</button></div>' +
					//
					// 	'<img id="showImg' + index + '" style="width: 150px; margin:10px;cursor:pointer" src="' + result + '" alt="' + file.name + '"></div>'
					// 	// '<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">'
					// );
					// //删除某图片
					// $("#upload_img_" + index).bind('click', function () {
					// 	delete files[index];
					// 	$("#container" + index).remove();
					// });
					$('#demo2').attr('src', result); //图片链接（base64）
					//某图片放大预览
					// $("#showImg" + index).bind('click', function () {
					// 	var width = $("#showImg" + index).width();
					// 	var height = $("#showImg" + index).height();
					// 	var scaleWH = width / height;
					// 	var bigH = 600;
					// 	var bigW = scaleWH * bigH;
					// 	if (bigW > 900) {
					// 		bigW = 900;
					// 		bigH = bigW / scaleWH;
					// 	}
					//
					// 	// 放大预览图片
					// 	layer.open({
					// 		type: 1,
					// 		title: false,
					// 		closeBtn: 1,
					// 		shadeClose: true,
					// 		area: [bigW + 'px', bigH + 'px'], //宽高
					// 		content: "<img width='" + bigW + "' height='" + bigH + "' src=" + result + " />"
					// 	});
					// }
					// );

				})
			}
			, before: function (obj) { //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
				layer.load(); //上传loading
			}
			, done: function (res, index, upload) {
				if (res.code === 0) {
					alert("上传成功");
				}
				layer.closeAll('loading'); //关闭loading
			}
			, error: function (index, upload) {
				layer.closeAll('loading'); //关闭loading
			}
		});


	});
</script>

<script type="text/javascript">

	function selectinfo(data) {
		console.log(data);

		$("#dcontacts").val(data.dcontacts);
		$("#username").val(data.daccount);
		$("#did").val(data.did);

		$("#dprovince").attr("data-value", data.dprovince);
		$("#dcity").attr("data-value", data.dcity);
		$("#darea").attr("data-value", data.darea);

		// $("#dsynopsis").text(data.dsynopsis);
		$("#dprice").val(data.dprice);
		$("#dpassword").val(data.dpassword);
		$("#demail").val(data.demail);
		$("#dname").val(data.dname);
		$("#dphone").val(data.dphone);
		$("#demo2").attr("src","../../"+data.dschoolimage);
		editor.txt.html(data.dsynopsis);

	}

	function xingwei() {
		$("#xingwei").val("instert");
	}

	var param;
	var strings;
	//加载的时候获取参数(驾校ID)
	window.onload = function () {
		<%--editor.txt.html(<%=wenben%>);--%>
		<%--editor.txt.append(<%=wenben%>);--%>
		param = location.search;
		strings = param.split("=");

		console.log(param);
		console.log(strings[0]);
		console.log(strings[1]);
		strings = strings[1];
		if (strings == "see") {
			$("#test2").hide();
			// $('input').attr("readonly","readonly")//将input元素设置为readonly
			$('input').attr("disabled", "disabled");//将input元素设置为disabled
			$("#dsynopsis").attr("disabled", "disabled");
			$("#dprovince").attr("disabled", "disabled");
			$("#dcity").attr("disabled", "disabled");
			$("#darea").attr("disabled", "disabled");
			editor.$textElem.attr('contenteditable', false)
		}
	};


</script>
<script>


	function showBigImage(e) {

		var width = $(e).width();
		var height = $(e).height();
		var scaleWH = width / height;
		var bigH = 600;
		var bigW = scaleWH * bigH;
		if (bigW > 900) {
			bigW = 900;
			bigH = bigW / scaleWH;
		}

		// 放大预览图片
		layer.open({
			type: 1,
			title: false,
			closeBtn: 1,
			shadeClose: true,
			area: [bigW + 'px', bigH + 'px'], //宽高
			content: "<img width='" + bigW + "' height='" + bigH + "' src=" + $(e).attr('src') + " />"
		});


	}
</script>
</body>
</html>
