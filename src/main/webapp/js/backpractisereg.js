

window.onload=start;
function start(){
	var ary = new Array();

	$.ajax({
		url: '/springboot/driving',
		method: 'post',
		datatype:'json',
		async:false,
		success: function (userList) {
<<<<<<< HEAD
			var list = eval(userList)
=======
			var list = eval(userList);
>>>>>>> 15cf0fa539e8224541818c32935dabffd16e04d6
			// for(var i=0;i<list.length;i++){
			// 	ary.push(list[i].dname)
			// }
			for (var j = 0; j < list.length; j++) {
<<<<<<< HEAD
				$("#mySelect").append("<option value="+list[j].did+">"+list[j].dname+"</option>");
=======
				$("#mySelect").append("<option value="+ary[j]+">"+ary[j]+"</option>");
>>>>>>> 15cf0fa539e8224541818c32935dabffd16e04d6
			}
		}
	});
}
