package com.drivingsys.controller;


import com.drivingsys.bean.Consumer;
import com.drivingsys.bean.Drivingschool;
import com.drivingsys.bean.Practise;
import com.drivingsys.bean.tableParam;
import com.drivingsys.service.DrivingSchoolManageService;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.google.gson.Gson;
import net.sf.json.JSONObject;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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

	/**
	 * 查询本驾校的教练
	 * @param request
	 * @return
	 */
	@RequestMapping("QueryMyCoach")
	@ResponseBody
	public tableParam queryMyCoach(HttpServletRequest request){
		//当前页数
		String page = request.getParameter("page");
		//限制条数
		String limit = request.getParameter("limit");
		//搜索条件
		String userAccount = request.getParameter("userAccount");
		String username = request.getParameter("username");
		String startTime = request.getParameter("startTime");
		String stopTime = request.getParameter("stopTime");
		HashMap<String, String > selectParamMap = new HashMap<>();
		selectParamMap.put("userAccount",userAccount);
		selectParamMap.put("username",username);
		selectParamMap.put("startTime",startTime);
		selectParamMap.put("stopTime",stopTime);

		int pages= Integer.valueOf(page);
		int limits = Integer.valueOf(limit);
		RowBounds rowBounds = new RowBounds((pages - 1) * limits,limits);
		//		//获取到登录成功的驾校端
		//		 Drivingschool drivingschool = (Drivingschool) request.getSession().getAttribute("DrivingSchoolLoginSuccess");
		//		long did = drivingschool.getDid();

		long l =1;
		String driverSchoolId = String.valueOf(l);
		selectParamMap.put("driverSchoolId",driverSchoolId);


		List<Practise> practises = drivingSchoolManageService.queryCoachByMySchool(rowBounds,selectParamMap);
		long coachCount = drivingSchoolManageService.queryCoachByMySchoolCount(selectParamMap);

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

	/**
	 *对教练进行重置密码，启用禁用删除
	 * @param request
	 * @return
	 */
	@RequestMapping("CoachTableOperation")
	@ResponseBody
	public String coachTableOperation(HttpServletRequest request){
		String operation = request.getParameter("do");
		String pidString = request.getParameter("pid");

		int pid =Integer.valueOf(pidString);
		int index = 0;
		System.out.println("这是操作" + operation);
		System.out.println("这是id" + pid);

        //启用
		if (operation.equals("start"))
		{
			System.out.println("进入了start");

			index = drivingSchoolManageService.updateCoachStateByPid(pid, 1);

        //禁用
		} else if (operation.equals("stop"))
		{
			System.out.println("stop");

			index = drivingSchoolManageService.updateCoachStateByPid(pid, 0);
        //重置密码
		} else if (operation.equals("rePsw"))
		{
			System.out.println("rePsw");
			String password = request.getParameter("password");

			index =drivingSchoolManageService.updateCoachPwdByPid(pid,password);
		//逻辑删除
		}else if (operation.equals("delete"))
		{
			System.out.println("delete");

			index =drivingSchoolManageService.updateCoachStateByPid(pid,2);
		}

		System.out.println("这是修改结果" + index);


		Gson gson = new Gson();
		String jsonString = gson.toJson(index);


		return jsonString;
	}

	/**
	 *查询驾校的学员
	 * @param request
	 * @return
	 */
	@RequestMapping("QueryMyStudent")
	@ResponseBody
	public tableParam queryStudent(HttpServletRequest request){
		//当前教练ID
		String coachId = request.getParameter("param");
		//当前页数
		String page = request.getParameter("page");
		//限制条数
		String limit = request.getParameter("limit");
		//搜索条件
		String userAccount = request.getParameter("userAccount");
		String username = request.getParameter("username");
		String startTime = request.getParameter("startTime");
		String stopTime = request.getParameter("stopTime");
		HashMap<String, String > selectParamMap = new HashMap<>();
		selectParamMap.put("userAccount",userAccount);
		selectParamMap.put("username",username);
		selectParamMap.put("startTime",startTime);
		selectParamMap.put("stopTime",stopTime);


		int pages= Integer.valueOf(page);
		int limits = Integer.valueOf(limit);
		RowBounds rowBounds = new RowBounds((pages - 1) * limits,limits);
		//		//获取到登录成功的驾校端
		//		 Drivingschool drivingschool = (Drivingschool) request.getSession().getAttribute("DrivingSchoolLoginSuccess");
		//		long did = drivingschool.getDid();


		String cpritiseid = String.valueOf(coachId);
		selectParamMap.put("cpritiseid",cpritiseid);


		List<Consumer> consumers = drivingSchoolManageService.queryStudentByMySchool(rowBounds,selectParamMap);
		long studentCount = drivingSchoolManageService.queryStudentByMySchoolCount(selectParamMap);

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

	/**
	 *对学员进行启用禁用删除等操作
	 * @param request
	 * @return
	 */
	@RequestMapping("StudentTableOperation")
	@ResponseBody
	public String studentTableOperation(HttpServletRequest request){
		String operation = request.getParameter("do");
		String cidString = request.getParameter("cid");

		int cid =Integer.valueOf(cidString);
		int index = 0;
		System.out.println("这是操作" + operation);
		System.out.println("这是id" + cid);

		//启用
		if (operation.equals("start"))
		{
			System.out.println("进入了start");

			index = drivingSchoolManageService.updateStudentStateByCid(cid, 1);

		}
		//禁用
		else if (operation.equals("stop"))
		{
			System.out.println("stop");

			index = drivingSchoolManageService.updateStudentStateByCid(cid, 0);

		}
		//重置密码
		else if (operation.equals("rePsw"))
		{
			System.out.println("rePsw");
			String password = request.getParameter("password");

			index =drivingSchoolManageService.updateStudentPwdByCid(cid,password);
		}
		//逻辑删除
		else if (operation.equals("delete"))
		{
			System.out.println("delete");

			index =drivingSchoolManageService.updateStudentStateByCid(cid,2);
		}


		System.out.println("这是修改结果" + index);


		Gson gson = new Gson();
		String jsonString = gson.toJson(index);


		return jsonString;
	}
}
