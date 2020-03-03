var hidNode;
var path;

window.onload = function () {
	hidNode = document.getElementById("hid");
	path = hidNode.value;
	// alert(path+"/file/filedownload.action");
};

layui.use(['table', 'jquery'], function () {
	var table = layui.table;
	var $ = layui.jquery;

	table.render({
		elem: '#test'
		, url: path + '/homepage/queryNewsList'
		, title: '新闻资讯管理'
		, limit: 7
		, limits: ['7']
		, page: true
		, cols: [[
			{field: 'jtime', title: '更新时间', width: 170, unresize: false, align: 'center', sort: true}
			, {
				field: 'jtype', title: '文章类型', width: 100, align: 'center', unresize: false, templet: function (obj) {
					switch (obj.jtype) {
						case 1:
							return "新闻资讯";
						case 2:
							return "考试攻略";
					}
				}
			}
			, {field: 'jtitle', title: '标题', width: 220, unresize: false}
			, {field: 'jabstract', title: '简介', width: 170, unresize: false}
			, {field: 'jtext', title: '正文', width: 170, unresize: false}
			, {field: 'jauthor', title: '作者', align: 'center', width: 80, unresize: false}
			, {field: 'jliulan', title: '浏览量', align: 'center', width: 80, unresize: false}
			, {
				field: 'jstatue', title: '文章状态', width: 100, align: 'center', unresize: false, templet: function (obj) {
					switch (obj.jstatue) {
						case 1:
							return "启用";
						case 2:
							return "禁用";
						case 3:
							return "已删除";
					}
				}
			}
			, {fixed: 'right', title: '操作', fixed: 'right', align: 'center', toolbar: '#barDemo', width: 250}
		]]
	});

	//监听行工具事件
	table.on('tool(test)', function (obj) {
		var data = obj.data;
		var id = data.jid;
		console.log(data);

		if (obj.event === 'enable') {
			layer.confirm('是否确认启用该文章？', function (index) {
				if (data.jstatue === 1) {
					layer.msg("该文章已被启用，请勿重复点击！");
				} else if (data.jstatue === 3) {
					layer.msg("该文章已被删除，无法启用！");
				} else {
					$.ajax({
						type: "post"
						, url: path + '/homepage/updateNewsStatue'
						//预期服务器返回的数据类型;
						, datatype: "text"
						//从该js会发出到服务器的数据
						, data: {"jid": id, "statue": 1}
						//从servlet接收的数据
						, success: function (msg) {
							if (msg === 1) {
								layer.msg("修改成功！");
								obj.update({
									jstatue: 1
								})
							} else {
								layer.msg("修改失败！")
							}
						}
						, error: function () {
							alert("服务器正忙.....");
						}
					});
				}
				layer.close(index);
			});
		} else if (obj.event === 'disable') {
			layer.confirm('是否确认禁用该文章？', function (index) {
				if (data.jstatue === 2) {
					layer.msg("该文章已被禁用，请勿重复点击！");
				} else if (data.jstatue === 3) {
					layer.msg("该文章已被删除，无法启用！");
				} else {
					$.ajax({
						type: "post"
						, url: path + '/homepage/updateNewsStatue'
						//预期服务器返回的数据类型;
						, datatype: "text"
						//从该js会发出到服务器的数据
						, data: {"jid": id, "statue": 2}
						//从servlet接收的数据
						, success: function (msg) {
							if (msg === 1) {
								layer.msg("修改成功！");
								obj.update({
									jstatue: 2
								})
							} else {
								layer.msg("修改失败！")
							}
						}
						, error: function () {
							alert("服务器正忙.....");
						}
					});
				}
				layer.close(index);
			});
		} else if (obj.event === 'delete') {
			layer.confirm('是否确认删除该文章？', function (index) {
				if (data.jstatue === 3) {
					layer.msg("该文章已被删除，请勿重复点击！");
				} else {
					$.ajax({
						type: "post"
						, url: path + '/homepage/updateNewsStatue'
						//预期服务器返回的数据类型;
						, datatype: "text"
						//从该js会发出到服务器的数据
						, data: {"jid": id, "statue": 3}
						//从servlet接收的数据
						, success: function (msg) {
							if (msg === 1) {
								layer.msg("修改成功！");
								obj.update({
									jstatue: 3
								})
							} else {
								layer.msg("修改失败！")
							}
						}
						, error: function () {
							alert("服务器正忙.....");
						}
					});
				}
				layer.close(index);
			});
		} else if (obj.event === 'edit') {
			layer.open({
				type: 2,
				area: ['90%', '90%'],
				title: false,
				offset: '20px',
				shadeClose: true,
				scrollbar: true,
				content: ['editdemo.jsp'],
				success: function (layero, index) {
					var iframe = window['layui-layer-iframe' + index];
					iframe.selectinfo(data);
				}
			});
		}
	});
});


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
			, url: path + '/homepage/queryNewsWithParam'//后台做模糊搜索接口路径
			, method: 'post'
		});
		return false;//false：阻止表单跳转  true：表单跳转
	});
});

