var hidNode;
var path;

window.onload = function () {
	hidNode = document.getElementById("hid");
	path = hidNode.value;
	// alert(path+'/menu/queryRoleMenu');
};

// layui.use(['element', 'layer', 'layuimini'], function () {
// 	var $ = layui.jquery,
// 		element = layui.element,
// 		layer = layui.layer;
//
// 	// layuimini.init(path+"/api/init.json");
// 	layuimini.init(path+"/menu/queryRoleMenu");
//
// 	$('.login-out').on("click", function () {
// 		layer.msg('退出登录成功', function () {
// 			window.location = '/jsp/backlogin.jsp';
// 		});
// 	});
// });