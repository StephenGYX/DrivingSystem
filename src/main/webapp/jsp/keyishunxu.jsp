<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/15
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path=application.getContextPath();
	String csspath = application.getContextPath()+"/css/";
	String jspath =  application.getContextPath()+"/js/";

%>
<html>
<head>
	<title>Title</title>
	<script  src=<%=jspath+"jquery-3.4.1.js" %>></script>

	<link rel="stylesheet" href=<%=csspath+"style.css"%> >

</head>
<body>

<input type="hidden" id="kaoti_input" value="${kaoti}">
<div id="content" class="content">
	<div class="left l">
		<fieldset>
			<legend>驾驶员考试</legend>
			<span>第 1 考台</span>
		</fieldset>
		<div class="h8"></div>
		<fieldset>
			<legend>考生信息</legend>

			<p>考生姓名：英格<br>
				性　　别：男<br>
				考试科目：科目一<br>
				考试车型：C1、C2<br>
				考试原因：初次申领<br>
			</p>
		</fieldset>
		<div class="h8"></div>
		<fieldset>
			<legend>输入题号跳转</legend>
			<div id="viewtime">到 <input name="numflag" id="numflag" type="text" style="border: 1px solid rgb(238, 102, 0); width: 30px; height: 20px;" onkeyup="tonumans();"> 题</div>
		</fieldset>
	</div>
	<div class="centerlx l">
		<fieldset>
			<legend>看题模式共计 <font id="id_count"><b>1315</b> </font> 题 按题目顺序直接显示答案</legend>
			<div class="st">
				<p class="title"><font id="id_qus"><b id="numshow">1</b> </font></p>
				<p id="id_ans1"></p>
				<p id="id_ans2"></p>
				<p id="id_ans3"></p>
				<p id="id_ans4"></p>
			</div>
			<div class="kt" id="id_ans">正确答案是： <font size="5" color="red"><b id="answershow"></b></font>  本题解释</div>
		</fieldset>
		<div class="h8"></div>
		<dl>
			<dt>
				<fieldset>
					<legend>提示信息</legend>
					<div><select id="id_config" name="id_config" onchange="configflag();">
						<option value="1">自动</option>
						<option value="2">手动</option>
					</select> 跳转下一题 | 本功能需练习5小时 | 当前为<font color="#FF0000;">C1\C2小车</font>题库 <select name="select" style="width:90px;font-size:12px;" language="javascript" onchange="location.href=this.value ">
						<option selected="selected">可切换题库</option>
						<option value="http://km1.jsyst.cn/b/kt/">A2\B2货车</option>
						<option value="http://km1.jsyst.cn/a/kt/">A1\B1\A3客车</option>
					</select></div>
				</fieldset>
			</dt>
			<dd><a href="javascript:p();"><img src="http://image.jsyst.cn/jiaxiao/km/pre.gif" border="0"></a> <a href="javascript:n();"><img src="http://image.jsyst.cn/jiaxiao/km/next.gif" border="0"></a></dd></dl>
	</div>
	<div class="clear"></div>
	<div class="h8"></div>
	<fieldset>
		<legend>考试图片信息</legend>
		<div id="id_bmp" style="padding-right:20px;"><img src="http://image.jsyst.cn/images201305/picture_2.jpg" border="0"></div>
	</fieldset>
	<div class="clear"></div>
</div>
<script  src=<%=jspath+"keyishunxu.js" %>></script>
<script>
	var kaotis = '${kaoti}';
	var list=JSON.parse(kaotis);
	console.log(list[0].icontent)
</script>
</body>

</html>
