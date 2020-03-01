<%--
Created by IntelliJ IDEA.
User: Stephen
Date: 2020/2/14
Time: 17:58
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = application.getContextPath();
	String roleid = session.getAttribute("roleid") + "";
%>
<html>
<head>
	<meta charset="utf-8">
	<title>驾校报名页面</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="<%=path+"/lib/layui-v2.5.5/css/layui.css"%>" media="all">
	<link rel="stylesheet" href="<%=path+"/css/public.css"%>" media="all">
	<link rel="stylesheet" href=<%=path+"/lib/jq-module/zyupload/zyupload-1.0.0.min.css"%> media="all">


</head>

<body>

<div class="layuimini-container">
	<div class="layuimini-main">

		<form class="layui-form" action="" style="padding:20px;" method="post">


			<div class="layui-form layuimini-form">
				<div class="layui-form-item">
					<label class="layui-form-label required">课程名</label>
					<div class="layui-input-inline">
						<select name="kname" id="kname" lay-filter="kname">
							<option name="kname" value="${kecheng.kname}">${kecheng.kname}</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label required">课程类型</label>
					<div class="layui-input-inline">
						<select name="kjiazhaoleixing" id="kjiazhaoleixing" lay-filter="kjiazhaoleixing">
							<option name="kjiazhaoleixing" value="${kecheng.kjiazhaoleixing}">${kecheng.kjiazhaoleixing}</option>
						</select>
					</div>
				</div>


				<div class="layui-form-item">
					<label class="layui-form-label required">课程时间段</label>
					<div class="layui-input-inline">
						<select name="kshijianduan" id="kshijianduan" lay-filter="kshijianduan">
							<option name="kshijianduan" value="${kecheng.kshijianduan}">${kecheng.kshijianduan}</option>
						</select>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label required">价格</label>
					<div class="layui-input-inline">
						<select name="kprice" id="kprice" lay-filter="kprice">
							<option name="kprice" value="${kecheng.kprice}">${kecheng.kprice}</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">备注</label>
					<div class="layui-input-inline">
						<select name="beizhu" id="beizhu" lay-filter="beizhu">
							<option name="beizhu" value="${kecheng.beizhu}">${kecheng.beizhu}</option>
						</select>
					</div>
				</div>
<%--				<div class="layui-form-item">--%>
<%--					<label class="layui-form-label">驾校名称</label>--%>
<%--					<div class="layui-input-inline">--%>
<%--						<select name="kname" id="kname" lay-filter="kname">--%>
<%--							<option value=${kecheng.kname}>${kecheng.kname}</option>--%>
<%--						</select>--%>
<%--					</div>--%>
<%--				</div>--%>


                 <input type="hidden" name="cid" value="${requestScope.cid}">
				 <input type="hidden" name="did" value="${kecheng.did}">
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="saveBtn" id="test2">确认报名</button>
					</div>
				</div>
			</div>



		</form>

	</div>
