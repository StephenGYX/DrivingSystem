package com.drivingsys.controller;


import com.drivingsys.bean.Consumer;
import com.drivingsys.bean.Drivingschool;
import com.drivingsys.bean.Practise;
import com.drivingsys.bean.tableParam;
import com.drivingsys.service.DrivingSchoolManageService;
import com.drivingsys.service.FrontLoginService;
import com.google.gson.Gson;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 学员端、驾校段、教练端登录
 */

@Controller
@RequestMapping("/drivingSchool/")
public class DrivingSchoolManageController
{

	@Resource
	private DrivingSchoolManageService drivingSchoolManageService;


	@RequestMapping("QueryMyCoach")
	@ResponseBody
	public tableParam queryMyCoach(HttpServletRequest request){
		//当前页数
		String page = request.getParameter("page");
		//限制条数
		String limit = request.getParameter("limit");
		String userAccount = request.getParameter("userAccount");
		String username = request.getParameter("username");
		String startTime = request.getParameter("startTime");
		String stopTime = request.getParameter("stopTime");

		int pages= Integer.valueOf(page);
		int limits = Integer.valueOf(limit);
		RowBounds rowBounds = new RowBounds((pages - 1) * limits,limits);


		HashMap<String, String> paramMap = new HashMap<>();
		paramMap.put("userAccount",userAccount);
		paramMap.put("username",username);
		paramMap.put("startTime",startTime);
		paramMap.put("stopTime",stopTime);



		long l =1;
		String driverSchoolId =String.valueOf(l);
		paramMap.put("driverSchoolId",driverSchoolId);
//		//获取到登录成功的驾校端
//		 Drivingschool drivingschool = (Drivingschool) request.getSession().getAttribute("DrivingSchoolLoginSuccess");
//		long did = drivingschool.getDid();

		List<Practise> practises = drivingSchoolManageService.queryCoachByMySchool(rowBounds,paramMap);
		long coachCount = drivingSchoolManageService.queryCoachByMySchoolCount(paramMap);

		System.out.println("返回的表格       "+practises);
		System.out.println("返回的表格数量       "+coachCount);
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
	public String coachTableOperation(HttpServletRequest request) throws ServletException, IOException
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
	@RequestMapping("QueryMyStudent")
	@ResponseBody
	public tableParam queryMyStudent(HttpServletRequest request){
		//当前页数
		String page = request.getParameter("page");
		//限制条数
		String limit = request.getParameter("limit");
		String userAccount = request.getParameter("userAccount");
		String username = request.getParameter("username");
		String startTime = request.getParameter("startTime");
		String stopTime = request.getParameter("stopTime");
		String cpritiseid = request.getParameter("param");

		int pages= Integer.valueOf(page);
		int limits = Integer.valueOf(limit);
		RowBounds rowBounds = new RowBounds((pages - 1) * limits,limits);


		HashMap<String, String> paramMap = new HashMap<>();
		paramMap.put("userAccount",userAccount);
		paramMap.put("username",username);
		paramMap.put("startTime",startTime);
		paramMap.put("stopTime",stopTime);



		paramMap.put("cpritiseid",cpritiseid);


		List<Consumer> consumers = drivingSchoolManageService.queryStudentByMySchool(rowBounds,paramMap);
		long studentCount = drivingSchoolManageService.queryStudentByMySchoolCount(paramMap);


		tableParam tableParam = new tableParam();

		//0表示成功
		tableParam.setCode(0);
		//数据库查询count数量
		tableParam.setCount(studentCount);
		//失败数据
		tableParam.setMsg("");
		tableParam.setData(consumers);

		return tableParam;
	}



	@RequestMapping("StudentTableOperation")
	@ResponseBody
	public String studentTableOperation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{



		String operation= request.getParameter("do");
		String id = request.getParameter("cid");

		int cid =Integer.valueOf(id);
		int index = 0;
		System.out.println("这是参数" + operation);
		System.out.println("这是id" + cid);

		if (operation.equals("start"))
		{
			System.out.println("start");
			index=drivingSchoolManageService.updateStudentStateByCid(cid,1);
			//执行xml的 对应的方法
		} else if (operation.equals("stop"))
		{
			System.out.println("stop");
			index=drivingSchoolManageService.updateStudentStateByCid(cid,0);
			//执行xml的 对应的方法
		} else if (operation.equals("rePsw"))
		{
			String password = request.getParameter("password");
			index=drivingSchoolManageService.updateStudentPwdByCid(cid,password);


		}else if (operation.equals("delete"))
		{
			index=drivingSchoolManageService.updateStudentStateByCid(cid,2);


		}

		System.out.println("这是修改结果index"+index);

		Gson gson = new Gson();
		String jsonStr = gson.toJson(index);


		return jsonStr;

	}
}
