var hidNode;
var path;

window.onload = function () {
	hidNode = document.getElementById("hid");
	path = hidNode.value;
	// alert(path+"/file/filedownload.action");
};

//多条件查询
layui.use(['table', 'layer', 'form', 'laypage', 'laydate'], function () {
	var table = layui.table //表格
		, layer = layui.layer //弹层
		, form = layui.form //form表单

	//绑定的按钮是submit 监听提交 lay-filter="search"
	form.on('submit(demo1)', function (data) {
		var formData = data.field;
		console.log(formData);

		//执行重载
		table.reload('test', {
			page: {
				curr: 1 //重新从第 1 页开始
			}
			, where: formData
			, url: path + '/log/queryLogWithParam'//后台做模糊搜索接口路径
			, method: 'post'
		});
		return false;//false：阻止表单跳转  true：表单跳转
	});
});