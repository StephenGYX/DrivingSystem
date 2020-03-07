

layui.use(['layer','form'],function(){
	var form=layui.form;
	form.on('submit(suu)', function(data) {
		var username=$("#username").val();
		var password=$("#password").val()

		var password1=$("#password1").val()
		var phone=$("#phone").val();
		var age=$("#age").val();
		var name=$("#name").val();
		var idcard=$("#idcard").val();
		if(password!=password1){
			layer.msg('两次密码不一致',{icon: 2});
			return false;
		}else if(password.length>20||password1.length>20){
			layer.msg('密码长度超出限制',{icon: 2});
			return false;
		}else if(password.length<6){
			layer.msg('请输入六位以上密码', {icon: 2});
			return false;
		} else if(username.length>15){
			layer.msg('账号长度超出限制',{icon: 2});
			return false;
		}else if(phone.length>11||phone.length<11){
			layer.msg('手机号格式错误',{icon: 2});
			return false;
		}else if(age>99||age<1){
			layer.msg('请输入正确的年龄',{icon: 2});
			return false;
		}else if(name.length>8){
			layer.msg('名字长度超出限制',{icon: 2});
			return false;
		}else if(idcard.length>18||idcard.length<18){
			layer.msg('身份证格式错误',{icon: 2});
			return false;
		}else if($("#sex").is(':checked')==false&&$("#sex1").is(':checked')==false){
			layer.msg('请选择您的性别', {icon: 2});
			return false;
		}else{
			layer.msg('注册成功');
				$.ajax({
					url: '/springboot/reg',
					method: 'post',
					data: JSON.stringify(data.field),
					dataType: 'text'

				});

		}

	});
});
