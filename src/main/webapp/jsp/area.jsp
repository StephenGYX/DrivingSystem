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
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>驾校注册页面</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="<%=path+"/lib/layui-v2.5.5/css/layui.css"%>" media="all">
	<link rel="stylesheet" href="<%=path+"/css/public.css"%>" media="all">

	<script type="text/javascript" src="//api.map.baidu.com/api?v=2.0&ak=qndpvrYqRPHWaspKTGpZcuN2l3FudVgh"></script>
	<%--	<script src="<%=path+"/lib/layer/layer.js"%>"></script>--%>
</head>

<body>

<div class="layuimini-container">
	<div class="layuimini-main">
		<input type="hidden" name="xingwei" id="xingwei" value="zhengchang">

		<form class="layui-form" action="" style="padding:20px;" method="post">

			<input name="longitude" id="longitude" type="hidden">
			<input name="latitude" id="latitude" type="hidden">
			<div class="layui-form layuimini-form" style="margin-left: 80px;margin-bottom: 20px">

				<%--			<button type="button" class="layui-btn" id="test1">--%>
				<%--				<i class="layui-icon">&#xe67c;</i>身份证正面上传--%>
				<%--			</button>--%>
				<%--				<button type="button" class="layui-btn" id="test2">--%>
				<%--					<i class="layui-icon">&#xe67c;</i>身份证反面上传--%>
				<%--				</button>--%>

			</div>
			<div class="layui-form layuimini-form">
				<div class="layui-form-item">
					<label class="layui-form-label required">用户名</label>
					<div class="layui-input-inline">
						<input type="text" name="daccount" lay-verify="required|username"
						       placeholder="请输入用户名" value="" class="layui-input" id="account" onblur="queryaccount()">
						<tip>填写驾校账号信息，该账号具有唯一性。</tip>
						<br>
						<tip id="tip2" value="1"></tip>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label required">联系人姓名</label>
					<div class="layui-input-inline">
						<input type="text" id="name" name="dcontacts" lay-verify="required" lay-reqtext="联系人不能为空"
						       placeholder="请输入联系人姓名" value="" class="layui-input">
						<tip>填写驾校负责人真实姓名。</tip>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label required">身份证号</label>
					<div class="layui-input-inline">
						<input type="text" id="number" name="idnumber" lay-verify="required|identity"
						       lay-reqtext="身份证号不能为空,且为15或18位"
						       placeholder="请输入联系人身份证号" value="" class="layui-input">
						<tip>填写驾校负责人身份证号。</tip>
					</div>
					<button type="button" class="layui-btn" id="test1">
						<i class="layui-icon">&#xe67c;</i>身份证正面上传
					</button>
					<div class="layui-upload-list">
						<img class="layui-upload-img" style="width: 150px;height: 150px;margin-left: -180px;

margin-top: 20px;" id="demo2"
						     src="">
					</div>
				</div>


				<div class="layui-form-item">
					<label class="layui-form-label required">密码</label>
					<div class="layui-input-inline">
						<input type="password" name="password" lay-verify="required|pass" placeholder="请输入驾校账号密码"
						       value=""
						       class="layui-input">
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
					<div class="layui-input-inline">
						<input type="number" name="phone" lay-verify="required|phone" lay-reqtext="手机不能为空"
						       placeholder="请输入手机"
						       value="" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">邮箱</label>
					<div class="layui-input-inline">
						<input type="email" name="email" lay-verify="email" lay-reqtext="请输入正确邮箱格式" placeholder="请输入邮箱"
						       value=""
						       class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label required">驾校名称</label>
					<div class="layui-input-inline">
						<input type="text" name="dname" id="dname" lay-verify="dname" placeholder="请输入驾校名称" value=""
						       class="layui-input"
						       onblur="querydname()">
						<tip id="tip3"></tip>
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
							<input class="layui-input" type="text" id="suggestId" value="百度" style="width:260px;"/>
						</div>
					</div>
				</div>
				<div id="l-map" class="layui-form-item" style="height: 300px;width: 90%;margin-left: 5%;"></div>

				<div id="searchResultPanel"
				     style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>

				<div class="layui-form-item">
					<label class="layui-form-label required">报名费用</label>
					<div class="layui-input-inline">
						<input type="number" name="cost" lay-verify="required|number" lay-reqtext="报名费用不能为空"
						       placeholder="报名最低价"
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
					<label class="layui-form-label">驾校资质图片</label>
					<div class="layui-upload-list">
						<img class="layui-upload-img" style="width: 150px;height: 150px;" id="demo3"
						     src="">
						<button type="button" class="layui-form-checked" id="test2">
							<i class="layui-icon">&#xe67c;</i>驾校资质证明
						</button>
					</div>
				</div>

				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="saveBtn">确认保存</button>
					</div>
				</div>
			</div>

			<div class="layui-upload">
				<button type="button" class="layui-btn" id="sureup" style="width: 200px;display: none">开始上传</button>
			</div>

			<input name="upstate" id="upstate" value="yanzheng" type="hidden">
		</form>


	</div>
