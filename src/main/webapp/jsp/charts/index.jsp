<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%    String path = application.getContextPath();%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"><html><head><title>统计报表</title><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><link href="images/style.css" rel="stylesheet" type="text/css"></head><body bgcolor="#FFFFFF"><%--    <p><img src= /></p>--%>    <iframe src=<%=path%>/jsp/charts/newStudentByTimeEchars.jsp style="height:700px; width:100%"></iframe>    <iframe src=<%=path%>/charts/drivingSchoolCount style="height:700px; width:49%"></iframe>    <iframe src="<%=path%>/charts/querySchoolPrice" style="height:700px; width:49%"></iframe>    <iframe src="<%=path%>/jsp/backpotentialstudent.jsp" style="height:700px; width:49%"></iframe>    <iframe src="<%=path%>/jsp/backstudychart1.jsp" style="height:700px; width:49%"></iframe>    <iframe src="<%=path%>/jsp/backRegNumChart.jsp" style="height:700px; width:100%"></iframe>    <iframe src="<%=path%>/jsp/backstudychart2.jsp" style="height:700px; width:100%"></iframe><%--//泽茂--%><iframe src="<%=path%>/jsp/DSC/DschEchartsdemo2.jsp" style="height:700px; width:100%"></iframe><iframe src="<%=path%>/jsp/DSC/DschEchartsdemo3.jsp" style="height:700px; width:100%"></iframe><%--    <iframe src="<%=path%>/jsp/querySchoolPrice" style="height:700px; width:50%"></iframe>--%><%--    <iframe src="samples/pie3D.html" style="height:450px; width:100%"></iframe>--%><%--   <h3> 还有很多请在下载的demo查看</h3>--%></body></html>