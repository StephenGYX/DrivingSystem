package com.drivingsys.controller;

import com.drivingsys.bean.*;
import com.drivingsys.service.BackPractiseManageService;
import com.drivingsys.service.BackPractiseManageServiceImpl;
import com.drivingsys.service.BackStageMyServiceImpl;
import com.drivingsys.service.DrivingSchoolManageService;
import com.google.gson.Gson;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;


@Controller
@RequestMapping("/backPractise/")
public class BackPractiseMannageController
{

	@Resource
	private BackPractiseManageService backPractiseManageService;
	@Resource
	private DrivingSchoolManageService drivingSchoolManageService;

	@RequestMapping("queryAllCoach")
	@ResponseBody
	public tableParam queryAllCoach(HttpServletRequest request){
		//当前页数
		String page = request.getParameter("page");
		//限制条数
		String limit = request.getParameter("limit");
		String userAccount = request.getParameter("userAccount");
		String username = request.getParameter("username");
		String startTime = request.getParameter("startTime");
		String stopTime = request.getParameter("stopTime");
		String driverSchoolId = request.getParameter("did");
		int pages= Integer.valueOf(page);
		int limits = Integer.valueOf(limit);
		RowBounds rowBounds = new RowBounds((pages - 1) * limits,limits);


		HashMap<String, String> paramMap = new HashMap<>();
		paramMap.put("userAccount",userAccount);
		paramMap.put("username",username);
		paramMap.put("startTime",startTime);
		paramMap.put("stopTime",stopTime);
		paramMap.put("driverSchoolId",driverSchoolId);




		List<Practise> practises = backPractiseManageService.queryAllCoach(rowBounds,paramMap);
		long coachCount = backPractiseManageService.queryAllCoachCount(paramMap);


		tableParam tableParam = new tableParam();

		//0表示成功
		tableParam.setCode(0);
		//数据库查询count数量
		tableParam.setCount(coachCount);
		//失败数据
		tableParam.setMsg("");
		tableParam.setData(practises);

		return tableParam;
	}

	@RequestMapping("CoachTableOperation")
	@ResponseBody
	public String coachTableOperation(HttpServletRequest request)
	{


		String operation= request.getParameter("do");
		String id = request.getParameter("pid");

		int pid =Integer.valueOf(id);
		int index = 0;
		System.out.println("这是参数" + operation);
		System.out.println("这是id" + pid);

		if (operation.equals("start"))
		{
			System.out.println("start");
			index=drivingSchoolManageService.updateCoachStateByPid(pid,1);
			//执行xml的 对应的方法
		} else if (operation.equals("stop"))
		{
			System.out.println("stop");
			index=drivingSchoolManageService.updateCoachStateByPid(pid,0);
			//执行xml的 对应的方法
		} else if (operation.equals("rePsw"))
		{
			String password = request.getParameter("password");
			index=drivingSchoolManageService.updateCoachPwdByPid(pid,password);


		}else if (operation.equals("delete"))
		{
			index=drivingSchoolManageService.updateCoachStateByPid(pid,2);


		}

		System.out.println("这是修改结果index"+index);

		Gson gson = new Gson();
		String jsonStr = gson.toJson(index);


		return jsonStr;

	}

	//跳转到后台学员界面
	@RequestMapping("seeMyStudent")
	@ResponseBody
	public ModelAndView seeMyStudent(HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		String pid= request.getParameter("pid");
		String doThing= request.getParameter("do");

	    //确定点开的是什么列表(查看学员，审核学员，学员管理)
		modelAndView.addObject("doThing",doThing);


		//驾校ID
		String did = findDid(request);

		System.out.println("did"+did);
		modelAndView.addObject("did",did);
		modelAndView.addObject("pid",pid);
		modelAndView.setViewName("backConsumerManageStudentTable");

           return modelAndView;
	}
	//查看教练所收到的评价
	@RequestMapping("practiseEval")
	@ResponseBody
	public ModelAndView practiseEval(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		//教练的ID
		String pid = request.getParameter("pid");
        //驾校ID
		String did = findDid(request);

		System.out.println("pid========="+pid);
		System.out.println("did========="+did);


		List<Examination> examinations = drivingSchoolManageService.queryCoachEval(pid, did);


		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("evalS",examinations);

		modelAndView.setViewName("backPractiseManageToPractiseEvaluate");

		return modelAndView;
	}

	//这是驾校管理列表，点击查看教练，跳转到教练列表
	@RequestMapping("toMyDrivingSchool")
	@ResponseBody
	public ModelAndView toMyDrivingSchool(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		String did = findDid(request);
		String doThing = request.getParameter("do");

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("did",did);
		modelAndView.addObject("doThing",doThing);

		modelAndView.setViewName("backPractiseManagelCoachTable");

		return modelAndView;
	}


	public String findDid(HttpServletRequest request){

		String did="";
		//驾校端登录
		Object o = request.getSession().getAttribute("drivingschool");
		if (o != null)
		{
			System.out.println("驾校登录------------------");
			Drivingschool d=(Drivingschool)o;
			did=d.getDid()+"";
		}else {
			System.out.println("后台登录------------------");
			//后台查询驾校列表
			did = request.getParameter("did");
		}
		return did;
	}


}
