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
	<meta charset="utf-8">
	<title>省市县区选择区</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="<%=path+"/lib/layui-v2.5.5/css/layui.css"%>" media="all">
	<link rel="stylesheet" href="<%=path+"/css/public.css"%>" media="all">
	<link rel="stylesheet" href="<%=path+"/lib/lay-module/step-lay/step.css"%>" media="all">
	<script type="text/javascript" src="//api.map.baidu.com/api?v=2.0&ak=qndpvrYqRPHWaspKTGpZcuN2l3FudVgh"></script>

</head>

<body>

<div class="layuimini-container">
	<div class="layuimini-main">

		<form class="layui-form" action="" style="padding:20px;" method="post">

			<input name="longitude" id="longitude" type="hidden">
			<input name="latitude" id="latitude" type="hidden">
			<div  class="layui-form layuimini-form" style="margin-left: 80px;margin-bottom: 20px">

			<button type="button" class="layui-btn" id="test1">
				<i class="layui-icon">&#xe67c;</i>身份证正面上传
			</button>
<%--				<button type="button" class="layui-btn" id="test2">--%>
<%--					<i class="layui-icon">&#xe67c;</i>身份证反面上传--%>
<%--				</button>--%>

			</div>
			<div class="layui-form layuimini-form">
				<div class="layui-form-item">
					<label class="layui-form-label required">用户名</label>
					<div class="layui-input-block">
						<input type="text" name="username" lay-verify="required" lay-reqtext="用户名不能为空"
						       placeholder="请输入用户名" value="" class="layui-input">
						<tip>填写驾校账号信息，该账号具有唯一性。</tip>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label required">联系人姓名</label>
					<div class="layui-input-block">
						<input type="text" id="name" name="dcontacts" lay-verify="required" lay-reqtext="联系人不能为空"
						       placeholder="请输入联系人姓名" value="" class="layui-input">
						<tip>填写驾校负责人真实姓名。</tip>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label required">身份证号</label>
					<div class="layui-input-block">
						<input type="text" id="number" name="idnumber" lay-verify="required" lay-reqtext="身份证号不能为空"
						       placeholder="请输入联系人身份证号" value="" class="layui-input">
						<tip>填写驾校负责人身份证号。</tip>
					</div>
				</div>


				<div class="layui-form-item">
					<label class="layui-form-label">密码</label>
					<div class="layui-input-block">
						<input type="password" name="password" lay-verify="required" placeholder="请输入驾校账号密码" value="" class="layui-input">
					</div>
				</div>
<%--				<div class="layui-form-item">--%>
<%--					<label class="layui-form-label required">性别</label>--%>
<%--					<div class="layui-input-block">--%>
<%--						<input type="radio" name="sex" value="男" title="男" checked="">--%>
<%--						<input type="radio" name="sex" value="女" title="女">--%>
<%--					</div>--%>
<%--				</div>--%>
				<div class="layui-form-item">
					<label class="layui-form-label required">联系电话</label>
					<div class="layui-input-block">
						<input type="number" name="phone" lay-verify="required" lay-reqtext="手机不能为空" placeholder="请输入手机"
						       value="" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">邮箱</label>
					<div class="layui-input-block">
						<input type="email" name="email" lay-verify="email" placeholder="请输入邮箱" value="" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">驾校名称</label>
					<div class="layui-input-block">
						<input type="text" name="dname" placeholder="请输入驾校名称" value="" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item" id="area-picker">
					<div class="layui-form-label">所在市区</div>
					<div class="layui-input-inline" style="width: 200px;">
						<select name="province" class="province-selector" data-value="福建省" lay-filter="province-1">
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
					<div class="layui-input-inline" style="width: 200px;" id="r-result">
						<div class="layui-form-label">详细地址:</div>
						<div class="layui-input-block">
							<input class="layui-input" type="text" id="suggestId"  value="百度" style="width:260px;" />
						</div></div>
				</div>
				<div id="l-map"></div>

				<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>

				<div class="layui-form-item">
					<label class="layui-form-label required">报名费用</label>
					<div class="layui-input-block">
						<input type="number" name="cost" lay-verify="required" lay-reqtext="报名费用不能为空" placeholder="报名最低价"
						       value="" class="layui-input">
					</div>
				</div>

				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">招生信息</label>
					<div class="layui-input-block">
						<textarea name="remark" class="layui-textarea" placeholder="请输入驾校简介"></textarea>
					</div>
				</div>

				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="saveBtn">确认保存</button>
					</div>
				</div>
			</div>



		</form>

	</div>
