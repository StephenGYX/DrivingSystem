var hidNode;
var path;

window.onload = function () {
	hidNode = document.getElementById("hid");
	path = hidNode.value;
	// alert(path+'/menu/queryRoleMenu');
};

// setting是初始化ztree的组件
var setting = {
	check: {
		enable: true
	},
	data: {
		simpleData: {
			enable: true,
			idKey: "id",//节点的id
			pIdKey: "pid",//节点的父节点id
			rootPId: 0
		}
	},
};



// 页面加载后马上获取后台数据
$(document).ready(function () {
	var rid = $("#role").val();

	$.ajax({
		url: path + "/menu/initMenuChange",
		data: {"rid":rid},
		type: "post",
		dataType: "json",
		success: function (data) {

			//获取数据并且初始化树节点
			var zNodes=eval(data);
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);

			// 展开全部节点
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			treeObj.expandAll(true);

			//循环遍历数据，并且将checked的数据勾选
			for (var i = 0; i < data.length ; i++) {
				if(data[i].checked === "1"){
					// 回显选中的数据　　　
					treeObj.checkNode(treeObj.getNodeByParam("id", data[i].id), true);
				}
			}
		}
	});

	//多条件查询
	layui.use(['layer', 'form'], function () {
		var layer = layui.layer //弹层
			, form = layui.form //form表单

		//绑定的按钮是submit 监听提交 lay-filter="search"
		form.on('submit(demo1)', function (data) {
			var rid = data.field.role;

			//获取所有选中的节点
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			var nodes = treeObj.getChangeCheckedNodes();
			var arrayObj = [];
			for (var i = 0; i < nodes.length ; i++) {
				arrayObj.push(nodes[i].id)
			}

			$.ajax({
				url: path + "/menu/changeMenu",
				data: {"rid":rid,"checkList":JSON.stringify(arrayObj)},
				type: "post",
				dataType: "json",
				traditional: true,
				success: function (data) {
					if(data===1){
						layer.msg("修改成功！")
					}else {
						layer.msg("修改失败！")
					}
				}
				,error:function () {
					layer.alert("服务器正忙.....");
				}
			});
			return false;//false：阻止表单跳转  true：表单跳转
		});


		//绑定的按钮是select 监听提交 lay-filter="search"
		form.on('select(rolemenu)', function (data) {
			var rid = $("#role").val();

			$.ajax({
				url: path + "/menu/initMenuChange",
				data: {"rid":rid},
				type: "post",
				dataType: "json",
				success: function (data) {

					//获取数据并且初始化树节点
					var zNodes=eval(data);
					$.fn.zTree.init($("#treeDemo"), setting, zNodes);

					// 展开全部节点
					var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
					treeObj.expandAll(true);

					//循环遍历数据，并且将checked的数据勾选
					for (var i = 0; i < data.length ; i++) {
						if(data[i].checked === "1"){
							// 回显选中的数据　　　
							treeObj.checkNode(treeObj.getNodeByParam("id", data[i].id), true);
						}
					}
				}
			});
		});
	});
});



