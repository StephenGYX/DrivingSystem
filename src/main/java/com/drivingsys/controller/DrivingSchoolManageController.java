package com.drivingsys.controller;


import com.drivingsys.bean.Drivingschool;
import com.drivingsys.bean.Practise;
import com.drivingsys.bean.tableParam;
import com.drivingsys.service.DrivingSchoolManageService;
import com.drivingsys.service.FrontLoginService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
		int pages= Integer.valueOf(page);
		int limits = Integer.valueOf(limit);
		RowBounds rowBounds = new RowBounds((pages - 1) * limits,limits);

		long l =1;
//		//获取到登录成功的驾校端
//		 Drivingschool drivingschool = (Drivingschool) request.getSession().getAttribute("DrivingSchoolLoginSuccess");
//		long did = drivingschool.getDid();

		List<Practise> practises = drivingSchoolManageService.queryCoachByMySchool(l,rowBounds);
		long coachCount = drivingSchoolManageService.queryCoachByMySchoolCount(l);

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



}
