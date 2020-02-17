<%--
  Created by IntelliJ IDEA.
  User: Stephen
  Date: 2020/2/17
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = application.getContextPath();
%>
<html>
<head>
	<TITLE>菜单权限管理</TITLE>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="<%=path+"/lib/layui-v2.5.5/css/layui.css"%>" media="all">

	<link rel="stylesheet" href="<%=path+"/css/ztreedemo.css"%>" type="text/css">
	<link rel="stylesheet" href="<%=path+"/css/zTreeStyle/zTreeStyle.css"%>" type="text/css">

</head>
<body>

<input type="hidden" id="hid" value=<%=path%>>

<div class="content_wrap">
	<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
</div>

<script type="text/javascript" src="<%=path+"/js/jquery-3.4.1.js"%>"></script>
<script type="text/javascript" src="<%=path+"/js/ztree/jquery.ztree.core.js"%>"></script>
<script type="text/javascript" src="<%=path+"/js/ztree/jquery.ztree.excheck.js"%>"></script>

<SCRIPT type="text/javascript">
	<!--
	var setting = {
		check: {
			enable: true
		},
		data: {
			simpleData: {
				enable: true
			}
		}
	};

	var zNodes =[
		{ id:1, pId:0, name:"用户管理", open:true},
		{ id:11, pId:1, name:"管理员登录", open:true},
		{ id:12, pId:1, name:"用户查询", open:true},
		{ id:13, pId:1, name:"用户管控", open:true},

		{ id:2, pId:0, name:"文档管理", open:true},
		{ id:21, pId:2, name:"管理员登录", open:true},
		{ id:22, pId:2, name:"用户查询", open:true},

		{ id:3, pId:0, name:"日志管理", open:true},
		{ id:31, pId:3, name:"日志列表", open:true},

		{ id:4, pId:0, name:"系统配置", open:true},
		{ id:41, pId:4, name:"上传奖励配置", open:true},
		{ id:42, pId:4, name:"注册奖励配置", open:true}
	];

	var code;

	function setCheck() {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			py = $("#py").attr("checked")? "p":"",
			sy = $("#sy").attr("checked")? "s":"",
			pn = $("#pn").attr("checked")? "p":"",
			sn = $("#sn").attr("checked")? "s":"",
			type = { "Y":py + sy, "N":pn + sn};
		zTree.setting.check.chkboxType = type;
		showCode('setting.check.chkboxType = { "Y" : "' + type.Y + '", "N" : "' + type.N + '" };');
	}

	function showCode(str) {
		if (!code) code = $("#code");
		code.empty();
		code.append("<li>"+str+"</li>");
	}

	$(document).ready(function(){
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		setCheck();
		$("#py").bind("change", setCheck);
		$("#sy").bind("change", setCheck);
		$("#pn").bind("change", setCheck);
		$("#sn").bind("change", setCheck);
	});
	//-->
</SCRIPT>

</body>
</html>
