package com.drivingsys.controller;

import com.drivingsys.bean.*;
import com.drivingsys.service.BackPractiseManageService;
import com.drivingsys.service.DrivingSchoolManageService;
import com.google.gson.Gson;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

/**
 * 测试
 */
@Controller
@RequestMapping("/backConsumer/")
public class BackConsumerManageController
{


	@Resource
	private DrivingSchoolManageService drivingSchoolManageService;


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
			Drivingschool d=(Drivingschool)o;
			//后台查询驾校列表
			did = request.getParameter("did");
		}
		return did;
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

		String did=findDid(request);

//		System.out.println("cpritiseid:-----------------------"+cpritiseid);
		int pages= Integer.valueOf(page);
		int limits = Integer.valueOf(limit);
		RowBounds rowBounds = new RowBounds((pages - 1) * limits,limits);


		HashMap<String, String> paramMap = new HashMap<>();
		paramMap.put("userAccount",userAccount);
		paramMap.put("username",username);
		paramMap.put("startTime",startTime);
		paramMap.put("stopTime",stopTime);



		paramMap.put("cpritiseid",cpritiseid);

		paramMap.put("did",did);

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
			String did=findDid(request);

//			long l =1;
//			String driverSchoolId =String.valueOf(l);
			HashMap<String, String> idMap = new HashMap<>();
			idMap.put("pid",pid);
			idMap.put("did",did);
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

		String did = findDid(request);

		int pages= Integer.valueOf(page);
		int limits = Integer.valueOf(limit);
		RowBounds rowBounds = new RowBounds((pages - 1) * limits,limits);


		HashMap<String, String> paramMap = new HashMap<>();
		paramMap.put("userAccount",userAccount);
		paramMap.put("username",username);
		paramMap.put("startTime",startTime);
		paramMap.put("stopTime",stopTime);
		paramMap.put("cpritiseid",cpritiseid);
		paramMap.put("did",did);



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

		modelAndView.setViewName("backConsumerManageKaoShiArrange");

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

	@RequestMapping("studentAllEval")
	@ResponseBody
	public ModelAndView studentAllEval(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		//学员ID
		String cid = request.getParameter("cid");
		String did = findDid(request);

		//拿到订单表的信息
		List<Examination> examinations = drivingSchoolManageService.queryStudentAllEval(cid, did);



		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("evalS",examinations);
		modelAndView.setViewName("backConsumerManageStudentAllEvaluate");

		return modelAndView;
	}

}
