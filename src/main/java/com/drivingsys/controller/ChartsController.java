package com.drivingsys.controller;


import com.drivingsys.bean.DateS;
import com.drivingsys.bean.Practise;
import com.drivingsys.bean.echarsParam;
import com.drivingsys.bean.tableParam;
import com.drivingsys.service.ChartsService;
import com.google.gson.Gson;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/charts/")
public class ChartsController
{
     @Resource
     private ChartsService chartsService;

	@RequestMapping("drivingSchoolCount")
	@ResponseBody
	public ModelAndView drivingSchoolCount(HttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		ArrayList<echarsParam> chartList = (ArrayList<echarsParam>) chartsService.queryStudentByCoach();


		Iterator<echarsParam> it = chartList.iterator();
		while (it.hasNext())
		{
			echarsParam echarsParam = it.next();
			if (echarsParam.getPid()==0)
			{
				it.remove();
			}
		}

//		for (int i=chartList.size()-1;i>=0;i--)
//		{
//			if (chartList.get(i).getPid()==0){
//			chartList.remove(i);
//		}
//
//		}
		modelAndView.addObject("studentCountByPid",chartList);
		modelAndView.setViewName("charts/studentByPidEchars");
		return modelAndView;
	}
	@RequestMapping("querySchoolPrice")
	@ResponseBody
	public ModelAndView querySchoolPractise(HttpServletRequest request){

		ModelAndView modelAndView = new ModelAndView();
		ArrayList<echarsParam> chartList = (ArrayList<echarsParam>) chartsService.querySchoolPrice();


		modelAndView.addObject("querySchoolPrice",chartList);
		modelAndView.setViewName("charts/priceBySchoolEchars");
		return modelAndView;
	}

	@RequestMapping("newStudentByThisWeek")
	@ResponseBody
	public ModelAndView newStudentByThisWeek(HttpServletRequest request){
		Date t = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.sql.Date sqld = new java.sql.Date(t.getTime());
		DateS dateS = new DateS();


		//本周第一天的日期
		Date beginDayOfWeekByDay = dateS.getBeginDayOfWeekByDay(sqld);
		Date endDayOfWeek = dateS.getEndDayOfWeek(beginDayOfWeekByDay);

		System.out.println("这周第一天是"+df.format(beginDayOfWeekByDay));
		System.out.println("这周最后一天是"+df.format(endDayOfWeek));

		Map<String, String> startAndStopTime = new HashMap<>();
		startAndStopTime.put("beginDay",df.format(beginDayOfWeekByDay));
		startAndStopTime.put("endDay",df.format(endDayOfWeek));

		ModelAndView modelAndView = new ModelAndView();
		ArrayList<echarsParam> chartList = (ArrayList<echarsParam>) chartsService.newStudentByTime(startAndStopTime);


		request.getSession().setAttribute("newStudent",chartList);

		modelAndView.setViewName("charts/newStudentByTimeEchars");
		return modelAndView;
	}
	@RequestMapping("newStudentByThisWeek1")
	@ResponseBody
	public String newStudentByThisWeek1(HttpServletRequest request){
		Date t = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.sql.Date sqld = new java.sql.Date(t.getTime());
		DateS dateS = new DateS();



		//本周第一天的日期
		Date beginDayOfWeekByDay = dateS.getBeginDayOfWeekByDay(sqld);
		Date endDayOfWeek = dateS.getEndDayOfWeek(beginDayOfWeekByDay);

		System.out.println("这周第一天是"+df.format(beginDayOfWeekByDay));
		System.out.println("这周最后一天是"+df.format(endDayOfWeek));

		Map<String, String> startAndStopTime = new HashMap<>();
		startAndStopTime.put("beginDay",df.format(beginDayOfWeekByDay));
		startAndStopTime.put("endDay",df.format(endDayOfWeek));


		ArrayList<echarsParam> chartList = (ArrayList<echarsParam>) chartsService.newStudentByTime(startAndStopTime);

//		request.getSession().setAttribute("newStudent",chartList);

		Gson gson = new Gson();
		String s = gson.toJson(chartList);
		return s;
	}


	@RequestMapping("newStudentByThisMonth")
	@ResponseBody
	public String newStudentByThisMonth(HttpServletRequest request){
		Date t = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.sql.Date sqld = new java.sql.Date(t.getTime());
		DateS dateS = new DateS();
		//本月第一天的日期
		Date beginDayOfMonth = dateS.getBeginDayOfMonth();
		Date endDayOfMonth = dateS.getEndDayOfMonth();

		System.out.println("这月第一天是"+df.format(beginDayOfMonth));
		System.out.println("这月最后一天是"+df.format(endDayOfMonth));

		Map<String, String> startAndStopTime = new HashMap<>();
		startAndStopTime.put("beginDay",df.format(beginDayOfMonth));
		startAndStopTime.put("endDay",df.format(endDayOfMonth));

		ArrayList<echarsParam> chartList = (ArrayList<echarsParam>) chartsService.newStudentByTime(startAndStopTime);

		Gson gson = new Gson();
		String s = gson.toJson(chartList);
//		request.getSession().setAttribute("newStudent",chartList);

		return s;
	}
	@RequestMapping("newStudentByThisYear")
	@ResponseBody
	public String newStudentByThisYear(HttpServletRequest request){
		Date t = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		java.sql.Date sqld = new java.sql.Date(t.getTime());
		DateS dateS = new DateS();
		//本年第一天的日期
		Date beginDayOfYear = dateS.getBeginDayOfYear();
		Date endDayOfYear = dateS.getEndDayOfYear();

		System.out.println("今年的第一天是"+df.format(beginDayOfYear));
		System.out.println("今年的最后一天是"+df.format(endDayOfYear));

		Map<String, String> startAndStopTime = new HashMap<>();
		startAndStopTime.put("beginDay",df.format(beginDayOfYear));
		startAndStopTime.put("endDay",df.format(endDayOfYear));


		ArrayList<echarsParam> chartList = (ArrayList<echarsParam>) chartsService.newStudentByTime(startAndStopTime);
		Gson gson = new Gson();
		String s = gson.toJson(chartList);
//		request.getSession().setAttribute("newStudent",chartList);


		
		return s;
	}

}
