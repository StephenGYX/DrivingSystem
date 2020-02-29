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
			<label class="layui-form-label">修改驾校</label>
			<div class="layui-input-block">
				<input type="text" id="upda" name="title" lay-verify="title" autocomplete="off" placeholder="请输入新驾校" class="layui-input">
			</div>
		</div>
		<script>
			$(function () {
				//从父层获取值，json是父层的全局js变量。eval是将该string类型的json串变为标准的json串
				var parent_json = eval('('+parent.json+')');
				$("#j").innerHTML=parent_json.vcarnum;
			});
		</script>
		<div class="layuimini-container">
			<div class="layuimini-main">


				<div class="layui-form-item" id="area-picker">
					<div class="layui-form-label">状态</div>
					<div class="layui-input-inline" style="padding-top: 7px;">
						<select id="prov" name="province" class="province-selector"  lay-filter="province-1">
							<option value="1">正常</option>
							<option value="2">使用中</option>
							<option value="3">维修中</option>
							<option value="4">报废</option>
						</select>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="layui-btn" id="layui-btnn" style="margin-left: 50px">保存</div>

</body>
<script type="text/javascript">
	$("#layui-btnn").on('click',function(){
		layui.use('layer', function() {
			var layer = layui.layer;//引入layer组件
			var upda=$('#upda').val();
			var prov=$('#prov').val();
			var parent_json = eval('('+parent.json+')');
			var num=parent_json.vcarnum;
			if(upda==''){
				layer.msg('请填写驾校名称',{icon: 2});
				return false;
			}else{
				$.ajax({
					url: '/springboot/updat',
					method: 'post',
					data: {driving:upda,state:prov,num:num},
					dataType: 'text'
				});
				layer.msg('修改成功');

				setTimeout( function(){
					window.parent.location.reload();
				}, 2000 );//延迟两秒
			}

		});
	});

</script>


</html>
