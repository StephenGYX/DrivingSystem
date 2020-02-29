function showBigImage(e) {
	layer.open({
		type: 1,
		title: false,
		closeBtn: 0,
		shadeClose: true, //点击阴影关闭
		area: [$(e).width + 'px', $(e).height + 'px'], //宽高
		content: "<img src=" + $(e).attr('src') + " />"
	});
}