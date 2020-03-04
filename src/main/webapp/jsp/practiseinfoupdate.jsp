<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
Created by IntelliJ IDEA.
User: Stephen
Date: 2020/2/14
Time: 17:58
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String  Path = application.getContextPath();
%>
<html>
<head>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href=<%=Path+"/lib/layui-v2.5.5/css/layui.css"%>>
	<link rel="stylesheet" href="<%=Path+"/lib/lay-module/step-lay/step.css"%>" media="all">
	<script src=<%=Path+"/lib/layui-v2.5.5/layui.js"%>></script>
	<script type="text/javascript" src=<%=Path+"/lib/jquery-3.4.1/jquery-3.4.1.min.js"%>></script>
	<script type="text/javascript" src=<%=Path+"/js/json2.js"%>></script>
	<script type="text/javascript" src=<%=Path+"/js/preg.js"%>></script>
	<script type="text/javascript" src=<%=Path+"/js/backpractisereg.js"%>></script>
	<script src=<%=Path+"/js/lay-config.js?v=1.0.4"%> charset="utf-8"></script>
	<title>Title</title>
</head>
<body>

<div class="layui-form-item" style="margin-left: 670px;margin-top: 100px">
	<div class="layui-inline">
		<input type="text" value=""  id="pic_1_src" name="examine_base" style="display: none;"><!--隐藏控件，用于存储图片在服务器中的地址 -->
		<div class="layui-upload" style="margin-top: -100px;">
			<div class="layui-upload-list">
				<img class="layui-upload-img" id="pic_1" src="" style="height: 150px;width: 200px" onclick="showBigImage(this)">
				<p id="picText_1"></p>
			</div>
			<button type="button" class="layui-btn" id="upload_1" style="margin-left: 53px">修改头像</button>
		</div>
	</div>
</div>



<div class="layui-form-item" style="margin-left: 590px">
	<div class="layui-inline">
		<label class="layui-form-label">修改密码</label>
		<div class="layui-input-inline">
			<input type="password" onkeyup="value=value.replace(/[\u4e00-\u9fa5]/ig,'')" name="password" required lay-verify="required" autocomplete="off" class="layui-input" id="updatepass">
		</div>
	</div>
</div>
<div class="layui-form-item" style="margin-left: 590px">
	<div class="layui-inline">
		<label class="layui-form-label">确认密码</label>
		<div class="layui-input-inline">
			<input type="password" onkeyup="value=value.replace(/[\u4e00-\u9fa5]/ig,'')" name="password" required lay-verify="required"  autocomplete="off" class="layui-input" id="updatepass1">
		</div>
	</div>
</div>
<div class="layui-form-item" style="margin-left: 590px">
	<div class="layui-inline">
		<label class="layui-form-label">名称：</label>
		<div class="layui-input-inline" style="width: 500px">
			<div id="pname" style="margin-top: 10px;"> </div> <b id="updatename" style="color: #0C88E8;">修改名称</b>
		</div>
	</div>
</div>
<div class="layui-form-item" style="margin-left: 590px">
	<div class="layui-inline">
		<label class="layui-form-label">手机：</label>
		<div class="layui-input-inline" style="width: 500px">
			<div id="phone" style="margin-top: 10px;"></div>  <b id="updatephone" style="color: #0C88E8;">修改手机号</b>
		</div>
	</div>
</div>
<div class="layui-form-item" style="margin-left: 590px;">
	<div class="layui-inline">
		<label class="layui-form-label">邮箱：</label>
		<div class="layui-input-inline" style="width: 500px">
			<div id="email" style="margin-top: 10px;"></div><b id="updateemail" style="color: #0C88E8;">修改邮箱</b>
		</div>
	</div>
</div>
<div class="layui-form-item" style="margin-left: 590px;">
	<div class="layui-inline">
		<label class="layui-form-label">身份证：</label>
		<div class="layui-input-inline" style="width: 500px">
			<div id="idcard" style="margin-top: 10px;"></div><b id="updateidcard" style="color: #0C88E8;">修改身份证</b>
		</div>
	</div>
