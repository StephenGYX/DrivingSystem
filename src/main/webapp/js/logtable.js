var hidNode;
var path;

window.onload = function () {
	hidNode = document.getElementById("hid");
	path = hidNode.value;
	// alert(path+"/file/filedownload.action");
};

layui.use('table', function () {
	var table = layui.table;

	table.render({
		elem: '#test'
		, url: path + '/log/logView'
		, title: '日志管理'
		, limit: 7
		, limits: ['7']
		, page: true
		, cols: [[
			{field: 'ltime', title: '操作时间', width: 170, unresize: false, align: 'center', fixed: 'left', sort: true}
			, {field: 'loperatorid', title: '操作人ID', width: 100, align: 'center' , unresize: false}
			, {
				field: 'lrole', title: '操作角色', width: 100, align: 'center', unresize: false, templet: function (obj) {
					switch (obj.lrole) {
						case 0:
							return "后台管理员";
						case 1:
							return "驾校";
						case 2:
							return "教练";
						case 3:
							return "学员";
					}
				}
			}
			, {field: 'ltype', title: '操作类型', width: 120, unresize: false}
			, {field: 'lbehavior', title: '操作名称', width: 120, unresize: false}
			, {field: 'lip', title: 'ip地址',align: 'center', width: 120, unresize: false}
			, {field: 'lmethod', title: '执行代码方法', width: 460, unresize: false}
		]]
	});

	//头工具栏事件
	table.on('toolbar(test)', function (obj) {
		var checkStatus = table.checkStatus(obj.config.id);
		switch (obj.event) {
			case 'getCheckData':
				var data = checkStatus.data;
				layer.alert(JSON.stringify(data));
				break;
			case 'getCheckLength':
				var data = checkStatus.data;
				layer.msg('选中了：' + data.length + ' 个');
				break;
			case 'isAll':
				layer.msg(checkStatus.isAll ? '全选' : '未全选');
				break;
			//自定义头工具栏右侧图标 - 提示
			case 'LAYTABLE_TIPS':
				layer.alert('这是工具栏右侧自定义的一个图标按钮');
				break;
		}
		;
	});

	//监听行工具事件
	table.on('tool(test)', function (obj) {
		var data = obj.data;
		var id = data.file_Id;
		var fileurl = data.file_Url;
		// console.log(data);

		if (obj.event === 'download') {
			// layer.msg(JSON.stringify(data));
			window.location.href=path+"/file/filedownload.action?fileid="+id;
		}
		else if (obj.event === 'pass') {
			layer.confirm('是否确认通过该文件审核？', function (index) {

				$.ajax({
					type:"post"
					// url:"UserServlet?methodName=dologin",
					,url:path+'/file/fileStatueChange.action'
					//预期服务器返回的数据类型;
					,datatype:"text"
					//从该js会发出到服务器的数据
					,data:{"id":id,"statue":1}
					//从servlet接收的数据
					,success:function (msg) {
						if(msg===1){
							layer.msg("修改成功！");
							obj.update({
								file_Statue:"1"
							})
						}else {
							layer.msg("修改失败！")
						}
					}
					,error:function () {
						alert("服务器正忙.....");
					}
				});
				layer.close(index);
			});
		} else if (obj.event === 'nopass') {
			layer.confirm('是否确认不通过该文件审核？',function (index) {
				$.ajax({
					type:"post"
					// url:"UserServlet?methodName=dologin",
					,url:path+'/file/fileStatueChange.action'
					//预期服务器返回的数据类型;
					,datatype:"text"
					//从该js会发出到服务器的数据
					,data:{"id":id,"statue":2}
					//从servlet接收的数据
					,success:function (msg) {
						if(msg===1){
							layer.msg("修改成功！");
							obj.update({
								file_Statue:"2"
							})
						}else {
							layer.msg("修改失败！")
						}
					}
					,error:function () {
						alert("服务器正忙.....");
					}
				});
				layer.close(index);
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
			, url: path + '/log/queryLogWithParam'//后台做模糊搜索接口路径
			, method: 'post'
		});
		return false;//false：阻止表单跳转  true：表单跳转
	});
});

