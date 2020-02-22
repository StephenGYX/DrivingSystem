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
	<title>教练/驾校/学员登陆</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Access-Control-Allow-Origin" content="*">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">

	<link rel="icon" href="<%=path+"/images/favicon.ico"%>">
	<link rel="stylesheet" href="<%=path+"/lib/layui-v2.5.5/css/layui.css"%>" media="all">
	<link rel="stylesheet" href="<%=path+"/css/layuimini.css"%>" media="all">
	<link rel="stylesheet" href="<%=path+"/css/frontlogin.css"%>" >
	<link rel="stylesheet" href="<%=path+"/lib/font-awesome-4.7.0/css/font-awesome.min.css"%>" media="all">
	<script src="<%=path+"/lib/layui-v2.5.5/layui.js"%>"></script>
	<!--[if lt IE 9]>
	<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
	<script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
	<style id="layuimini-bg-color"></style>
</head>
<body>
<div class="layui-row ">

<div class="layui-col-md5 " style="background-color: #00FFFF">
	<span>左边</span>
</div>

	<div class="layui-col-md7 " >
<div class="layui-tab" lay-filter="tab-all" >

	<ul class="layui-tab-title">
		<li data-status="4" class="layui-this">学员</li>
		<li data-status="2">驾校</li>
		<li data-status="3">教练</li>
	</ul>

	<div class="layui-tab-content" >

		<form class="layui-form" action="<%=path+"/fact/frontLogin"%>" method="post" >
			<div class="layui-form-item">
				<label class="layui-form-label">输入框</label>
				<div class="layui-input-inline">
					<input type="text" name="account" required  lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">辅助文字</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码框</label>
				<div class="layui-input-inline">
					<input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
				</div>

			</div>


			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="formDemo">登陆</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</form>

<div>
	<a class="layui-btn" href="backlogin.jsp" id="reg">注册</a>
</div>
		<h2>测试验证码：</h2>
		   请输入验证码：<input type="text" name="code" /><img id="codeimg" src="${pageContext.request.contextPath }/fact/getyzm" onclick="changeImg()">
	</div>

</div>

</div>
</div>
<script>
	//一般直接写在一个js文件中
	layui.use(['layer', 'form', 'element'], function () {

		var layer = layui.layer
			, form = layui.form,
			element = layui.element,
			$ = layui.jquery;
		element.on('tab(tab-all)', function (data) {
			// console.log(this);        // 当前Tab标题所在的原始DOM元素
			// console.log(data.index);  // 得到当前Tab的所在下标
			// console.log(data.elem);   // 得到当前的Tab大容器
			// alert("点击选项卡");

			var roleid = $(this).attr('data-status');
			alert(roleid);
			$.ajax({
				// contentType:"application/json",
				type: "post"
				, url: '<%=path+"/fact/roleid"%>'
				//预期服务器返回的数据类型;
				, datatype: "json"
				//从该js会发出到服务器的数据
				, data: {"roleid": roleid}
				//从servlet接收的数据
				, success: function (msg) {
					alert(msg+"suc");
					layer.msg("已经变更角色id");
					if (msg==2){//2 驾校 3教练 4学员
						$('#reg').attr('href',"area.jsp");
					}else if (msg==3) {
						$('#reg').attr('href',"backpractisereg.jsp");
					}

					else if (msg==4) {
						$('#reg').attr('href',"backreg.jsp");
					}
				}
				, error: function (msg) {
					alert(msg+"error");
					layer.alert("服务器正忙.....");
				}
			});

		})

	});
</script>
<script type="text/javascript">

	//改变验证码事件
	        function changeImg(){
		            var img = document.getElementById('codeimg');
		            img.src = "${pageContext.request.contextPath }/fact/getyzm?x=" + Math.floor(Math.random()*100)

	        }</script>
</body>
</html>