</div>
<div class="layui-form-item" style="margin-left: 590px">
	<div class="layui-inline">
		<label class="layui-form-label">个人简介：</label>
		<div class="layui-input-inline">
			<div id="resume" style="margin-top: 10px;width: 270px; word-break:break-all;OVERFLOW:auto;display:inline-block"></div><b id="updateresume" style="color: #0C88E8;">更改简介</b>
		</div>
	</div>
</div>
<div class="layui-btn" id="layui-btnn" style="margin-left: 740px">保存</div>

<script>
	window.onload=start;
	function start(){
		$.ajax({
			url: '/springboot/selectavatar',
			method: 'post',
			datatype:'json',
			async:false,
			success: function (msg) {
				var aa=eval(msg);
				$("#pic_1").attr('src', aa[0].pphoto);
				document.getElementById("pname").innerHTML=aa[0].pname
				document.getElementById("phone").innerHTML=aa[0].pphone
				document.getElementById("email").innerHTML=aa[0].pemail
				document.getElementById("idcard").innerHTML=aa[0].pidcard
				document.getElementById("resume").innerHTML=aa[0].presume
			}
		});


	}
</script>
	<script>
	layui.use('upload', function(){
		var $ = layui.jquery
			,upload = layui.upload;

		//普通图片上传,商品参考图，共4张，第一张
		var uploadInst = upload.render({
			elem: '#upload_1'
			,url: '/springboot/addcar'
			,accept:'images'
			,size:50000
			,before: function(obj){

				obj.preview(function(index, file, result){

					$('#pic_1').attr('src', result);
				});
			}
			,done: function(data){
				//如果上传失败
				if(data.code > 0){
					return layer.msg('修改失败');
				}
				//上传成功
				var demoText = $('#picText_1');
				demoText.html('<span style="color: #4cae4c;">修改成功</span>');
				//将后台获取的图片地址传到前台存入隐藏控件中，随着表单一起提交
				document.getElementById("pic_1_src").value = data.src;
				console.log("图片地址："+data.src);
			}
			,error: function(){
				//演示失败状态，并实现重传
				var demoText = $('#picText_1');
				demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
				demoText.find('.demo-reload').on('click', function(){
					uploadInst.upload();
				});
			}
		});

	});


</script>
<script type="text/javascript">
	$("#layui-btnn").on('click',function(){
		layui.use('layer', function() {
			var path=document.getElementById("pic_1_src").value
			var updatepass=$("#updatepass").val()
			var updatepass1=$("#updatepass1").val()
			var image_a=document.getElementById('pic_1');
			var addres="..\\images\\"+image_a.src.substring(40);
			if(path==''){
				path=addres;
			}
			if(updatepass!=updatepass1){
				layer.msg('两次密码不一致',{icon: 2});
				return false;
			}else{
				$.ajax({
					url: '/springboot/updateavatar',
					method: 'post',
					data: {avatar:path,updatepass:updatepass},
					dataType: 'text'
				});
				layer.msg('保存成功')

				setTimeout( function(){
					window.parent.location.reload();
				}, 2000 );//延迟两秒
			}



		});

	});
</script>
<script>
	function showBigImage(e) {
		layer.open({
			type: 1,
			title: false,
			offset:'40px',
			closeBtn: 0,
			shadeClose: true, //点击阴影关闭
			area: [$(e).width+ 'px', $(e).height + 'px'], //宽高
			content: "<img src=" + $(e).attr('src') + " />"
		});
	}
</script>
</body>
<script type="text/javascript">

	$('#updatename').on('click',function(){
		layui.use('layer', function() {
			var layer = layui.layer;
			layer.open({
				id:1,
				type: 1,
				title:'修改名称',
				skin:'layui-layer-rim',
				area:['450px', '250px'],
				content: ' <div class="layui-form-item" >'
					+'<div class="layui-inline">'
					+'<div class="input-group">'
					+'<label class="layui-form-label">修改名称</label>'
					+'<div class="layui-input-inline">'
					+'<input type="text"  id="updatename" name="updatename" autocomplete="off" class="layui-input">'
					+'</div>'
					+'</div>'
					+'</div>'
				,
				btn:['保存','取消'],
				btn1: function (index,layero) {
					var newname=layero.find('#updatename');
					var updatename=$(newname).val();
					if(updatename==''){
						layer.msg('请填写您要修改的名字',{icon: 2});
						return false;
					}else{
						$.ajax({
							url: '/springboot/updatename',
							method: 'post',
							data: {updatename:updatename},
							dataType: 'text'
						});
						layer.msg('修改成功')
						layer.close(index);
						setTimeout( function(){
							parent.location.reload();
						}, 1200 );//延迟两秒
					}

				},
				btn2:function (index,layero) {
					layer.close(index);
				}

			});
		});
	})
