

window.onload=start;
function start(){
	var ary = new Array();

	$.ajax({
		url: '/springboot/driving',
		method: 'post',
		datatype:'json',
		async:false,
		success: function (userList) {
			var list = eval(userList)
			for(var i=0;i<list.length;i++){
				ary.push(list[i].dname)
			}
			for (var j = 0; j < ary.length; j++) {
				$("#mySelect").append("<option value="+ary[j]+">"+ary[j]+"</option>");
			}
		}
	});


}