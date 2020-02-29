<%--
  Created by IntelliJ IDEA.
  User: Stephen
  Date: 2020/2/15
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = application.getContextPath();
%>
<html>
<head>
	<title>驾考后台管理系统</title>
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
	<link rel="stylesheet" href="<%=path+"/lib/font-awesome-4.7.0/css/font-awesome.min.css"%>" media="all">

	<!--[if lt IE 9]>
	<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
	<script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>

	<![endif]-->
	<style id="layuimini-bg-color"></style>
</head>
<body class="layui-layout-body layuimini-all">

<input type="hidden" id="hid" value=<%=path%>>

<div class="layui-layout layui-layout-admin">
	<div class="layui-header header">
		<div class="layui-logo"></div>
		<a>
			<div class="layuimini-tool"><i title="展开" class="fa fa-outdent" data-side-fold="1"></i></div>
		</a>

		<ul class="layui-nav layui-layout-left layui-header-menu layui-header-pc-menu mobile layui-hide-xs">
		</ul>
		<ul class="layui-nav layui-layout-left layui-header-menu mobile layui-hide-sm">
			<li class="layui-nav-item">
				<a href="javascript:;"><i class="fa fa-list-ul"></i> 选择模块</a>
				<dl class="layui-nav-child layui-header-mini-menu">
				</dl>
			</li>
		</ul>

		<ul class="layui-nav layui-layout-right">
			<li class="layui-nav-item">
				<a href="javascript:;">
					<img src=<%=path+"/images/headphoto.jpg"%> class="layui-nav-img">
					${sessionScope.drivingschool.dname}
				</a>
				<dl class="layui-nav-child">
<%--					<dd><a href="<%=path+"/jsp/DSC/DSCHinfo2.jsp"%>">基本资料</a></dd>--%>
					<dd><a href="">安全设置</a></dd>
					<dd>
						<a href="javascript:;" data-iframe-tab="<%=path+"/jsp/DSC/DSCHinfo2.jsp?do=see"%>" data-title="查看资料" data-icon="fa fa-gears">查看资料</a>
					</dd>
				</dl>
			</li>
			<li class="layui-nav-item">
				<a href="javascript:;" class="login-out">退出登录</a>
			</li>
		</ul>

<%--配色方案角标--%>
<%--			<li class="layui-nav-item layuimini-select-bgcolor mobile layui-hide-xs" lay-unselect>--%>
<%--				<a href="javascript:;" data-bgcolor="配色方案"><i class="fa fa-ellipsis-v"></i></a>--%>
<%--			</li>--%>
<%--		</ul>--%>
	</div>

	<div class="layui-side layui-bg-black">
		<div class="layui-side-scroll layui-left-menu">
		</div>
	</div>

	<div class="layui-body">
		<div class="layui-tab" lay-filter="layuiminiTab" id="top_tabs_box">
			<ul class="layui-tab-title" id="top_tabs">
				<li class="layui-this" id="layuiminiHomeTabId" lay-id=""></li>
			</ul>
			<ul class="layui-nav closeBox">
				<li class="layui-nav-item">
					<a href="javascript:;"> <i class="fa fa-dot-circle-o"></i> 页面操作</a>
					<dl class="layui-nav-child">
						<dd><a href="javascript:;" data-page-close="other"><i class="fa fa-window-close"></i> 关闭其他</a>
						</dd>
						<dd><a href="javascript:;" data-page-close="all"><i class="fa fa-window-close-o"></i> 关闭全部</a>
						</dd>
					</dl>
				</li>
			</ul>

			<div class="layui-tab-content clildFrame">
				<div id="layuiminiHomeTabIframe" class="layui-tab-item layui-show">
				</div>
			</div>
		</div>
	</div>
</div>


<!--百度统计代码-开始 正式使用请删除-->
<script>
	var _hmt = _hmt || [];
	(function() {var hm = document.createElement("script");hm.src = "https://hm.baidu.com/hm.js?d97abf6d61c21d773f97835defbdef4e";var s = document.getElementsByTagName("script")[0];s.parentNode.insertBefore(hm, s);})();
</script>

<!--百度统计代码-结束-->
<script src="<%=path+"/lib/layui-v2.5.5/layui.js?v=1.0.4"%>" charset="utf-8"></script>
<script src="<%=path+"/js/lay-config.js?v=1.0.4"%>" charset="utf-8"></script>
<script src="<%=path+"/js/backmenu.js"%>" charset="utf-8"></script>

<script>
	layui.use(['element', 'layer', 'layuimini'], function () {
		var $ = layui.jquery,
			element = layui.element,
			layer = layui.layer;

		<%--layuimini.init('<%=path+"/api/init.json"%>');--%>
		<%--layuimini.init(<%=path+"/menu/queryRoleMenu"%>);--%>
		layuimini.init("/springboot/fact/queryRoleMenu");

		$('.login-out').on("click", function () {
			layer.msg('退出登录成功', function () {
				window.location = '/springboot/jsp/frontlogin3.jsp';
			});
		});
	});
</script>
</body>
</html>
