package com.drivingsys.controller;


import com.drivingsys.bean.Drivingschool;
import com.drivingsys.bean.Practise;
import com.drivingsys.bean.tableParam;
import com.drivingsys.service.DrivingSchoolManageService;
import com.drivingsys.service.ManageDSCService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
@RequestMapping("/dSchool/")
public class ManageDSCController
{

	@Resource
	private ManageDSCService manageDSCService;


	@RequestMapping("QueryDSC")
	@ResponseBody
	public tableParam queryDSC(@RequestParam Map<String, Object> reqMap, HttpServletRequest request)
	{

		System.out.println("进入搜索方法");
		System.out.println(reqMap);
		System.out.println(reqMap.get("searchParams"));

		String searchParams = request.getParameter("searchParams");

		Map<String, Object> search = new HashMap<String, Object>();
		;
		if (searchParams != null)
		{

			JSONObject a = JSONObject.fromObject(searchParams);
			search = (Map<String, Object>) a;
		}


		RowBounds rowBounds=createRowBounds(request);
		//		manageDSCService.queryDSC(reqMap,rowBounds);
		tableParam tableParam = new tableParam();

		//0表示成功
		tableParam.setCode(0);
		//数据库查询count数量
		tableParam.setCount(2);
		//失败数据
		tableParam.setMsg("");
		tableParam.setData(manageDSCService.queryDSC(search, rowBounds));

		return tableParam;
	}


	@RequestMapping("DelDSC")
	@ResponseBody
	public int DelDSC(@RequestParam Map<String, Object> reqMap, HttpServletRequest request)
	{

		System.out.println("进入批量删除方法");
		System.out.println(reqMap);
		System.out.println(reqMap.get("delParams"));

		String delParams = request.getParameter("delParams");

		List<Drivingschool> del =null;
		;
		if (delParams != null)
		{

			JSONArray a = JSONArray.fromObject(delParams);
			del = (List<Drivingschool>) a;
		}


//		RowBounds rowBounds=createRowBounds(request);

		int i=manageDSCService.delDSC(del);
		System.out.println("操作条数"+i);
		return i;
//		tableParam tableParam = new tableParam();

//		//0表示成功
//		tableParam.setCode(0);
//		//数据库查询count数量
//		tableParam.setCount(2);
//		//失败数据
//		tableParam.setMsg("");
//		tableParam.setData(manageDSCService.queryDSC(null, rowBounds));
//
//		return tableParam;
	}










	private RowBounds createRowBounds(HttpServletRequest request){
		//当前页数
		String page = request.getParameter("page");
		//限制条数
		String limit = request.getParameter("limit");
		int pages = Integer.valueOf(page);
		int limits = Integer.valueOf(limit);
		RowBounds rowBounds = new RowBounds((pages - 1) * limits, limits);




		return rowBounds;
	}








}
