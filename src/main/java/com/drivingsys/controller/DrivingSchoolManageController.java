package com.drivingsys.controller;


import com.drivingsys.bean.*;
import com.drivingsys.service.DrivingSchoolManageService;
import com.drivingsys.service.FrontLoginService;
import com.google.gson.Gson;
import com.sun.org.apache.xpath.internal.operations.Mod;
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
import java.util.ArrayList;
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

		} else if (operation.equals("stop"))
		{
			System.out.println("stop");
			index=drivingSchoolManageService.updateStudentStateByCid(cid,0);

		} else if (operation.equals("rePsw"))
		{
			String password = request.getParameter("password");
			index=drivingSchoolManageService.updateStudentPwdByCid(cid,password);


		}else if (operation.equals("delete"))
		{
			index=drivingSchoolManageService.updateStudentStateByCid(cid,2);


		}else if (operation.equals("examinePass"))
		{
			//拿到驾校端输入的教练ID
			String pid = request.getParameter("pid");
			//拿到登录后台的驾校ID
			long l =1;
			String driverSchoolId =String.valueOf(l);
			HashMap<String, String> idMap = new HashMap<>();
			idMap.put("pid",pid);
			idMap.put("did",driverSchoolId);
			//先查询驾校端输入的这个教练是否存在
			Practise practise = drivingSchoolManageService.queryCoachByPidAndDid(idMap);

			//如果教练为空，则返回404，告诉页面没有找到该教练
			if (practise==null){
                 index =404;

			}//否则教练存在，将其和学员进行绑定(学员表和订单表都需要绑定)
			else{

				HashMap<String, String> cidPidMap = new HashMap<>();
				HashMap<String, String> orderState = new HashMap<>();

				cidPidMap.put("cid",id);
				cidPidMap.put("pid",pid);

				orderState.put("cid",id);
				orderState.put("orderState","0");
                //与用户表和菜单表分别绑定
				index=drivingSchoolManageService.updateOrderTheCoachId(cidPidMap);
				int index1= drivingSchoolManageService.updateStudentTheCoachId(cidPidMap);
				//将订单状态改成0(表示审核通过，未完成科目1)
				int index2=drivingSchoolManageService.updateOrderState(orderState);
				System.out.println("index=     "+index);
				System.out.println("index1=     "+index1);
				//等于2
				index =index+index1;
		}


		}else if (operation.equals("examineNoPass"))
		{
			HashMap<String, String> orderState = new HashMap<>();
			orderState.put("cid",id);
			orderState.put("orderState","-2");
			//将订单状态改成-2(表示审核不通过，被驳回)
			 index=drivingSchoolManageService.updateOrderState(orderState);

		}

		System.out.println("这是修改结果index"+index);

		Gson gson = new Gson();
		String jsonStr = gson.toJson(index);


		return jsonStr;

	}

	@RequestMapping("QueryStudentKaoShiTable")
	@ResponseBody
	public tableParam queryStudentKaoShiTable(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
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


	@RequestMapping("kaoShiDialog")
	@ResponseBody
    public ModelAndView  kaoShiDialog(HttpServletRequest request){


		String test = request.getParameter("test");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("kaoshi",test);

		modelAndView.setViewName("drivingSchoolKaoShiArrange");

		return modelAndView;
    }




	@RequestMapping("kaoShiArrange")
	@ResponseBody
	public String kaoShiArrange(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int index = 0;
		//获取到要考试的学员以及教练的ID
		String cid = request.getParameter("cid");
		String pid = request.getParameter("pid");

		//获取到学员需要考试的科目以及考试时间
		String kaoShiTime1 = request.getParameter("kaoShiTime1");
		String kaoShiTime2 = request.getParameter("kaoShiTime2");
		String kaoShiTime3 = request.getParameter("kaoShiTime3");
		String kaoShiTime4 = request.getParameter("kaoShiTime4");
		String test1 = request.getParameter("test1");
		String test2 = request.getParameter("test2");
		String test3 = request.getParameter("test3");
		String test4 = request.getParameter("test4");

		HashMap<String, String> paramMap = new HashMap<>();
		paramMap.put("cid",cid);
		paramMap.put("pid",pid);
		paramMap.put("kaoShiTime1",kaoShiTime1);
		paramMap.put("kaoShiTime2",kaoShiTime2);
		paramMap.put("kaoShiTime3",kaoShiTime3);
		paramMap.put("kaoShiTime4",kaoShiTime4);
		paramMap.put("test1",test1);
		paramMap.put("test2",test2);
		paramMap.put("test3",test3);
		paramMap.put("test4",test4);

		index= drivingSchoolManageService.updateOrderKaoshiTime(paramMap);
		Gson gson = new Gson();
		String jsonStr = gson.toJson(index);


		return jsonStr;

	}


	@RequestMapping("kaoShiRevoke")
	@ResponseBody
	public String kaoShiRevoke(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{



		String operation= request.getParameter("do");
		String id = request.getParameter("cid");
		String pid = request.getParameter("pid");
		HashMap<String, String> paramMap = new HashMap<>();


		int cid =Integer.valueOf(id);
		int index = 0;

		if (operation.equals("Revoke1"))
		{
			paramMap.put("cid",id);
			paramMap.put("pid",pid);
			paramMap.put("kaoShiTime1","");
			paramMap.put("test1","noNull");

			index= drivingSchoolManageService.updateOrderKaoshiTime(paramMap);

		} else if (operation.equals("Revoke2"))
		{
			paramMap.put("cid",id);
			paramMap.put("pid",pid);
			paramMap.put("kaoShiTime2","");
			paramMap.put("test2","noNull");

			index= drivingSchoolManageService.updateOrderKaoshiTime(paramMap);

		} else if (operation.equals("Revoke3"))
		{

			paramMap.put("cid",id);
			paramMap.put("pid",pid);
			paramMap.put("kaoShiTime3","");
			paramMap.put("test3","noNull");
			index= drivingSchoolManageService.updateOrderKaoshiTime(paramMap);


		}else if (operation.equals("Revoke4"))
		{
			paramMap.put("cid",id);
			paramMap.put("pid",pid);
			paramMap.put("kaoShiTime4","");
			paramMap.put("test4","noNull");
			index= drivingSchoolManageService.updateOrderKaoshiTime(paramMap);


		}

		System.out.println("这是修改结果index"+index);

		Gson gson = new Gson();
		String jsonStr = gson.toJson(index);


		return jsonStr;

	}
	@RequestMapping("practiseEval")
	@ResponseBody
	public ModelAndView practiseEval(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		//教练的ID
		String pid = request.getParameter("pid");

		long l =1;
		String driverSchoolId =String.valueOf(l);
		//		//获取到登录成功的驾校端
		//		 Drivingschool drivingschool = (Drivingschool) request.getSession().getAttribute("DrivingSchoolLoginSuccess");
		//		long did = drivingschool.getDid();

		List<Examination> examinations = drivingSchoolManageService.queryCoachEval(pid, driverSchoolId);


		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("evalS",examinations);

		modelAndView.setViewName("drivingSchoolToPractiseEvaluate");

		return modelAndView;
	}
	@RequestMapping("studentAllEval")
	@ResponseBody
	public ModelAndView studentAllEval(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		//学员ID
		String cid = request.getParameter("cid");

		long l =1;
		String driverSchoolId =String.valueOf(l);
		//		//获取到登录成功的驾校端
		//		 Drivingschool drivingschool = (Drivingschool) request.getSession().getAttribute("DrivingSchoolLoginSuccess");
		//		long did = drivingschool.getDid();

        //拿到订单表的信息
		List<Examination> examinations = drivingSchoolManageService.queryStudentAllEval(cid, driverSchoolId);



		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("evalS",examinations);
		modelAndView.setViewName("drivingSchoolStudentAllEvaluate");

		return modelAndView;
	}








}