</div>

<script src="<%=path+"/lib/layui-v2.5.5/layui.js"%>" charset="utf-8"></script>
<script src=<%=path+"/js/lay-config.js?v=1.0.4"%> charset="utf-8"></script>
<script>
	// 百度地图API功能
	function G(id) {
		return document.getElementById(id);
	}

	var map = new BMap.Map("l-map");
	map.centerAndZoom("厦门市",12);                   // 初始化地图,设置城市和地图级别。

	var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
		{"input" : "suggestId"
			,"location" : map
		});

	ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
		var str = "";
		var _value = e.fromitem.value;
		var value = "";
		if (e.fromitem.index > -1) {
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}
		str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

		value = "";
		if (e.toitem.index > -1) {
			_value = e.toitem.value;
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}
		str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
		G("searchResultPanel").innerHTML = str;
	});

	var myValue;
	ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
		var _value = e.item.value;
		myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;

		setPlace();
	});

	function setPlace(){
		map.clearOverlays();    //清除地图上所有覆盖物
		function myFun(){
			var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
			map.centerAndZoom(pp, 18);
			map.addOverlay(new BMap.Marker(pp));    //添加标注
		}
		var local = new BMap.LocalSearch(map, { //智能搜索
			onSearchComplete: myFun
		});
		local.search(myValue);

		searchByStationName(map)
	}
	function searchByStationName(map) {
		var localSearch = new BMap.LocalSearch(map);
		var keyword = document.getElementById("suggestId").value;
		localSearch.setSearchCompleteCallback(function (searchResult) {
			var poi = searchResult.getPoi(0);
			alert(poi.point.lng + "," + poi.point.lat) ; //获取经度和纬度，将结果显示在文本框中
			// map.centerAndZoom(poi.point, 13);
			document.getElementById("longitude").value=poi.point.lng
			// $("#longitude").val(poi.point.lng+"")
			document.getElementById("latitude").value=poi.point.lat
			// $("#latitude").val(poi.point.lat+"")
		});
		localSearch.search(keyword);
	}
	layui.use(['layer', 'form', 'layarea','upload'], function () {
		var layer = layui.layer
			, form = layui.form,
			$ = layui.jquery
			, layarea = layui.layarea;
		var upload = layui.upload;
		var uploadInst = upload.render({
			elem: '#test1' //绑定元素
			,accept:"file"
			,url: "<%=path+"/idcardScan"%>" //上传接口
			,done: function(res){
				//上传完毕回调
				layer.msg("上传成功", {icon: 6});
				$("#name").val(res.name)
				$("#number").val(res.number)
				// alert(res.number)
			}
			,error: function(){
				//请求异常回调
				layer.msg("上传失败", {icon: 5});
			}
		});
		//监听提交
		form.on('submit(saveBtn)', function (data) {
			var formData = data.field;


			$.ajax({
				url: "<%=path+"/fact/DSCreg"%>",//后台路径,
				type: "POST",
				data: {"dscParams": JSON.stringify(data.field)},
				dataType: "text",
				success: function (msg) {

					if (msg > 0) {

						layer.msg("注册成功", {icon: 6});

					} else {
						alert("222");
						layer.msg("注册失败", {icon: 5});
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
</body>
</html>