</script>

<script type="text/javascript">

	$('#updatephone').on('click',function(){
		layui.use('layer', function() {
			var layer = layui.layer;
			layer.open({
				id:1,
				type: 1,
				title:'修改手机号',
				skin:'layui-layer-rim',
				area:['450px', '300px'],
				content: ' <div class="layui-form-item" >'
					+'<div class="layui-inline">'
					+'<div class="input-group">'
					+'<label class="layui-form-label">旧手机号</label>'
					+'<div class="layui-input-inline">'
					+'<input type="text"  id="oldphone" name="updatename" autocomplete="off" class="layui-input">'
					+'</div>'
					+'</div>'
					+'</div>'
					+'<div class="layui-form-item" >'
					+'<div class="layui-inline">'
					+'<div class="input-group">'
					+'<label class="layui-form-label">新手机号</label>'
					+'<div class="layui-input-inline">'
					+'<input type="text"  id="updatephone" name="updatephone" autocomplete="off" class="layui-input">'
					+'</div>'
					+'</div>'
					+'</div>'
				,
				btn:['保存','取消'],
				btn1: function (index,layero) {
					var oldphone=layero.find('#oldphone');
					var newphone=layero.find('#updatephone');
					var ophone=$(oldphone).val();
					var updatephone=$(newphone).val()
					var ol=document.getElementById("phone").innerText
					if(ophone==''||updatephone==''){
						layer.msg('请填写完整',{icon: 2});
						return false;
					}
					else if(ophone!=ol){
						layer.msg('旧手机号不正确请重新输入',{icon: 2});
						return false;
					}else{
				$.ajax({
							url: '/springboot/updatephone',
							method: 'post',
							data: {updatephone:updatephone},
							dataType: 'text'
						});
						layer.msg('修改成功')
						layer.close(index);
						setTimeout( function(){
							parent.location.reload();
						}, 1200 );//延迟两秒
					}

				},
				btn2:function (index,layero) {
					layer.close(index);
				}

			});
		});
	})
</script>
<script type="text/javascript">

	$('#updateemail').on('click',function(){
		layui.use('layer', function() {
			var layer = layui.layer;
			layer.open({
				id:1,
				type: 1,
				title:'修改邮箱',
				skin:'layui-layer-rim',
				area:['450px', '300px'],
				content: ' <div class="layui-form-item" >'
					+'<div class="layui-inline">'
					+'<div class="input-group">'
					+'<label class="layui-form-label">旧邮箱</label>'
					+'<div class="layui-input-inline">'
					+'<input type="text"  id="oldemail" name="oldemail" autocomplete="off" class="layui-input">'
					+'</div>'
					+'</div>'
					+'</div>'
					+'<div class="layui-form-item" >'
					+'<div class="layui-inline">'
					+'<div class="input-group">'
					+'<label class="layui-form-label">新邮箱</label>'
					+'<div class="layui-input-inline">'
					+'<input type="text"  id="updateemail" name="updateemail" autocomplete="off" class="layui-input">'
					+'</div>'
					+'</div>'
					+'</div>'
				,
				btn:['保存','取消'],
				btn1: function (index,layero) {
					var oldemail=layero.find('#oldemail');
					var newemail=layero.find('#updateemail');
					var oemail=$(oldemail).val();
					var updateemail=$(newemail).val()
					var ol=document.getElementById("email").innerText
					if(oemail==''||updateemail==''){
						layer.msg('请填写完整',{icon: 2});
						return false;
					}
					else if(oemail!=ol){
						layer.msg('旧邮箱不正确请重新输入',{icon: 2});
						return false;
					}else{
						$.ajax({
							url: '/springboot/updateemail',
							method: 'post',
							data: {updateemail:updateemail},
							dataType: 'text'
						});
						layer.msg('修改成功')
						layer.close(index);
						setTimeout( function(){
							parent.location.reload();
						}, 1200 );//延迟两秒
					}

				},
				btn2:function (index,layero) {
					layer.close(index);
				}

			});
		});
	})
