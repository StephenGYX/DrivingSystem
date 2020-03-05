<%@ page import="com.drivingsys.bean.Drivingschool" %>    <%--
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
	Drivingschool dsc = (Drivingschool) (session.getAttribute("drivingschool"));
	String dpassword = dsc.getDpassword();

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>修改密码</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="<%=path+"/lib/layui-v2.5.5/css/layui.css"%>" media="all">
	<link rel="stylesheet" href="<%=path+"/css/public.css"%>" media="all">
	<style>
		.layui-form-item .layui-input-company {
			width: auto;
			padding-right: 10px;
			line-height: 38px;
		}
	</style>
</head>
<body>
<div class="layuimini-container">
	<div class="layuimini-main">
<input type="hidden" value="<%=dpassword%>" id="dpassword">
		<div class="layui-form layuimini-form">
			<div class="layui-form-item">
				<label class="layui-form-label required">旧的密码</label>
				<div class="layui-input-block">
					<input type="password" name="old_password" id="oldpass" lay-verify="required" lay-reqtext="旧的密码不能为空"
					       placeholder="请输入旧的密码" value="" class="layui-input">
					<tip>填写自己账号的旧的密码。</tip>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label required">新的密码</label>
				<div class="layui-input-block">
					<input type="password" name="new_password" id="newpass" lay-verify="required" lay-reqtext="新的密码不能为空"
					       placeholder="请输入新的密码" value="" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label required">新的密码</label>
				<div class="layui-input-block">
					<input type="password" name="again_password" id="surepass" lay-verify="required" lay-reqtext="新的密码不能为空"
					       placeholder="请输入新的密码" value="" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="saveBtn">确认保存</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="<%=path+"/lib/layui-v2.5.5/layui.js"%>" charset="utf-8"></script>
<script src=<%=path+"/js/lay-config.js?v=1.0.4"%> charset="utf-8"></script>
<script>
	layui.use(['form', 'layuimini'], function () {
		var form = layui.form,
			layer = layui.layer,
			layuimini = layui.layuimini,
			$ = layui.jquery;
		//监听提交
		form.on('submit(saveBtn)', function (data) {
			var oldpass=$('#oldpass').val();

			var newpass=$('#newpass').val();
			var surepass=$('#surepass').val();
			var dpass=$('#dpassword').val();
			alert(oldpass + dpass+ surepass+newpass);
			if (oldpass !=dpass){
				layer.msg("密码错误",{icon: 5});
				return false;
			} else if (newpass!=surepass){
				layer.msg("前后密码不一致",{icon: 5});
				newpass.val("");
					surepass.val("");
				return false;
			} else {
				$.ajax({
					url: "<%=path+"/dSchool/updateCoachPwdByDid"%>",//后台路径,
					type: "POST",
					// data: {"did": function () {
					// 		return $('#did').val();
					// 	}},
					data: {
						newpass: newpass
					},
					dataType: "text",

					success: function (msg) {
						alert(msg);
						if (msg > 0) {

							layer.msg("修改密码成功", {icon: 6});


						} else {

							layer.msg("修改密码失败", {icon: 5});
						}
					},
					error:function () {
						layer.msg("提交错误", {icon: 5});
					}

				});


				return false;




				}




			}  	)









		// });

	});
</script>
</body>
</html>