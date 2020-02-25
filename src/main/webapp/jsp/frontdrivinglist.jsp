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
<h2>品牌驾校</h2><br>
<form class="layui-form" action="" method="post">
	<div class="layui-form-item" id="area-picker">
		<div class="layui-input-inline" style="width: 200px;">
			<select name="province" class="province-selector" lay-filter="province-1">
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
		<div class="layui-input-inline">
			<button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">搜索</button>
			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		</div>
	</div>
</form>

<div class="row" style="width: 1210px; margin: 0 auto;">

	<%--	<div class="col-md-2" style="height:250px;float: left" >--%>
	<%--		<a href=""><img src="<%=path+"/images/ds.jpg"%>" width="170" height="170" style="display: inline-block;"></a>--%>
	<%--		<p><a href="product_info.html" style='color: green'>天安驾校</a></p>--%>
	<%--		<p><a href="product_info.html" style='color: yellow'>通过率：97%</a></p>--%>
	<%--		<p><font color="#FF0000">价格：¥3500</font></p>--%>
	<%--	</div>--%>

	<%--	<div class="col-md-2" style="height:250px;float: left; padding-left: 20px">--%>
	<%--		<a href="">--%>
	<%--			<img src="<%=path+"/images/ds.jpg"%>" width="170" height="170" style="display: inline-block;">--%>
	<%--		</a>--%>
	<%--		<p>--%>
	<%--			<a href="product_info.html" style='color: green'>天安驾校</a>--%>
	<%--		</p>--%>
	<%--		<p>--%>
	<%--			<font color="#FF0000">价格：¥3500</font>--%>
	<%--		</p>--%>
	<%--	</div>--%>

	<c:if test="${sessionScope.drivingschoollist !=null}">
		<table>
			<tr>
				<c:forEach items="${sessionScope.drivingschoollist}" begin="0" end="3" var="drivingschoollist">
					<td>
						<div class="col-md-2" style="height:250px;">
							<a href="product_info.htm"><img
									src="${pageContext.request.contextPath}/${drivingschoollist.dschoolimage}"
									width="170" height="170" style="display: inline-block;"></a>
							<p><a href="product_info.html" style='color: green'>${drivingschoollist.dname}</a></p>
							<p><font color="#6495ed">通过率：97%</font></p>
							<p><font color="#FF0000">价格：¥${drivingschoollist.dprice}</font></p>
						</div>
					</td>
				</c:forEach>
			</tr>

			<tr>
				<c:forEach items="${sessionScope.drivingschoollist}" begin="4" end="7" var="drivingschoollist">
					<td>
						<div class="col-md-2" style="height:250px;">
							<a href="product_info.htm"><img src="${pageContext.request.contextPath}/${drivingschoollist.dschoolimage}"
									width="170" height="170" style="display: inline-block;"></a>
							<p><a href="product_info.html" style='color: green'>${drivingschoollist.dname}</a></p>
							<p><font color="#6495ed">通过率：97%</font></p>
							<p><font color="#FF0000">价格：¥${drivingschoollist.dprice}</font></p>
						</div>
					</td>
				</c:forEach>
			</tr>
		</table>

<%--		<c:forEach items="${sessionScope.drivingschoollist}" var="drivingschoollist">--%>
<%--			<div class="col-md-2" style="height:250px;float: left;">--%>
<%--				<a href="product_info.htm"><img--%>
<%--						src="${pageContext.request.contextPath}/${drivingschoollist.dschoolimage}"--%>
<%--						width="170" height="170" style="display: inline-block;"></a>--%>
<%--				<p><a href="product_info.html" style='color: green'>${drivingschoollist.dname}</a></p>--%>
<%--				<p><font color="#6495ed">通过率：97%</font></p>--%>
<%--				<p><font color="#FF0000">价格：¥${product.shop_price}</font></p>--%>
<%--			</div>--%>
<%--		</c:forEach>--%>
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
			change: function (res) {
				//选择结果
				console.log(res);
			}
		});
	});
</script>
</body>
</html>
