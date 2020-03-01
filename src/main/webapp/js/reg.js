

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
