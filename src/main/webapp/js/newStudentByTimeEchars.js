// window.onload=function () {
//
// 	makechart();
// };


function thisWeek() {

	$.ajax({
		url: $("#path").val() + "/charts/newStudentByThisWeek1",
		// data: {"rid":rid},
		type: "post",
		dataType: 'text',
		success: function (data) {
			var obj = JSON.parse(data);
			var chartData=[];
			var  p= [{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
				{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
				{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
				{},{},{},{},{},{},{},{},{},{},{},{},{}];

			for (var i = 0; i <obj.length ; i++) {
				p[i].count=obj[i].num;
				p[i].country=obj[i].dname;
				p[i].color='#'+Math.floor(Math.random()*16777215).toString(16);
				chartData.push(p[i]);
			}



			makechart(chartData);

		}
		,error:function (error) {
			alert("服务器正忙.....");
			console.log(error)
		}
	});
}
function thisMonth() {

	$.ajax({
		url:  $("#path").val() + "/charts/newStudentByThisMonth",
		// data: {"rid":rid},
		type: "post",
		dataType: 'text',
		success: function (data) {
			var obj = JSON.parse(data);
			var chartData=[];
			var  p= [{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
				{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
				{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
				{},{},{},{},{},{},{},{},{},{},{},{},{}];

			for (var i = 0; i <obj.length ; i++) {
				p[i].count=obj[i].num;
				p[i].country=obj[i].dname;
				p[i].color='#'+Math.floor(Math.random()*16777215).toString(16);
				chartData.push(p[i]);
			}



			makechart(chartData);
		}
		,error:function (error) {
			alert("服务器正忙.....");
			console.log(error)

		}
	});
}
function thisYear() {

	$.ajax({
		url:  $("#path").val() + "/charts/newStudentByThisYear",
		// data: {"rid":rid},
		type: "post",
		dataType: 'text',
		success: function (data) {

             var obj = JSON.parse(data);
             var chartData=[];
			var  p= [{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
				{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
				{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
				{},{},{},{},{},{},{},{},{},{},{},{},{}];

			for (var i = 0; i <obj.length ; i++) {
				p[i].count=obj[i].num;
				p[i].country=obj[i].dname;
				p[i].color='#'+Math.floor(Math.random()*16777215).toString(16);
				chartData.push(p[i]);
			}



			makechart(chartData);

		}
		,error:function (error) {
			alert("服务器正忙.....");
			console.log(error)
		}
	});
}
function init(chartData){
	chart.dataProvider = chartData;
	chart.validateNow();
	chart.validateData();
}