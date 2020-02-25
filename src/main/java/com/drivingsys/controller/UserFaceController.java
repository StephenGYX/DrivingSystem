package com.drivingsys.controller;

import com.baidu.aip.face.AipFace;
import com.baidu.aip.face.MatchRequest;

import com.drivingsys.service.UserinfoService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import com.google.gson.JsonParser;
import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@RestController
public class UserFaceController
{
	@Autowired
	public UserinfoService userinfoService;
	private AipFace client;
	public synchronized AipFace getClient(){
		if (client==null){
			client=new AipFace ("18534709","iLYKLGWHwlDqIVGxIBCmSm0Y","K4YXWMrfPaRiSLsXqy8Lr0AczplHl25S");
		}
		return client;
	}
	@RequestMapping("/userfaceadd")
	public String faceadd(@RequestBody Map<String, String> params){
		String image=params.get("image");
		System.out.println(image);
		HashMap<String, String> options = new HashMap<String, String>();
		options.put("user_info", "user's info");
		options.put("quality_control", "NORMAL");
		options.put("liveness_control", "LOW");
		options.put("action_type", "REPLACE");

//		String image = "取决于image_type参数，传入BASE64字符串或URL字符串或FACE_TOKEN字符串";
		String imageType = "BASE64";
		String groupId = "users";
		String userId = "user1";
		AipFace client =getClient();
		// 人脸注册
		JSONObject res = client.addUser(image, imageType, groupId, userId, options);
		System.out.println(res.toString(2));
		if ("SUCCESS".equals(res.get("error_msg"))){
			String face_token = res.getJSONObject("result").get("face_token").toString();
			if (userinfoService.updateuserface("1",face_token)>0)
			{

				return "succ";
			}else {
				return "fail";
			}
		}else {
			return "fail";
		}
	}
	@RequestMapping("/userfacematch")
	public String facematch(@RequestBody Map<String, String> params){
		String image1=params.get("image");
		String Socre = "";
		if (!"".equals(image1))
		{
//			String image2 = "cc01556d463b15e89f8cd774d6b65111";
			String image2=userinfoService.selectFacetoken("1");
			// image1/image2也可以为url或facetoken, 相应的imageType参数需要与之对应。
			MatchRequest req1 = new MatchRequest(image1, "BASE64");
			MatchRequest req2 = new MatchRequest(image2, "FACE_TOKEN");
			ArrayList<MatchRequest> requests = new ArrayList<MatchRequest>();
			requests.add(req1);
			requests.add(req2);
			AipFace client = getClient();

			JSONObject res = client.match(requests);

			System.out.println(res.toString(2));

			if (!(res.get("result") instanceof String))
			{
				Socre = res.getJSONObject("result").get("score").toString();
				System.out.println(Socre);
			}
		}
		return Socre;
	}

	@RequestMapping("/getkemunow/{cid}")
	public int getuserkemu(@PathVariable String cid){
		return userinfoService.selectkemunow(cid);
	}
	@RequestMapping("/updateClassHour")
	public String updateClassHour(@RequestBody Map<String, String> params){
		String cid=params.get("cid");
		String []timeArr=params.get("time").split(":");
		String kemunow=params.get("kemunow");

		String totaltime=(Integer.parseInt(timeArr[0])+(Integer.parseInt(timeArr[1])/5*0.25))+"";
		if (userinfoService.updateclasshour(cid,kemunow,totaltime)>0){
			return "succ";
		}else {
			return "fail";
		}
	}
	@RequestMapping("/getclasshours/{cid}")
	public Map getclasshours(@PathVariable String cid)
	{
		return userinfoService.selectclasshours(cid);
	}

	@RequestMapping("/getdrivingschool/{cid}")
	public Map getdrivingschool(@PathVariable String cid)
	{

		Map map=userinfoService.selectdrivingschool(cid);
		map.putAll(userinfoService.selectorderstate(cid,"school"));
		return map;

	}

	@RequestMapping("/insertrate")
	public String insertrate(@RequestBody Map<String, String> params){
		String cid = params.get("cid");
		String content = params.get("content");
		String score = params.get("score");
		String type=params.get("type");
		System.out.println(score+","+content+"!!!!!!!");
		if (userinfoService.updaterate(cid, score, content,type) > 0)
		{
			return "succ";
		}else
		{
			return "fail";
		}
	}

	@RequestMapping("/getcoach/{cid}")
	public Map getcoach(@PathVariable String cid)
	{


		Map map=userinfoService.selectorderstate(cid,"coach");
		map.put("coach",userinfoService.selectcoach(cid));
		return map;

	}



}
