var hidNode;
var path;

window.onload = function () {
	hidNode = document.getElementById("hid");
	path = hidNode.value;
	// alert(path+'/back/backLogin');
};

//改变验证码事件
function changeImg() {
	var img = document.getElementById('codeimg');
	img.src = path + "/fact/getyzm?x=" + Math.floor(Math.random() * 100)
};

layui.use(['form'], function () {
	var form = layui.form,
		layer = layui.layer;

	// 登录过期的时候，跳出ifram框架
	if (top.location != self.location) top.location = self.location;

	// 粒子线条背景
	$(document).ready(function () {
		$('.layui-container').particleground({
			dotColor: '#5cbdaa',
			lineColor: '#5cbdaa'
		});
	});

	// 进行登录操作
	form.on('submit(login)', function (data) {
		var formData = data.field;
		var account = formData.account;
		var password = formData.password;
		var code = formData.code;

		if (formData.account === '') {
			layer.msg('用户名不能为空');
			return false;
		} else if (formData.password === '') {
			layer.msg('密码不能为空');
			return false;
		} else if (formData.captcha === '') {
			layer.msg('验证码不能为空');
			return false;
		} else {
			$.ajax({
				type: "post"
				, url: path + '/back/backLogin'
				//预期服务器返回的数据类型;
				, datatype: "text"
				//从该js会发出到服务器的数据
				, data: {"account": account, "password": password, "code": code}
				//从servlet接收的数据
				, success: function (msg) {
					if (msg === "1") {
						layer.msg('登录成功', function () {
							window.location = path + '/jsp/backmenu.jsp';
						});
					} else if (msg === "2") {
						layer.msg("账号或密码有误，请重新输入");
					} else if (msg === "3") {
						layer.msg("验证码错误，请重新输入");
					}
				}
				, error: function () {
					layer.alert("服务器正忙.....");
				}
			});
			return false;
		}
	});
});