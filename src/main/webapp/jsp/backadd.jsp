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
	<script src=<%=Path+"/js/lay-config.js?v=1.0.4"%> charset="utf-8"></script>
	<title>Title</title>

</head>
<body>

<div>
	<div class="txt">
		<div class="layui-form-item">
			<label class="layui-form-label">输入车牌号</label>
			<div class="layui-input-block">
				<input type="text" id="carnum" name="title" lay-verify="title" autocomplete="off" placeholder="请输入车牌号" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">输入品牌</label>
			<div class="layui-input-block">
				<input type="text" id="carbrand" name="title" lay-verify="title" autocomplete="off" placeholder="请输入品牌" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">输入型号</label>
			<div class="layui-input-block">
				<input type="text" id="carmodel" name="title" lay-verify="title" autocomplete="off" placeholder="请输入型号" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<input type="text" value=""  id="pic_1_src" name="examine_base" style="display: none;"><!--隐藏控件，用于存储图片在服务器中的地址 -->
				<div class="layui-upload">
					<div class="layui-upload-list">
						<img class="layui-upload-img" id="pic_1">
						<p id="picText_1"></p>
					</div>
					<button type="button" class="layui-btn" id="upload_1" style="margin-left: 30px">上传图片</button>
				</div>
			</div>
		</div>
		<div class="layui-btn" id="layui-btnn" style="margin-left: 30px">保存</div>
</div>

</div>

</body>
<script type="text/javascript">
	$("#layui-btnn").on('click',function(){
		layui.use('layer', function() {
			var layer = layui.layer;//引入layer组件
			var carnum=$('#carnum').val();
			var carbrand=$('#carbrand').val();
			var carmodel=$('#carmodel').val();
			var path=document.getElementById("pic_1_src").value
			if(carnum==''||carbrand==''||carmodel==''){
				layer.msg('请输入完整',{icon: 2});
				return false;
			}else if(path==''){
				layer.msg('请上传车辆图片',{icon: 2});
				return false;
			}else{
				$.ajax({
					url: '/springboot/addcar1',
					method: 'post',
					data: {num:carnum,brand:carbrand,model:carmodel,carimages:path},
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
					return layer.msg('上传失败');
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


</html>
