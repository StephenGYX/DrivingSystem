<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = application.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>amCharts examples</title>
        <link rel="stylesheet" href="style.css" type="text/css">
        <link rel="stylesheet" href="<%=path+"/css/newStudentByTimeEchars.css"%>" type="text/css">

        <script src="<%=path+"/amchartsTool/amcharts/amcharts.js"%>" type="text/javascript"></script>
        <script src="<%=path+"/amchartsTool/amcharts/serial.js"%>" type="text/javascript"></script>

        <!-- scripts for exporting chart as an image -->
        <!-- Exporting to image works on all modern browsers except IE9 (IE10 works fine) -->
        <!-- Note, the exporting will work only if you view the file from web server -->
        <!--[if (!IE) | (gte IE 10)]> -->
        <script src="<%=path+"/amchartsTool/amcharts/exporting/amexport.js"%>" type="text/javascript"></script>
        <script src="<%=path+"/amchartsTool/amcharts/exporting/rgbcolor.js"%>" type="text/javascript"></script>
        <script src="<%=path+"/amchartsTool/amcharts/exporting/canvg.js"%>" type="text/javascript"></script>
        <script src="<%=path+"/amchartsTool/amcharts/exporting/jspdf.js"%>" type="text/javascript"></script>
        <script src="<%=path+"/amchartsTool/amcharts/exporting/filesaver.js"%>" type="text/javascript"></script>
        <script src="<%=path+"/amchartsTool/amcharts/exporting/jspdf.plugin.addimage.js"%>" type="text/javascript"></script>
        <script src="<%=path+"/js/newStudentByTimeEchars.js"%>" type="text/javascript"></script>
        <script src=<%=path+"/lib/layui-v2.5.5/layui.js"%>></script>
        <script type="text/javascript" src=<%=path+"/lib/jquery-3.4.1/jquery-3.4.1.min.js"%>></script>
        <script type="text/javascript" src=<%=path+"/js/json2.js"%>></script>
        <script src=<%=path+"/js/lay-config.js?v=1.0.4"%> charset="utf-8"></script>


        <!-- <![endif]-->

        <script type="text/javascript">

            function makechart(chartData) {
                var chart;

                <%-- chartData = [--%>

                <%--    <c:forEach items="${sessionScope.newStudent}" var="i" begin="0" varStatus="a">--%>
                <%--    {--%>
                <%--        "country": "${i.dname}",--%>
                <%--        "count": ${i.num} ,--%>
                <%--        "color": '#'+Math.floor(Math.random()*16777215).toString(16)--%>
                <%--    },--%>

                <%--    </c:forEach>--%>

                <%--];--%>


                var chart = AmCharts.makeChart("chartdiv", {
                    type: "serial",
                    dataProvider: chartData,
                    categoryField: "country",
                    depth3D: 50,//深入距离
                    angle: 35,//3D斜角

                    categoryAxis: {
                        labelRotation: 45,//字体的斜角
                        gridPosition: "start"
                    },

                    valueAxes: [{
                        title: "Visitors"
                    }],

                    graphs: [{

                        valueField: "count",
                        colorField: "color",
                        type: "column",
                        lineAlpha: 0,
                        fillAlphas: 1
                    }],

                    chartCursor: {
                        cursorAlpha: 0,
                        zoomable: false,
                        categoryBalloonEnabled: false
                    },

                    exportConfig: {
                        menuTop: "21px",
                        menuBottom: "auto",
                        menuRight: "21px",
                        backgroundColor: "#efefef",

                        menuItemStyle	: {
                            backgroundColor			: '#EFEFEF',
                            rollOverBackgroundColor	: '#DDDDDD'},

                        menuItems: [{
                            textAlign: 'center',
                            icon: "<%=path+"/amchartsTool/images/export.png"%>",
                            onclick:function(){},
                            items: [{
                                title: 'JPG',
                                format: 'jpg'
                            }, {
                                title: 'PNG',
                                format: 'png'
                            }, {
                                title: 'SVG',
                                format: 'svg'
                            }, {
                                title: 'PDF',
                                format: 'pdf'
                            }]
                        }]
                    }
                });
                          // AmCharts.removeChart("chartdiv");
                 }

        </script>
<%--        <script type="text/javascript">--%>
<%--           --%>
<%--        </script>--%>
    </head>

    <body>
		<span  style="font-family: Arial; margin-left:40%;font-size:150%; color: #CC0000; ">
           统计各个驾校的新增学员<br><br>
<%--			<p>Warning! Exporting to image works only if you view this file from web server. Exporting works with all modern browsers except IE9 (works fine with IE10)</p>--%>
		</span>

        <input type="hidden" id="path" value=<%=path%>>
        <input type="button" id="thisWeek" value="本周" onclick="thisWeek()">
        <input type="button" id="thisMonth" value="本月" onclick="thisMonth()">
        <input type="button" id="thisYear" value="本年" onclick="thisYear()">
        <div id="chartdiv" style="width: 100%; height: 400px;"></div>
    </body>



</html>