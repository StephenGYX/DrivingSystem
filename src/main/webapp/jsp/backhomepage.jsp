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
	{{#  if(d.rid == 0){}}
	<b >-------- 不可修改 --------</b>
	{{#  } else if(d.rid==1&&d.bstate==1){ }}
	<a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="stop">禁用</a>

	<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i
			class="layui-icon layui-icon-edit"></i>重置密码</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i
			class="layui-icon layui-icon-delete"></i>删除</a>
	{{#  }else if(d.rid==1&&d.bstate==0){ }}
	<a class="layui-btn layui-btn-xs data-count-edit" lay-event="start">启用</a>
	<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i
			class="layui-icon layui-icon-edit"></i>重置密码</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i
			class="layui-icon layui-icon-delete"></i>删除</a>
	{{#  }else{ }}
	<b >-------- 已删除  --------</b>
	{{#  }
	}}
</script>
<!-- 增加搜索条件 -->
<div class="demoTable" style="margin-top: 30px;margin-left: 400px">
	搜索账号：
	<div class="layui-inline">
		<input class="layui-input" name="id" id="demoReload" autocomplete="off">
	</div>
	搜索名称：
	<div class="layui-inline">
		<input class="layui-input" name="id" id="brand" autocomplete="off">
	</div>
	<button class="layui-btn" data-type="reload" >搜索</button>

	<div class="layuimini-container" >
		<div class="layuimini-main">
			<div class="layui-form-item" id="area-picker" style="margin-left:-35px;margin-top: 10px">
				<div class="layui-form-label">搜索状态: </div>
				<div class="layui-input-inline" style="padding-top: 7px;">
					<select id="prov" name="province" class="province-selector"  lay-filter="province-1">
						<option value="3">请选择</option>
						<option value="0">禁用</option>
						<option value="1">启用</option>
						<option value="2">已删除</option>
					</select>
				</div>
			</div>
		</div>
	</div>

</div>
<button id="pro" type="button" class="layui-btn layui-btn-normal" style="margin-left: 20px;margin-top: 20px">新增管理员</button>
<table class="layui-hide" id="test"  lay-filter="test"></table>

<div id="demo11"></div>
<script>
	var json;

	layui.use('table', function(){
		var table = layui.table;

		//第一个实例
		table.render({
			elem: '#test'
			,height: 300
			,url: '/springboot/tableall' //数据接口
			,parseData:function (res) {
				return{
					"code":0,
					"msg":0,
					"count":res.count,
					"data":res.data
				}
			}

			,cols: [[ //表头
				{field: 'bid', title: 'id', width:160}
				,
				{field: 'baccount', title: '账号', width:160

				},
				{field: 'bname', title: '名称', width:160

				},
				{field: 'bstate', title: '状态', width:160,templet: function (item) {
						if(item.bstate=="1"){
							return "启用"
						}else if(item.bstate=="0"){
							return "禁用"
						}else if(item.bstate=="2"){
							return "已删除"
						}
					}
				},
				{field: 'rid', title: '账号角色', width:160, templet: function (item) {
						if(item.rid=="0"){
							return "超级管理员"
						}else if(item.rid=="1"){
							return "普通管理员"
						}
					}
				},
				{fixed: 'right',title: '操作', align:'center',width:300,toolbar:"#bar"
				}


			]],


			page: true,
			limit:5

		});



	//
		table.on('tool(test)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
			var data = obj.data; //获得当前行数据
			var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
			var row_data = data,
				//获取表格账号id
			bid = row_data.bid;

			// json = JSON.stringify(data);//传给父级
			if (layEvent === 'del') { //删除
				console.log("删除");
				var a=confirm("确定要删除账号"+row_data.baccount+ "吗？删除后不可恢复");
				if(a===true){
					$.ajax({
						url: '/springboot/backdel',
						method: 'post',
						data: {bid:bid},
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

				}
			} else if(layEvent==='stop'){
				var a=confirm("确定要禁用账号"+row_data.baccount+ "吗？");
				if(a===true){
					$.ajax({
						url: '/springboot/stop',
						method: 'post',
						data: {bid:bid},
						dataType: 'text'
					});
					//执行重载
					table.reload('test', {
						page: {
							curr: 1 //重新从第 1 页开始
						}
						,where: {	}
					}, 'data');
					layer.msg('禁用成功')

				}
			}else if(layEvent==='start') {
				var a = confirm("确定要启用账号" + row_data.baccount + "吗？");
				if (a === true) {
					$.ajax({
						url: '/springboot/start',
						method: 'post',
						data: {bid: bid},
						dataType: 'text'
					});
					//执行重载
					table.reload('test', {
						page: {
							curr: 1 //重新从第 1 页开始
						}
						, where: {}
					}, 'data');
					layer.msg('启用成功')

				}
			}else if(layEvent==='edit'){
				var a = confirm("确定要重置账号" + row_data.baccount + "的密码吗？");
				if (a === true) {
					$.ajax({
						url: '/springboot/edit',
						method: 'post',
						data: {bid: bid},
						dataType: 'text'
					});
					//执行重载
					table.reload('test', {
						page: {
							curr: 1 //重新从第 1 页开始
						}
						, where: {}
					}, 'data');
					layer.msg('重置成功,密码默认123456')

				}
			}
			});
	//
	var $ = layui.$, active = {
		reload: function(){
			if($("#demoReload").val()==""&&$("#brand").val()==""&&$("#prov").val()=='3'){
				window.parent.location.reload();
			}else if($("#demoReload").val()!=""){
				//执行重载
				table.reload('test', {
					page: {
						curr: 1 //重新从第 1 页开始
					}
					,where: {	bacc:$("#demoReload").val()}
					,url:'/springboot/backsearchacc'
				}, 'data');
			}else if($("#brand").val()!=""){
				//执行重载
				table.reload('test', {
					page: {
						curr: 1 //重新从第 1 页开始
					}
					,where: {	bname:$("#brand").val()}
					,url:'/springboot/backsearchname'
				}, 'data');
			}else if($("#prov").val()!="3"){
				//执行重载
				table.reload('test', {
					page: {
						curr: 1 //重新从第 1 页开始
					}
					,where: {	bstate:$("#prov").val()}
					,url:'/springboot/backsearchstate'
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
				title: '新增管理员',
				content:['/springboot/jsp/backadduser.jsp','no'] ,//不允许出现滚动条
				area:['900px', '400px']
			});
		});
	})
</script>


</body>
</html>