</div>
<script src="<%=path+"/lib/jquery-3.4.1/jquery-3.4.1.min.js"%>" charset="utf-8"></script>

<script src="<%=path+"/lib/layui-v2.5.5/layui.js"%>" charset="utf-8"></script>
<script src=<%=path+"/js/lay-config.js?v=1.0.4"%> charset="utf-8"></script>
<script>
	// 百度地图API功能
	function G(id) {
		return document.getElementById(id);
	}

	var map = new BMap.Map("l-map");
	map.centerAndZoom("厦门市", 12);                   // 初始化地图,设置城市和地图级别。

	var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
		{
			"input": "suggestId"
			, "location": map
		});

	ac.addEventListener("onhighlight", function (e) {  //鼠标放在下拉列表上的事件
		var str = "";
		var _value = e.fromitem.value;
		var value = "";
		if (e.fromitem.index > -1) {
			value = _value.province + _value.city + _value.district + _value.street + _value.business;
		}
		str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

		value = "";
		if (e.toitem.index > -1) {
			_value = e.toitem.value;
			value = _value.province + _value.city + _value.district + _value.street + _value.business;
		}
		str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
		G("searchResultPanel").innerHTML = str;
	});

	var myValue;
	ac.addEventListener("onconfirm", function (e) {    //鼠标点击下拉列表后的事件
		var _value = e.item.value;
		myValue = _value.province + _value.city + _value.district + _value.street + _value.business;
		G("searchResultPanel").innerHTML = "onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;

		setPlace();
	});

	function setPlace() {
		map.clearOverlays();    //清除地图上所有覆盖物
		function myFun() {
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
			// map.centerAndZoom(poi.point, 13);
			document.getElementById("longitude").value = poi.point.lng
			// $("#longitude").val(poi.point.lng+"")
			document.getElementById("latitude").value = poi.point.lat
			// $("#latitude").val(poi.point.lat+"")
		});
		localSearch.search(keyword);
	}


	function queryaccount() {
		var daccount = $('#account').val();
		$.ajax({
			url: "<%=path+"/fact/queryaccount"%>",//后台路径,
			type: "POST",
			data: {"daccount": daccount},
			dataType: "text",
			success: function (msg) {
				// alert(msg);
				if (msg === '1') {


					$('#tip2').text("可注册");
					$('#tip2').val("1");
				} else {

					$('#tip2').text("账号已存在，不可注册"),
						$('#tip2').css("color", "red"),
						$('#tip2').val("2");
				}
			}

		});
	}


	function querydname() {
		var dname = $('#dname').val();
		$.ajax({
			url: "<%=path+"/fact/querydname"%>",//后台路径,
			type: "POST",
			data: {"dname": dname},
			dataType: "text",
			success: function (msg) {
				if (msg === '1') {


					$('#tip3').text("可注册");
					$('#tip3').val("1");
				} else {


					$('#tip3').text("驾校名已存在，不可注册"),
						$('#tip3').css("color", "red"),
						$('#tip3').val("2");
				}
			}

		});
	}


	layui.use(['layer', 'form', 'layarea', 'upload'], function () {
		var layer = layui.layer
			, form = layui.form,
			$ = layui.jquery
			, layarea = layui.layarea, layedit = layui.layedit;
		var upload = layui.upload;
		var upstate = $("#upstate").val();


		var uploadInst = upload.render({
			elem: '#test1' //绑定元素
			// ,accept:"file"
			, url: "<%=path+"/idcardScan"%>" //上传接口
			// , data: {
			// 	account: function () {
			// 		return $("#account").val();
			// 	}
			// }
			, auto: true //选择文件后不自动上传
			// , bindAction: '#sureup' //指向一个按钮触发上传
			, choose: function (obj) {
				obj.preview(function (index, file, result) {
					$('#demo2').attr('src', result) //图片链接（base64）
					// ,$('#demo3').attr('src', result); //图片链接（base64）

				});
			}

			, done: function (res) {
				var a = $("#upstate").val();
				//上传完毕回调
				layer.msg("上传成功", {icon: 6});
				$("#name").val(res.name);
				$("#number").val(res.number)
				// alert(res.number)
			}
			, error: function () {
				//请求异常回调
				layer.msg("上传失败", {icon: 5});
			}
		});


		var uploadtwo = upload.render({
			elem: '#test2' //绑定元素
			// ,accept:"file"
			, url: "<%=path+"/fact/dscregup"%>"
			//上传接口
			, auto: false //选择文件后不自动上传
			, bindAction: '#sureup' //指向一个按钮触发上传
			, data: {
				account: function () {
					return $("#account").val();
				}
			}
			, choose: function (obj) {
				obj.preview(function (index, file, result) {
					$('#demo3').attr('src', result); //图片链接（base64）
				});
			}

			, done: function (res) {
				//上传完毕回调
				layer.msg("资格证上传成功", {icon: 6});

			}
			, error: function () {
				//请求异常回调
				layer.msg("上传失败", {icon: 5});
			}
		});


		form.verify({
			username: function (value, item) { //value：表单的值、item：表单的DOM对象
				if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)) {
					return '用户名不能有特殊字符';
				}
				if (/(^\_)|(\__)|(\_+$)/.test(value)) {
					return '用户名首尾不能出现下划线\'_\'';
				}
				if (/^\d+\d+\d$/.test(value)) {
					return '用户名不能全为数字';
				}
			},
			dname: function (value, item) { //value：表单的值、item：表单的DOM对象
				if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)) {
					return '驾校名不能有特殊字符';
				}
				if (/(^\_)|(\__)|(\_+$)/.test(value)) {
					return '驾校名首尾不能出现下划线\'_\'';
				}
				if (/^\d+\d+\d$/.test(value)) {
					return '驾校名不能全为数字';
				}
			}


			, pass: [/^[\S]{6,12}$/, '密码必须6到12位，且不能出现空格']
			, content: function (value) {
				layedit.sync(editIndex);
			}
		});


		//监听提交
		form.on('submit(saveBtn)', function (data) {
			var formData = data.field;


			var tip2 = $("#tip2").val();
			var tip3 = $("#tip3").val();


			$("#upstate").val("sureup");
			if (tip2 === 2) {
				layer.msg("该账号已被注册");
				return false;
			}
			if (tip3 === 2) {
				layer.msg("该驾校名称已被使用");
				return false;
			}


			$.ajax({
				url: "<%=path+"/fact/DSCreg"%>",//后台路径,
				type: "POST",
				data: {"dscParams": JSON.stringify(data.field)},
				dataType: "text",
				success: function (msg) {

					if (msg > 0) {
						alert("注册成功");
						layer.msg("注册成功", {icon: 6});
						$('#sureup').click();
						// alert("seccond");

						// window.location.href="http://www.baidu.com";
						var xingwei = $("#xingwei").val();
						if (xingwei === "houtai") {
							// alert("进入判断");

							window.open("", "_top").close()
						} else {
							var url = window.location.href;
							if (url.indexOf("homepage") !== -1) {
								window.parent.location.href = "<%=path%>" + "/homepage/drivingSchool";
							} else {
								window.location.href = "<%=path%>" + "/jsp/frontlogin3.jsp";

							}
						}

					} else {
						// alert("222");
						alert("注册失败");
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

<script src="<%=path+"/lib/jquery-3.4.1/jquery-3.4.1.min.js"%>" charset="utf-8"></script>

<script>
	function selectinfo() {
		// alert("执行改变行为方法");
		$("#xingwei").val("houtai");
	}
</script>
</body>
</html>
