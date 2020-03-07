layui.use(['table', 'jquery'], function () {
	var table = layui.table;
	var $ = layui.jquery;

	table.render({
		elem: '#test'
		, url: path + '/potential/potentialView'
		, title: '潜在客户咨询'
		, limit: 7
		, limits: ['7']
		, page: true
		, cols: [[
			{field: 'gtime', title: '更新时间', width: 170, unresize: false, align: 'center', sort: true}
			, {
				field: 'gstate', title: '跟进状态', width: 130, align: 'center', unresize: false, templet: function (obj) {
					switch (obj.gstate) {
						case 1:
							return "有意向待沟通";
						case 2:
							return "有意向已沟通";
						case 3:
							return "无意向购买";
						case 4:
							return "已成交";
						case 5:
							return "已删除";
					}
				}
			}
			, {field: 'gname', title: '姓名', width: 100, unresize: false}
			, {field: 'gphone', title: '电话', width: 150, unresize: false}
			, {field: 'gdesire', title: '需求意向', width: 280, unresize: false}
			, {fixed: 'right', title: '操作', fixed: 'right', align: 'center', toolbar: '#barDemo', width: 150}
		]]
	});

	//监听行工具事件
	table.on('tool(test)', function (obj) {
		var data = obj.data;
		var id = data.gid;
		console.log(data);

		if (obj.event === 'delete') {
			layer.confirm('是否确认删除该咨询客户？', function (index) {
				if (data.gstate === 5) {
					layer.msg("该咨询用户已被删除，请勿重复点击！");
				} else {
					$.ajax({
						type: "post"
						, url: path + '/potential/updatePotentialStatue'
						//预期服务器返回的数据类型;
						, datatype: "text"
						//从该js会发出到服务器的数据
						, data: {"gid": id, "gstate": 5}
						//从servlet接收的数据
						, success: function (msg) {
							if (msg === 1) {
								layer.msg("修改成功！");
								obj.update({
									gstate: 5
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
			if(data.gstate === 5){
				layer.msg("该咨询用户已被删除，无法编辑！");
			}else{
				layer.open({
					type: 2,
					area: ['90%', '90%'],
					title: false,
					offset: '20px',
					shadeClose: true,
					scrollbar: true,
					content: ['editpotential.jsp'],
					success: function (layero, index) {
						var iframe = window['layui-layer-iframe' + index];
						iframe.selectinfo(data);
					}
				});
			}
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
			, url: path + '/potential/queryPotentialWithParam'//后台做模糊搜索接口路径
			, method: 'post'
		});
		return false;//false：阻止表单跳转  true：表单跳转
	});
});

