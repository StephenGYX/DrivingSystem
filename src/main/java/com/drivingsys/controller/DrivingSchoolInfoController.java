package com.drivingsys.controller;


//import com.alibaba.fastjson.JSONArray;
import com.drivingsys.bean.Drivingschool;
import com.drivingsys.bean.Examination;
import com.drivingsys.bean.Kecheng;
import com.drivingsys.service.DrivingSchoolInfoService;
import com.google.gson.Gson;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
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

    //查看驾校
	@ResponseBody
	@RequestMapping("ShowMyInfo")
	public String showMyInfo(String id,HttpServletRequest request, HttpServletResponse response)
	{

		System.out.println("id====" +id);

		if (id.equals("none")){

		//
		}else {
			request.getSession().setAttribute("drivingscid",id);
		}

		String drivingscid = (String) request.getSession().getAttribute("drivingscid");

		System.out.println("drivingscid====" +drivingscid);

//		int i= 1;
//		String s = String.valueOf(i);

		//驾校的信息
		List<Drivingschool> drivingSchoolInfo = (List<Drivingschool>) drivingSchoolInfoService.querySchoolInfo(drivingscid);

		List<Kecheng> kechengs = drivingSchoolInfoService.querySchoolKeCheng(drivingscid);

		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.addObject("kechengs",kechengs);
//		modelAndView.addObject("drivingSchoolInfo",drivingSchoolInfo);
//		modelAndView.addObject("countEval",drivingSchoolInfo.size());
//
		request.getSession().setAttribute("kechengs",kechengs);
		request.getSession().setAttribute("drivingSchoolInfo",drivingSchoolInfo);

		int count =0;
		for (int i = 0; i < drivingSchoolInfo.size(); i++)
		{
			if (drivingSchoolInfo.get(i).getExamination()!=null){
				if (drivingSchoolInfo.get(i).getExamination().getEdrivingcontent()!=null){
					count++;
				}

			};
		}
		request.getSession().setAttribute("countEval",count);
		System.out.println("正确的评论人数"+count);
//		System.out.println(	"评分            "+drivingSchoolInfo.get(0).getDevaluatescore());

		return "1";
	}

	@RequestMapping("toFrontDrivingPage")
	public String toFrontDrivingPage(){
		return "frontDrivingSchoolInfo";
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
	@RequestMapping("baoMingPanDuan")
	@ResponseBody
	public String 	baoMingPanDuan(HttpServletRequest request)
	{

		System.out.println("1111111111111111111111111");

		String cid = request.getParameter("cid");
		String baokaoType = request.getParameter("baokaoType");
		String did = request.getParameter("did");
		Examination examination = drivingSchoolInfoService.queryExamExist(cid, baokaoType);
		//没有学过该课程
		if (examination==null){
            //没有学过的话，判断他是否还学习过其他课程
			List<Examination> examinations = drivingSchoolInfoService.queryExamListByCid(cid);
			//没学学过任何课程，可以报名
			if(examinations==null){
				return "success";
			//如果学过其他课程，判断是否都已经超过毕业了
			}else {
				boolean b=true;
				for(Examination examination1:examinations){
					//小于5说明有学科没有毕业，不能在报名
					if (examination1.getEorderstate()<5){
						b= false;
					}
				}
                if (b){
                	return "success";
                }else {
	                return "someNoPass";
                }
			}
		}else {
			return "examExist";
		}

	}


}
