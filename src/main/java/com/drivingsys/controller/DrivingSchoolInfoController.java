package com.drivingsys.controller;


import com.alibaba.fastjson.JSONArray;
import com.drivingsys.bean.Drivingschool;
import com.drivingsys.bean.Examination;
import com.drivingsys.bean.Kecheng;
import com.drivingsys.service.DrivingSchoolInfoService;
import com.google.gson.Gson;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/schoolInfo/")
public class DrivingSchoolInfoController
{

	@Autowired
     private DrivingSchoolInfoService drivingSchoolInfoService;


    //查看驾校端的教练
	@RequestMapping("ShowMyInfo")
	@ResponseBody
	public ModelAndView showMyInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		//驾校的ID
		String did = request.getParameter("did");

		int i= 1;
		String s = String.valueOf(i);

		//驾校的信息
		List<Drivingschool> drivingSchoolInfo = (List<Drivingschool>) drivingSchoolInfoService.querySchoolInfo(s);

		List<Kecheng> kechengs = drivingSchoolInfoService.querySchoolKeCheng(s);


		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("kechengs",kechengs);
		modelAndView.addObject("drivingSchoolInfo",drivingSchoolInfo);
		modelAndView.addObject("countEval",drivingSchoolInfo.size());

//		System.out.println(	"评分            "+drivingSchoolInfo.get(0).getDevaluatescore());

		modelAndView.setViewName("frontDrivingSchoolInfo");

		return modelAndView;
	}
	//跳到前端登录面
	@RequestMapping("toFrontLogin")
	@ResponseBody
	public ModelAndView toFrontLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		//驾校的ID
		String baoMing = request.getParameter("baoMing");



		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("baoMing",baoMing);

		modelAndView.setViewName("frontlogin3");

		return modelAndView;
	}
	//跳到报名页面
	@RequestMapping("toBaoMing")
	@ResponseBody
	public ModelAndView toBaoMing(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
//		Gson gson = new Gson();

		Kecheng kecheng = new Kecheng();
		//驾校的ID
		String did = request.getParameter("did");
		long didL = Long.valueOf(did);
		//学员的ID
		String cid = request.getParameter("cid");
		String s1 = request.getParameter("s1").trim();
		String s2 = request.getParameter("s2").trim();
		String s3 = request.getParameter("s3").trim();

//		System.out.println("did --------------------------"+did);
//		System.out.println("s2 --------------------------"+s2);
//		System.out.println("s3 --------------------------"+s3);
		long s3l = Long.valueOf(s3);
		String s4 = request.getParameter("s4").trim();
		String s5 = request.getParameter("s5").trim();
		long s5l = Long.valueOf(s5);
		String s6 = request.getParameter("s6").trim();
		kecheng.setDid(didL);
		kecheng.setKname(s1);
		kecheng.setKjiazhaoleixing(s2);
		kecheng.setKprice(s3l);
		kecheng.setKshijianduan(s4);
		kecheng.setKcosttime(s5l);
		kecheng.setBeizhu(s6);

//		JSONArray objects = JSONArray.parseArray(tableInfo);
//		for (int i = 0; i < objects.size(); i++) {
//			//得到对象
//			JSONObject jsonObject = objects.getJSONObject(i);
//			System.out.println(jsonObject.toJSONString());
//		}



//		System.out.println(did);
//		System.out.println(cid);

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("cid",cid);
		modelAndView.addObject("kecheng",kecheng);
		modelAndView.setViewName("baoMing");

		return modelAndView;
	}

	@RequestMapping("baoMingSure")
	@ResponseBody
	public int 	baoMingSure(@RequestParam Map<String, Object> reqMap, HttpServletRequest request)
	{
		int i=0;


		String baoMingParam = request.getParameter("baoMingParam");

		System.out.println(baoMingParam);

		Map<String, Object> baoMingMap = new HashMap<String, Object>();

		if (baoMingParam != null)
		{

			JSONObject a = JSONObject.fromObject(baoMingParam);
			baoMingMap = (Map<String, Object>) a;
		}
		if (baoMingMap != null)
		{
			i=drivingSchoolInfoService.insertBaoMing(baoMingMap);
		}

		System.out.println("i ====="+i);
		return i;

	}

}
