package com.drivingsys.controller;


import com.drivingsys.bean.Practise;
import com.drivingsys.bean.echarsParam;
import com.drivingsys.bean.tableParam;
import com.drivingsys.service.ChartsService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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

		modelAndView.addObject("chartList",chartList);
		modelAndView.setViewName("charts/demoEchars");

		return modelAndView;
	}

}
