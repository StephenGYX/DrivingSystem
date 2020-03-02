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

		return true;//false：阻止表单跳转  true：表单跳转
	});

	// 跳转驾校页面
	function showDrivingSchool() {
		console.log("点击事件进来了！");
		// console.log(formData);

	}
});

