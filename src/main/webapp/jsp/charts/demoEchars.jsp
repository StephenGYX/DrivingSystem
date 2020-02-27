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
        <!-- <![endif]-->

        <script type="text/javascript">
            var chart;
            // var getRandomColor = function(){
            //     return '#'+Math.floor(Math.random()*16777215).toString(16);
            // };
            var chartData = [

                <c:forEach items="${chartList}" var="i" begin="0" varStatus="a">
                {
                "country": "${i.pname}",
                "visits": ${i.num} ,
                "color": '#'+Math.floor(Math.random()*16777215).toString(16)
                },

                 </c:forEach>


//                        "country": "USA",
//                    "visits": 4025,
//                    "color": "#FF0F00"
//            }, {
//                "country": "China",
//                    "visits": 1882,
//                    "color": "#FF6600"
//            }, {
//                "country": "Japan",
//                    "visits": 1809,
//                    "color": "#FF9E01"
//            }, {
//                "country": "Germany",
//                    "visits": 1322,
//                    "color": "#FCD202"
//            }, {
//                "country": "UK",
//                    "visits": 1122,
//                    "color": "#F8FF01"
//            }, {
//                "country": "France",
//                    "visits": 1114,
//                    "color": "#B0DE09"
//            }, {
//                "country": "India",
//                    "visits": 984,
//                    "color": "#04D215"
//            }, {
//                "country": "Spain",
//                    "visits": 711,
//                    "color": "#0D8ECF"
//            }, {
//                "country": "Netherlands",
//                    "visits": 665,
//                    "color": "#0D52D1"
//            }, {
//                "country": "Russia",
//                    "visits": 580,
//                    "color": "#2A0CD0"
//            }, {
//                "country": "South Korea",
//                    "visits": 443,
//                    "color": "#8A0CCF"
//            }, {
//                "country": "Canada",
//                    "visits": 441,
//                    "color": "#CD0D74"
//            }, {
//                "country": "Brazil",
//                    "visits": 395,
//                    "color": "#754DEB"
//            }, {
//                "country": "Italy",
//                    "visits": 386,
//                    "color": "#DDDDDD"
//            }, {
//                "country": "Australia",
//                    "visits": 384,
//                    "color": "#999999"
//            }, {
//                "country": "Taiwan",
//                    "visits": 338,
//                    "color": "#333333"
//            }, {
//                "country": "Poland",
//                    "visits": 328,
//                    "color": "#000000"
//            }
                 ];


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

                    valueField: "visits",
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
        </script>
    </head>

    <body>
		<span style="font-family: Arial; font-size: 10px; color: #CC0000;">
            查看教练的学员数<br><br>
<%--			<p>Warning! Exporting to image works only if you view this file from web server. Exporting works with all modern browsers except IE9 (works fine with IE10)</p>--%>
		</span>
        <div id="chartdiv" style="width: 100%; height: 400px;"></div>
    </body>

</html>