
function  toBaoMing(node,userParam,pathParam,cid,did){

	if (userParam==null || userParam===("")){

		window.location.href=pathParam+"/schoolInfo/toFrontLogin?baoMing=baoMing"
	} else {

		var tdNode=[];
		var tdHtml=[];
		//拿到td数组
		var childNodes = node.parentNode.parentNode.childNodes;
		for (var i = 0; i < childNodes.length; i++) {
			if (childNodes[i].tagName==='TD')
				tdNode.push(childNodes[i]);

			// console.log(childNodes[i].tagName)
		}
		for (var j = 0; j <tdNode.length-1 ; j++) {
			tdHtml[j]=tdNode[j].innerHTML;
		}


		$.ajax({
			type: "post"
			, url: pathParam + '/schoolInfo/baoMingPanDuan'
			//预期服务器返回的数据类型;
			, datatype: 'text'
			//从该js会发出到服务器的数据
			, data: {"baokaoType": tdHtml[1], "cid": cid,"did":did}
			//从servlet接收的数据
			, success: function (msg) {

				if (msg === "success") {
					window.location.href= pathParam+"/schoolInfo/toBaoMing?cid="+cid+"&did="+did+"&s1="+tdHtml[0]+"&s2="+tdHtml[1]+"&s3="+tdHtml[2]+"&s4="+tdHtml[3]+"&s5="+tdHtml[4]+"&s6="+tdHtml[5]+""
				} else if (msg === "examExist") {
					alert("该课程您已经报名过了，无法重复报名！");
				} else if (msg === "someNoPass") {
					alert("您还有未通过的课程！");
				}
			}
			, error: function (error) {
				alert("服务器正忙.....");
				console.log(error)
			}
		});



	}

}
