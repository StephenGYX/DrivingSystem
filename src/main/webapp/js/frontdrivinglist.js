var hidNode;
var path;

window.onload = function () {
	hidNode = document.getElementById("hid");
	path = hidNode.value;
	// alert(path+"/file/filedownload.action");
};

//多条件查询
layui.use(['table', 'layer', 'form', 'laypage', 'jquery','laydate'], function () {
	var table = layui.table //表格
		, layer = layui.layer //弹层
		, form = layui.form //form表单
		,$ = layui.jquery;

	//绑定的按钮是submit 监听提交 lay-filter="search"
	form.on('submit(demo1)', function (data) {
		var formData = data.field;
		var province = formData.province;
		var city = formData.city;
		var county = formData.county;

		// console.log(formData);
		// $.ajax({
		// 	type: "post"
		// 	, url: path + '/dSchool/queryqianDSC'
		// 	//预期服务器返回的数据类型;
		// 	, datatype: "json"
		// 	//从该js会发出到服务器的数据
		// 	, data: {"province": province, "city": city, "county": county}
		// 	//从servlet接收的数据
		// 	, success: function (msg) {
		// 	}
		// 	, error: function () {
		// 		layer.alert("服务器正忙.....");
		// 	}
		// });
		return true;//false：阻止表单跳转  true：表单跳转
	});
});