<%--
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
	String roleid = session.getAttribute("roleid") + "";
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

		<form class="layui-form" action="" style="padding:20px;" method="post">


			<div class="layui-form layuimini-form">
				<div class="layui-form-item">
					<label class="layui-form-label required">用户名</label>
					<div class="layui-input-block">
						<input type="text" name="username" lay-verify="required" lay-reqtext="用户名不能为空"
						       placeholder="请输入用户名" value="${sessionScope.drivingschool.dname}" class="layui-input">
<%--						onfocus="this.blur()--%>
						<input type="hidden" name="did" value="${sessionScope.drivingschool.did}">
<%--						<span name="username">${sessionScope.drivingschool.dname}</span>--%>
<%--						<tip>填写驾校账号信息，该账号具有唯一性。</tip>--%>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label required">联系人姓名</label>
					<div class="layui-input-block">
						<input type="text" name="dcontacts" lay-verify="required" lay-reqtext="联系人不能为空"
						       placeholder="请输入联系人姓名" value="" class="layui-input">
						<tip>填写驾校负责人真实姓名。</tip>
					</div>
				</div>


				<div class="layui-form-item">
					<label class="layui-form-label required">密码</label>
					<div class="layui-input-block">
						<input type="password" name="password" lay-verify="required" placeholder="请输入驾校账号密码" value="" class="layui-input">
					</div>
				</div>
<%--				<div class="layui-form-item">--%>
<%--					<label class="layui-form-label required">性别</label>--%>
<%--					<div class="layui-input-block">--%>
<%--						<input type="radio" name="sex" value="男" title="男" checked="">--%>
<%--						<input type="radio" name="sex" value="女" title="女">--%>
<%--					</div>--%>
<%--				</div>--%>
				<div class="layui-form-item">
					<label class="layui-form-label required">联系电话</label>
					<div class="layui-input-block">
						<input type="number" name="phone" lay-verify="required" lay-reqtext="手机不能为空" placeholder="请输入手机"
						       value="" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">邮箱</label>
					<div class="layui-input-block">
						<input type="email" name="email" lay-verify="email" placeholder="请输入邮箱" value="" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">驾校名称</label>
					<div class="layui-input-block">
						<input type="text" name="dname" placeholder="请输入驾校名称" value="" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item" id="area-picker">
					<div class="layui-form-label">所在市区</div>
					<div class="layui-input-inline" style="width: 200px;">
						<select name="province" class="province-selector" data-value="福建省" lay-filter="province-1">
							<option value="">请选择省</option>
						</select>
					</div>
					<div class="layui-input-inline" style="width: 200px;">
						<select name="city" class="city-selector" data-value="" lay-filter="city-1">
							<option value="">请选择市</option>
						</select>
					</div>
					<div class="layui-input-inline" style="width: 200px;">
						<select name="county" class="county-selector" data-value="" lay-filter="county-1">
							<option value="">请选择区</option>
						</select>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label required">报名费用</label>
					<div class="layui-input-block">
						<input type="number" name="cost" lay-verify="required" lay-reqtext="报名费用不能为空" placeholder="报名最低价"
						       value="" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">招生信息</label>
					<div class="layui-input-block">
						<textarea name="remark" class="layui-textarea" placeholder="请输入驾校简介"></textarea>
					</div>
				</div>
				<div class="layui-form-item ">
					<label class="layui-form-label">图片上传</label>
					<div class="layui-input-block">
						<button type="button"  id="test1">多图片上传</button>
						<blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
							预览图：
							<div class="layui-upload-list" id="demo2" ></div>
						</blockquote>
					</div>
				</div>


<%--				<div id="zyupload" class="zyupload" name="zyupload"></div>--%>

<%--				<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">--%>
<%--					<legend>上传多张图片</legend>--%>
<%--				</fieldset>--%>





				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="saveBtn" id="test2">确认保存</button>
					</div>
				</div>
			</div>



		</form>

	</div>
</div>
<script src="<%=path+"/lib/jquery-3.4.1/jquery-3.4.1.min.js"%>" charset="utf-8"></script>

