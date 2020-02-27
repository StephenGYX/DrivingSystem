<%--
  Created by IntelliJ IDEA.
  User: Stephen
  Date: 2020/2/25
  Time: 8:39
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
	<title>品牌驾校</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport"
	      content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">

	<link rel="stylesheet" href="<%=path+"/lib/layui-v2.5.5/css/layui.css"%>" media="all">
	<link rel="stylesheet" href="<%=path+"/css/public.css"%>" media="all">
	<link rel="stylesheet" href="<%=path+"/lib/lay-module/step-lay/step.css"%>" media="all">

</head>
<body>
<input type="hidden" id="hid" value=<%=path%>>
<br><br>
<div style="font-family: tahoma; font-size: 28px; font-weight: bold; font-style: normal; color: rgb(204, 204, 204); background-color: transparent; line-height: 28px; text-decoration: none; text-align: center; visibility: visible; animation-name: bounceIn;">
	<span>DRIVING SCHOOL</span>
</div>
<br>

<div style="font-family: 微软雅黑; font-size: 26px; font-weight: normal; font-style: normal; color: rgb(255, 101, 54); background-color: transparent; line-height: 26px; text-decoration: none; text-align: center; visibility: visible; animation-name: bounceIn;">
	<span>品牌驾校</span>
</div>
<br>

<form class="layui-form" action="<%=path+"/dSchool/queryqianDSC"%>" method="post">
	<div class="layui-form-item" id="area-picker" style="padding-left: 65px">
		<div class="layui-input-inline" style="width: 200px;">
			<select name="province" class="province-selector" data-value="${sessionScope.area.province}" lay-filter="province-1">
				<option value="">请选择省</option>
			</select>
		</div>
		<div class="layui-input-inline" style="width: 200px;">
			<select name="city" class="city-selector" data-value="${sessionScope.area.city}" lay-filter="city-1">
				<option value="">请选择市</option>
			</select>
		</div>
		<div class="layui-input-inline" style="width: 200px;">
			<select name="county" class="county-selector" data-value="${sessionScope.area.county}" lay-filter="county-1">
				<option value="">请选择区</option>
			</select>
		</div>
		<button type="submit" class="layui-btn layui-btn-danger" style="width: 100px" lay-submit="" lay-filter="demo1">
			搜索
		</button>
		<button type="reset" class="layui-btn layui-btn-primary" style="width: 100px">重置</button>
	</div>
</form>

<div class="row" id="dslist" style="width: 1210px; margin: 0 auto;">
	<c:if test="${sessionScope.drivingschoollist !=null}">
		<table id="dstable">
			<tr>
				<c:forEach items="${sessionScope.drivingschoollist}" begin="0" end="4" var="drivingschoollist">
					<td>
						<div class="col-md-2" style="height:250px;padding: 15px">
							<a href="product_info.htm"><img
									src="${pageContext.request.contextPath}/${drivingschoollist.dschoolimage}"
									width="200" height="200" style="display: inline-block;"></a><br>
							<p><a href="product_info.html" style='color: green'>${drivingschoollist.dname}</a></p>
							<p><font color="#6495ed">通过率：97%</font></p>
							<p><font color="#FF0000">价格：¥${drivingschoollist.dprice}</font></p>
						</div>
					</td>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach items="${sessionScope.drivingschoollist}" begin="5" end="9" var="drivingschoollist">
					<td>
						<div class="col-md-2" style="height:250px;padding: 15px;">
							<a href="product_info.htm"><img
									src="${pageContext.request.contextPath}/${drivingschoollist.dschoolimage}"
									width="200" height="200" style="display: inline-block;"></a><br>
							<p><a href="product_info.html" style='color: green'>${drivingschoollist.dname}</a></p>
							<p><font color="#6495ed">通过率：97%</font></p>
							<p><font color="#FF0000">价格：¥${drivingschoollist.dprice}</font></p>
						</div>
					</td>
				</c:forEach>
			</tr>
		</table>
	</c:if>
</div>

<script src="<%=path+"/lib/layui-v2.5.5/layui.js"%>" charset="utf-8"></script>
<script src="<%=path+"/js/lay-config.js?v=1.0.4"%>" charset="utf-8"></script>
<script src="<%=path+"/js/frontdrivinglist.js"%>" charset="utf-8"></script>

<script>
	layui.use(['layer', 'form', 'layarea'], function () {
		var layer = layui.layer
			, form = layui.form
			, layarea = layui.layarea;

		layarea.render({
			elem: '#area-picker',
			// data: {
			//     province: '广东省',
			//     city: '深圳市',
			//     county: '龙岗区',
			// },
			// change: function (res) {
			// 	//选择结果
			// 	console.log(res);
			// }
		});
	});
</script>
</body>
</html>
