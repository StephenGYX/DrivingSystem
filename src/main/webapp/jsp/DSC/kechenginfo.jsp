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

%>
<html>
<head>
	<meta charset="utf-8">
	<title>驾校课程页面</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="<%=path+"/lib/layui-v2.5.5/css/layui.css"%>" media="all">
	<link rel="stylesheet" href="<%=path+"/css/public.css"%>" media="all">
	<%--	<link rel="stylesheet" href="<%=path+"/lib/lay-module/step-lay/step.css"%>" media="all">--%>


</head>

<body>

<div class="layuimini-container">
	<div class="layuimini-main">

		<form class="layui-form" action="" style="padding:20px;" method="post">


			<div class="layui-form layuimini-form">
				<div class="layui-form-item">
					<label class="layui-form-label required">课程名</label>
					<div class="layui-input-inline">
						<input type="hidden" name="kid" id="kid" value="">
						<input type="hidden" name="did" id="did" value="${sessionScope.drivingschool.did}">
						<input type="hidden" name="xingwei" id="xingwei" value="instert">
						<input type="text" name="kname" lay-verify="required" lay-reqtext="课程名不能为空"
						       placeholder="请输入课程名" value="" class="layui-input"
						       id="kname">
						<%--						onfocus="this.blur()--%>
						<%--						<input type="hidden" name="did" value="${sessionScope.drivingschool.did}">--%>
						<%--						<span name="username">${sessionScope.drivingschool.dname}</span>--%>
						<%--						<tip>填写驾校账号信息，该账号具有唯一性。</tip>--%>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label required">课程简介</label>
					<div class="layui-input-inline">
						<input type="text" name="kjianjie" lay-verify="required" lay-reqtext="课程简介不能为空"
						       placeholder="请输入课程简介"
						       value="" class="layui-input" id="kjianjie">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label required">时间段</label>
					<div class="layui-input-inline">
						<input type="text" name="kshijianduan" lay-verify="required" lay-reqtext="课程简介不能为空"
						       placeholder="请输入课程简介"
						       value="周一到周日全天" class="layui-input" id="kshijianduan">
					</div>
				</div>


				<div class="layui-form-item">
					<label class="layui-form-label">总课时</label>
					<div class="layui-input-inline">
						<input type="number" id="kcosttime" name="kcosttime" placeholder=""
						       value="" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label required">该课程报名费用</label>
					<div class="layui-input-inline">
						<input type="number" name="kprice" lay-verify="required" lay-reqtext="报名费用不能为空"
						       placeholder="该课程报名费用"
						       value="" class="layui-input" id="kprice">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label ">备注：可不填</label>
					<div class="layui-input-inline">
						<input type="text" name="beizhu"
						       placeholder="备注"
						       value="" class="layui-input" id="beizhu">
					</div>
				</div>
				<%--				<div class="layui-form-item layui-form-text">--%>
				<%--					<label class="layui-form-label">招生信息</label>--%>
				<%--					<div class="layui-input-inline">--%>
				<%--						<textarea name="remark" class="layui-textarea" placeholder="请输入驾校简介"--%>
				<%--						          id="dsynopsis">${sessionScope.drivingschool.dsynopsis}</textarea>--%>
				<%--					</div>--%>
				<%--				</div>--%>
				<div class="layui-form-item">
					<label class="layui-form-label">对应驾照类型</label>
					<div class="layui-input-inline" style="width: 200px;">
						<select name="kjiazhaoleixing" class="province-selector"
						        data-value="" lay-filter="province-1"
						        id="kjiazhaoleixing">
							<option value="c1">c1</option>
							<option value="c2">c2</option>
						</select>
					</div>

				</div>
			</div>


			<div class="layui-form-item">
				<div class="layui-input-inline">
					<button class="layui-btn" lay-submit lay-filter="saveBtn" id="test2">确认保存</button>
				</div>
			</div>
			<%--			</div></div>--%>


		</form>

	</div>
</div>
<script src="<%=path+"/lib/jquery-3.4.1/jquery-3.4.1.min.js"%>" charset="utf-8"></script>


<script src="<%=path+"/lib/layui-v2.5.5/layui.js"%>" charset="utf-8"></script>
<script src=<%=path+"/js/lay-config.js?v=1.0.4"%> charset="utf-8"></script>
<script>
	layui.use(['layer', 'form', 'layarea', 'upload'], function () {
		var layer = layui.layer
			, form = layui.form,
			$ = layui.jquery
			, layarea = layui.layarea
			, upload = layui.upload;
		//监听提交
		form.on('submit(saveBtn)', function (data) {
			var formData = data.field;


			$.ajax({
				url: "<%=path+"/dSchool/Dkechenginfo"%>",//后台路径,
				type: "POST",
				data: {"dscParams": JSON.stringify(data.field)},
				dataType: "text",
				success: function (msg) {
					alert(msg);
					if (msg === 0) {

						layer.msg("新增成功", {icon: 6});


					} else if (msg===1) {

						layer.msg("新增失败", {icon: 5});
					}
					else if (msg===2) {

						layer.msg("修改成功", {icon: 5});
					}
					else if (msg===3) {

						layer.msg("修改失败", {icon: 5});
					}
				}

			});


			return false;
		});
		layarea.render({
			elem: '#area-picker',

		});


	});
</script>

<script type="text/javascript">

	function selectinfo(data) {


		console.log(data);

		$("#kid").val(data.kid);
		$("#kcosttime").val(data.daccount);


		$("#kname").val(data.kname);
		$("#kjiazhaoleixing").attr("data-value", data.kjiazhaoleixing);


		$("#kjianjie").val(data.kjianjie);
		$("#kprice").val(data.kprice);
		$("#beizhu").val(data.beizhu);
		$("#kcosttime").val(data.kcosttime);
		$("#kshijianduan").val(data.kshijianduan);

		$("#xingwei").val("updata");

	}
	function selectxingwei() {
		$("#xingwei").val("instert");
	}
</script>
</body>
</html>