</div>
<script src="<%=path+"/lib/jquery-3.4.1/jquery-3.4.1.min.js"%>" charset="utf-8"></script>
<script src="<%=path+"/lib/jq-module/zyupload/zyupload-1.0.0.min.js"%>" charset="utf-8"></script>
<script src="<%=path+"/lib/layui-v2.5.5/layui.js"%>" charset="utf-8"></script>
<script src=<%=path+"/js/lay-config.js?v=1.0.4"%> charset="utf-8"></script>
<script>
	layui.use(['layer', 'form', 'layarea','upload'], function () {
		var layer = layui.layer
			, form = layui.form,
			$ = layui.jquery
			, layarea = layui.layarea
			,upload=layui.upload;
		//监听提交
		form.on('submit(saveBtn)', function (data) {
			var formData = data.field;


			$.ajax({
				url: "<%=path+"/schoolInfo/baoMingSure"%>",//后台路径,
				type: "POST",
				data: {"baoMingParam": JSON.stringify(data.field)},
				dataType: "text",
				success: function (msg) {
                 alert(msg);
					if (msg > 0) {

						layer.msg("报名成功！");



					} else {

						layer.msg("报名失败！");
					}
				}

			});




			return false;
		});
		// layarea.render({
		// 	elem: '#area-picker',
		//
		// });

		<%--//多图片上传--%>
		<%--upload.render({--%>
		<%--	elem: '#test1'--%>
		<%--	,url: "<%=path+"/fact/upload"%>" //改成您自己的上传接口--%>
		<%--	,multiple: true--%>
		<%--	,auto: false //选择文件后不自动上传--%>
		<%--	,bindAction: '#test2' //指向一个按钮触发上传--%>
		<%--	,number:3--%>
		<%--	, choose: function (obj) {--%>
		<%--		$('#demo2').height(180);--%>
		<%--		//将每次选择的文件追加到文件队列--%>
		<%--		var files = obj.pushFile();--%>
		<%--		//预读本地文件，如果是多文件，则会遍历。(不支持ie8/9)--%>
		<%--		obj.preview(function (index, file, result) {--%>
		<%--	             var fileshu=$('#demo2').find('img').length;--%>
		<%--			if (file.size > 0 && fileshu === 0) {--%>
		<%--				$('#demo2').empty();--%>
		<%--			}--%>
		<%--			// if (fileshu)--%>
		<%--			// 添加图片 demo2-预览的dom元素的id--%>
		<%--			$('#demo2').append(--%>
		<%--				'<div  id="container'+index+'" style="margin-top: -12px;float: left;padding-top: 10px"><div class="layui-btn-container">'+--%>
		<%--				'<button id="upload_img_'+index+'" class="layui-btn layui-btn-danger layui-btn<-xs">删除</button></div>' +--%>

		<%--				'<img id="showImg'+index+'" style="width: 150px; margin:10px;cursor:pointer" src="'+ result +'" alt="' + file.name + '"></div>'--%>
		<%--				// '<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">'--%>
		<%--			);--%>
		<%--			//删除某图片--%>
		<%--			$("#upload_img_" + index).bind('click', function () {--%>
		<%--				delete files[index];--%>
		<%--				$("#container"+index).remove();--%>
		<%--			});--%>

		<%--			//某图片放大预览--%>
		<%--			$("#showImg"+index).bind('click',function () {--%>
		<%--				var width = $("#showImg"+index).width();--%>
		<%--				var height = $("#showImg"+index).height();--%>
		<%--				var scaleWH = width/height;--%>
		<%--				var bigH = 600;--%>
		<%--				var bigW = scaleWH*bigH;--%>
		<%--				if(bigW>900){--%>
		<%--					bigW = 900;--%>
		<%--					bigH = bigW/scaleWH;--%>
		<%--				}--%>

		<%--				// 放大预览图片--%>
		<%--				layer.open({--%>
		<%--					type: 1,--%>
		<%--					title: false,--%>
		<%--					closeBtn: 1,--%>
		<%--					shadeClose: true,--%>
		<%--					area: [bigW + 'px', bigH + 'px'], //宽高--%>
		<%--					content: "<img width='"+bigW+"' height='"+bigH+"' src=" + result + " />"--%>
		<%--				});--%>
		<%--			});--%>

		<%--		})},--%>

		<%--	done: function(res){--%>
		<%--		//上传完毕--%>
		<%--	}--%>
		<%--});--%>


	});
</script>

<script type="text/javascript">

	function selectinfo(data) {

// 		daccount: "8456231"
// ​
// daccountstate: "1"
// ​
// daddress: "具体住址"
// ​
// darea: "晋江"
// ​
// dcity: "泉州"
// ​
// dcontacts: "李四"
// ​
// demail: "841126293@qq.com"
// ​
// denrollnum: 0
// ​
// devaluatescore: 3
// ​
// dgraduationnum: 0
// ​
// did: 5
// ​
// dname: "第四家"
// ​
// dpassword: "888888"
// ​
// dphone: 2147483647
// ​
// dprice: 2020
// ​
// dprovince: "福建"
// ​
// drecruit: null
// ​
// drecruitstate: "1"
// ​
// dregtime: null
// ​
// dremark1: null
// ​
// dremark2: null
// ​
// dschoolimage: "images/ds.jpg"
// ​
// dsynopsis: "这是概要四"
// ​
// dtelephone: 2147483647
// ​
// rid: 0


		console.log(data);

		$("#dcontacts").val(data.dcontacts);
		$("#username").val(data.daccount);
		$("#did").val(data.did);

		$("#dprovince").attr("data-value",data.dprovince);
		$("#dcity").attr("data-value",data.dcity);
		$("#darea").attr("data-value",data.darea);

		$("#dsynopsis").text(data.dsynopsis);
		$("#dprice").val(data.dprice);
		$("#dpassword").val(data.dpassword);
		$("#demail").val(data.demail);
		$("#dname").val(data.dname);
		$("#dphone").val(data.dphone);

		// layui.use(['layer', 'form', 'layarea','upload'], function () {
		// 	var layarea = layui.layarea;
		// layarea.render({
		// 	elem: '#area-picker',
		// 	data: {
		// 	    province: data.dprovince,
		// 	    city: data.dcity,
		// 	    // county: '龙岗区',
		// 	},
		// });
		// });
	}
</script>
</body>
</html>