<script src="<%=path+"/lib/jq-module/zyupload/zyupload-1.0.0.min.js"%>" charset="utf-8"></script>
<script src="<%=path+"/lib/layui-v2.5.5/layui.js"%>" charset="utf-8"></script>
<script src=<%=path+"/js/lay-config.js?v=1.0.4"%> charset="utf-8"></script>
<script>
	layui.use(['layer', 'form', 'layarea','upload'], function () {
		var layer = layui.layer
			, form = layui.form,
			$ = layui.jquery
			, layarea = layui.layarea
			,upload=layui.upload;
		//监听提交
		form.on('submit(saveBtn)', function (data) {
			var formData = data.field;


			$.ajax({
				url: "<%=path+"/fact/DSCupdatainfo"%>",//后台路径,
				type: "POST",
				data: {"dscParams": JSON.stringify(data.field)},
				dataType: "text",
				success: function (msg) {

					if (msg > 0) {

						layer.msg("注册成功", {icon: 6});



					} else {

						layer.msg("注册失败", {icon: 5});
					}
				}

			});




			return false;
		});
		layarea.render({
			elem: '#area-picker',

		});

		//多图片上传
		upload.render({
			elem: '#test1'
			,url: "<%=path+"/fact/upload"%>" //改成您自己的上传接口
			,multiple: true
			,auto: false //选择文件后不自动上传
			,bindAction: '#test2' //指向一个按钮触发上传
			,number:3
			, choose: function (obj) {
				$('#demo2').height(180);
				//将每次选择的文件追加到文件队列
				var files = obj.pushFile();
				//预读本地文件，如果是多文件，则会遍历。(不支持ie8/9)
				obj.preview(function (index, file, result) {
			             var fileshu=$('#demo2').find('img').length;
					if (file.size > 0 && fileshu === 0) {
						$('#demo2').empty();
					}
					// if (fileshu)
					// 添加图片 demo2-预览的dom元素的id
					$('#demo2').append(
						'<div  id="container'+index+'" style="margin-top: -12px;float: left;padding-top: 10px"><div class="layui-btn-container">'+
						'<button id="upload_img_'+index+'" class="layui-btn layui-btn-danger layui-btn<-xs">删除</button></div>' +

						'<img id="showImg'+index+'" style="width: 150px; margin:10px;cursor:pointer" src="'+ result +'" alt="' + file.name + '"></div>'
						// '<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">'
					);
					//删除某图片
					$("#upload_img_" + index).bind('click', function () {
						delete files[index];
						$("#container"+index).remove();
					});

					//某图片放大预览
					$("#showImg"+index).bind('click',function () {
						var width = $("#showImg"+index).width();
						var height = $("#showImg"+index).height();
						var scaleWH = width/height;
						var bigH = 600;
						var bigW = scaleWH*bigH;
						if(bigW>900){
							bigW = 900;
							bigH = bigW/scaleWH;
						}

						// 放大预览图片
						layer.open({
							type: 1,
							title: false,
							closeBtn: 1,
							shadeClose: true,
							area: [bigW + 'px', bigH + 'px'], //宽高
							content: "<img width='"+bigW+"' height='"+bigH+"' src=" + result + " />"
						});
					});

				})},

			done: function(res){
				//上传完毕
			}
		});


	});
</script>

<script type="text/javascript">
	$(function () {
		// 初始化插件
		$("#zyupload").zyUpload({
			width: "600",                 // 宽度
			height: "20%",                 // 宽度
			itemWidth: "140px",                 // 文件项的宽度
			itemHeight: "115px",                 // 文件项的高度
			url: "<%=path+"/fact/upload"%>",  // 上传文件的路径
			fileType: ["jpg", "png", "txt", "js", "exe"],// 上传文件的类型
			fileSize: 51200000,                // 上传文件的大小
			multiple: true,                    // 是否可以多个文件上传
			dragDrop: true,                    // 是否可以拖动上传文件
			tailor: true,                    // 是否可以裁剪图片
			del: true,                    // 是否可以删除文件
			finishDel: false,  				  // 是否在上传文件完成后删除预览
			/* 外部获得的回调接口 */
			onSelect: function (selectFiles, allFiles) {    // 选择文件的回调方法  selectFile:当前选中的文件  allFiles:还没上传的全部文件
				console.info("当前选择了以下文件：");
				console.info(selectFiles);
			},
			onDelete: function (file, files) {              // 删除一个文件的回调方法 file:当前删除的文件  files:删除之后的文件
				console.info("当前删除了此文件：");
				console.info(file.name);
			},
			onSuccess: function (file, response) {          // 文件上传成功的回调方法
				console.info("此文件上传成功：");
				console.info(file.name);
				console.info("此文件上传到服务器地址：");
				console.info(response);
				$("#uploadInf").append("<p>上传成功，文件地址是：" + response + "</p>");
			},
			onFailure: function (file, response) {          // 文件上传失败的回调方法
				console.info("此文件上传失败：");
				console.info(file.name);
			},
			onComplete: function (response) {           	  // 上传完成的回调方法
				console.info("文件上传完成");
				console.info(response);
			}
		});

	});
</script>
</body>
</html>
