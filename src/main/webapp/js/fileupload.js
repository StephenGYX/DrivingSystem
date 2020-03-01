var hidNode;
var path;

window.onload = function () {
	hidNode = document.getElementById("hid");
	path = hidNode.value;
	alert(path+'/homepage/updateButtonLink');
};

layui.use(['upload','layer','form'], function() {
	var $ = layui.jquery
		, upload = layui.upload
		, layer = layui.layer
		, form = layui.form;

	//选完文件后不自动上传
	upload.render({
		elem: '#test8'
		,url: path+'/buttonlink/updateButtonLink' //改成您自己的上传接口
		,accept:'file'
		,auto: false
		,data:{
			fixedphone:function () {
				return $('#fixedphone').val();
			},
			worktime:function () {
				return $('#worktime').val();
			},
			workaddress:function () {
				return $('#workaddress').val();
			},
			mobilephone:function () {
				return $('#mobilephone').val();
			},
			workemail:function () {
				return $('#workemail').val();
			},
			workQQ:function () {
				return $('#workQQ').val();
			}
		}
		,multiple: false
		,bindAction: '#test9'
		,choose:function (obj) {
			obj.preview(function(index, file, result){
				$('#demo2').attr('src', result); //图片链接（base64）
			});
		}
		,before: function(obj){ //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
			layer.load(); //上传loading
		}
		,done: function(res, index, upload){
			if(res.code == 0){
				alert("上传成功");
			}
			layer.closeAll('loading'); //关闭loading
		}
		,error: function(index, upload){
			layer.closeAll('loading'); //关闭loading
		}
	});

	//监听提交
	form.on('submit(demo1)', function(data){
		$('#test9').click();
		return false;
	});
});