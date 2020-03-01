
function  toBaoMing(node,userParam,pathParam,cid,did){

	if (userParam==null || userParam===("")){

		// alert("走到登录界面");

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
		//
		// var s1 = JSON.stringify(tdHtml[0]);
		// var s2 = JSON.stringify(tdHtml[1]);
		// var s3 = JSON.stringify(tdHtml[2]);
		// var s4 = JSON.stringify(tdHtml[3]);
		// var s5 = JSON.stringify(tdHtml[4]);
		// var s6 = JSON.stringify(tdHtml[5]);
		// console.log(s);
          // console.log(tdNode);

		// alert("跳出报名界面");
	// &tableInfo="+s+"
		window.location.href= pathParam+"/schoolInfo/toBaoMing?cid="+cid+"&did="+did+"&s1="+tdHtml[0]+"&s2="+tdHtml[1]+"&s3="+tdHtml[2]+"&s4="+tdHtml[3]+"&s5="+tdHtml[4]+"&s6="+tdHtml[5]+""
	}

}
