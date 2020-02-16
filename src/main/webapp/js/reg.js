// function reg() {
// 	alert(1)
// 	$.ajax({
// 		type: "POST",
// 		url: "/ShareDemo/doreg.do",
// 		dataType: "text",
// 		data:{username:$("#username").val(),password:$("#password").val(),password1:$("#password1").val()},
//
// 		success:function (msg) {
//
// 			var l=JSON.parse(msg);
// 			if(l.msg==="注册成功"){
// 				alert("注册成功")
// 			}else if(l.msg==="两次密码不一致"){
// 				alert("两次密码不一致")
//
// 			}else if(l.msg==="您输入的信息不符合要求，请核对后再试"){
// 				alert("您输入的信息不符合要求，请核对后再试")
// 			}else if(l.msg==="账号已存在"){
// 				alert("账号已存在")
// 			}
// 		}
// 	});
// }


layui.use(['layer','form'],function(){
	var form=layui.form;
	form.on('submit(suu)', function(data) {
		$.ajax({
			url: '/springboot/reg',
			method: 'post',
			data: JSON.stringify(data.field),
			dataType: 'text'


		});
	});
});