</script>
<script type="text/javascript">

	$('#updateidcard').on('click',function(){
		layui.use('layer', function() {
			var layer = layui.layer;
			layer.open({
				id:1,
				type: 1,
				title:'修改身份证',
				skin:'layui-layer-rim',
				area:['450px', '300px'],
				content: ' <div class="layui-form-item" >'
					+'<div class="layui-inline">'
					+'<div class="input-group">'
					+'<label class="layui-form-label">旧身份证</label>'
					+'<div class="layui-input-inline">'
					+'<input type="text"  id="oldidcard" name="oldidcard" autocomplete="off" class="layui-input">'
					+'</div>'
					+'</div>'
					+'</div>'
					+'<div class="layui-form-item" >'
					+'<div class="layui-inline">'
					+'<div class="input-group">'
					+'<label class="layui-form-label">新身份证</label>'
					+'<div class="layui-input-inline">'
					+'<input type="text"  id="updateidcard" name="updateidcard" autocomplete="off" class="layui-input">'
					+'</div>'
					+'</div>'
					+'</div>'
				,
				btn:['保存','取消'],
				btn1: function (index,layero) {
					var oldidcard=layero.find('#oldidcard');
					var newidcard=layero.find('#updateidcard');
					var oidcard=$(oldidcard).val();
					var updateidcard=$(newidcard).val()
					var ol=document.getElementById("idcard").innerText
					if(oidcard==''||updateidcard==''){
						layer.msg('请填写完整',{icon: 2});
						return false;
					}
					else if(oidcard!=ol){
						layer.msg('旧身份证不正确请重新输入',{icon: 2});
						return false;
					}else{
						$.ajax({
							url: '/springboot/updateidcard',
							method: 'post',
							data: {updateidcard:updateidcard},
							dataType: 'text'
						});
						layer.msg('修改成功')
						layer.close(index);
						setTimeout( function(){
							parent.location.reload();
						}, 1200 );//延迟两秒
					}

				},
				btn2:function (index,layero) {
					layer.close(index);
				}

			});
		});
	})
</script>
<script type="text/javascript">

	$('#updateresume').on('click',function(){
		layui.use('layer', function() {
			var layer = layui.layer;
			layer.open({
				id:1,
				type: 1,
				title:'修改简介',
				skin:'layui-layer-rim',
				area:['600px', '400px'],
				content: ' <div class="layui-form-item" >'
					+'<div class="layui-inline">'
					+'<div class="input-group">'
					+'<label class="layui-form-label">修改简介</label>'
					+'<div class="layui-input-inline">'
					+'<textarea id="updateresume" placeholder="请介绍您自己（限200字）" name="question" cols="70" rows="10" style="resize:none;height: 200px;width: 400px"></textarea>'
					+'</div>'
					+'</div>'
					+'</div>'
				,
				btn:['保存','取消'],
				btn1: function (index,layero) {
					var newresume=layero.find('#updateresume');
					var updateresume=$(newresume).val();
					if(updateresume==''){
						layer.msg('请填写您的简介',{icon: 2});
						return false;
					}else if(updateresume.length>200){
						layer.msg('字数超过限制',{icon: 2});
						return false;
					}else{
						$.ajax({
							url: '/springboot/updateresume',
							method: 'post',
							data: {updateresume:updateresume},
							dataType: 'text'
						});
						layer.msg('修改成功')
						layer.close(index);
						setTimeout( function(){
							parent.location.reload();
						}, 1200 );//延迟两秒
					}

				},
				btn2:function (index,layero) {
					layer.close(index);
				}

			});
		});
	})
</script>
</html>
