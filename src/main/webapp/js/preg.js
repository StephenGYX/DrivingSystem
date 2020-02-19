

layui.use(['layer','form'],function(){
	var form=layui.form;
	form.on('submit(suu)', function(data) {
		alert(JSON.stringify(data.field))
		$.ajax({
			url: '/springboot/preg',
			method: 'post',
			data: JSON.stringify(data.field),
			dataType: 'text'
		});
	});
});
