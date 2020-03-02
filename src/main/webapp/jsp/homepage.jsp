<%--
  Created by IntelliJ IDEA.
  User: lsl
  Date: 2019/12/25
  Time: 5:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String Path = application.getContextPath();

%><%@ page  isELIgnored = "false" %>
<html>
<head>
	<meta charset="utf-8">
	<title>Title</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href=<%=Path+"/lib/layui-v2.5.5/css/layui.css"%>>
	<link rel="stylesheet" href="<%=Path+"/lib/lay-module/step-lay/step.css"%>" media="all">
	<script src=<%=Path+"/lib/layui-v2.5.5/layui.js"%>></script>
	<script type="text/javascript" src=<%=Path+"/lib/jquery-3.4.1/jquery-3.4.1.min.js"%>></script>
	<script type="text/javascript" src=<%=Path+"/js/json2.js"%>></script>
	<script src=<%=Path+"/js/lay-config.js?v=1.0.4"%> charset="utf-8"></script>
</head>
<body>

<script type="text/html" id="bar">
	<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i
			class="layui-icon layui-icon-edit"></i>编辑</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i
			class="layui-icon layui-icon-delete"></i>删除</a>
	</script>
<!-- 增加搜索条件 -->
<div class="demoTable">
	搜索车牌：
	<div class="layui-inline">
		<input class="layui-input" name="id" id="demoReload" autocomplete="off">
	</div>
	搜索品牌：
	<div class="layui-inline">
		<input class="layui-input" name="id" id="brand" autocomplete="off">
	</div>
	搜索型号：
	<div class="layui-inline">
		<input class="layui-input" name="id" id="model" autocomplete="off">
	</div>
	<button class="layui-btn" data-type="reload" >搜索</button>

</div>
<button id="pro" type="button" class="layui-btn layui-btn-normal">新增车辆</button>
<table class="layui-hide" id="test"  lay-filter="test"></table>

<div id="demo11"></div>
<script>
	var json;

	layui.use('table', function(){
		var table = layui.table;

		//第一个实例
		table.render({
			elem: '#test'
			,height: 272
			,url: '/springboot/table' //数据接口
			,parseData:function (res1) {
				return{
					"code":0,
					"msg":0,
					"count":res1.count,
					"data":res1.data
				}
			}

			,cols: [[ //表头
				{field: 'vcarnum', title: '车牌', width:160, sort: true, fixed: 'left'}
				,
				{fixed: 'vphoto',
					title: '图片',width:80,templet: function (d) {
						return '<div ><img src="'+d.vphoto+'"  width="50px" height="50px" onclick="showBigImage(this)"></a></div>';
					}
				},
				{field: 'vmodel', title: '型号', width:80
				},
				{field: 'vcoordinate', title: '坐标', width:80
				},
				{field: 'vdrivingid', title: '驾校', width:80
				},
				{field: 'vcarstate', title: '状态', width: 80
				},
				{field: 'vbrand', title: '品牌', width:80
				},
				{fixed: 'right',title: '操作', width:160,toolbar:"#bar"
				}


			]],


			page: true,
			limit:5

		});




		table.on('tool(test)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
			var data = obj.data; //获得当前行数据
			var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
			var row_data = data,
			vid = row_data.vid;
			json = JSON.stringify(data);

			if (layEvent === 'del') { //删除
				console.log("删除");
				var a=confirm("确定要删除该车辆吗？删除后不可恢复");
				if(a===true){
					$.ajax({
						url: '/springboot/del',
						method: 'post',
						data: {"vid":vid},
						dataType: 'text'
					});
					//执行重载
					table.reload('test', {
						page: {
							curr: 1 //重新从第 1 页开始
						}
						,where: {	}
					}, 'data');
					layer.msg('删除成功')
					// setTimeout( function(){
					// 	window.parent.location.reload();
					// }, 2000 );//延迟两秒
				}
			} else if (layEvent === 'edit') { //编辑
				var row_data = data,
					vid = row_data.vid
				layer.open({
					maxmin: true,
					type: 2,
					offset:'20px',
					title: '修改车辆信息',
					content:['/springboot/jsp/backupdate.jsp','no'] ,//不允许出现滚动条
					area:['600px', '400px']
				});
			}
			});

	var $ = layui.$, active = {
		reload: function(){
			if($("#demoReload").val()==""&&$("#brand").val()==""&&$("#model").val()==""){
				window.parent.location.reload();
			}else if($("#demoReload").val()!=""){
				//执行重载
				table.reload('test', {
					page: {
						curr: 1 //重新从第 1 页开始
					}
					,where: {	demoReload:$("#demoReload").val()}
					,url:'/springboot/search'
				}, 'data');
			}else if($("#brand").val()!=""){
				//执行重载
				table.reload('test', {
					page: {
						curr: 1 //重新从第 1 页开始
					}
					,where: {	brand:$("#brand").val()}
					,url:'/springboot/searchbrand'
				}, 'data');
			}else if($("#model").val()!=""){
				//执行重载
				table.reload('test', {
					page: {
						curr: 1 //重新从第 1 页开始
					}
					,where: {	model:$("#model").val()}
					,url:'/springboot/searchmodel'
				}, 'data');
			}
		}
	};

	$('.demoTable .layui-btn').on('click', function(){
		var type = $(this).data('type');
		active[type] ? active[type].call(this) : '';
	});


	});

</script>

<script type="text/javascript">

	$('#pro').on('click',function(){
		layui.use('layer', function() {
			var layer = layui.layer;
			layer.open({
				type: 2,
				offset:'20px',
				title: '新增车辆',
				content:['/springboot/jsp/backadd.jsp','no'] ,//不允许出现滚动条
				area:['900px', '700px']
			});
		});
	})
</script>
<script>
	function showBigImage(e) {
		layer.open({
			type: 1,
			title: false,
			offset:'40px',
			closeBtn: 0,
			shadeClose: true, //点击阴影关闭
			area: [$(e).width+ 'px', $(e).height + 'px'], //宽高
		content: "<img src=" + $(e).attr('src') + " />"
	});
	}
</script>

</body>
</html>
