package com.drivingsys.controller;


import com.drivingsys.bean.Consumer;
import com.drivingsys.bean.Drivingschool;
import com.drivingsys.bean.Examination;
import com.drivingsys.bean.echartstest.echaretsDSC;
import com.drivingsys.bean.tableParam;
import com.drivingsys.service.ManageDSCService;
import com.google.gson.Gson;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
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

		RowBounds rowBounds = createRowBounds(request);

		List<Drivingschool> list = manageDSCService.queryDSC(search, rowBounds);

		//		manageDSCService.queryDSC(reqMap,rowBounds);
		tableParam tableParam = new tableParam();

		//0表示成功
		tableParam.setCode(0);
		//数据库查询count数量
		tableParam.setCount(list.size());
		//失败数据
		tableParam.setMsg("");
		tableParam.setData(list);

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

		List<Drivingschool> del = null;
		;
		if (delParams != null)
		{

			JSONArray a = JSONArray.fromObject(delParams);
			del = (List<Drivingschool>) a;
		}


		RowBounds rowBounds = createRowBounds(request);

		int i = manageDSCService.delDSC(del);
		System.out.println("操作条数" + i);
		return i;

	}


	private RowBounds createRowBounds(HttpServletRequest request)
	{
		RowBounds rowBounds = null;
		//当前页数
		String page = request.getParameter("page");
		//限制条数
		String limit = request.getParameter("limit");
		if (limit != null && page != null)
		{
			int pages = Integer.valueOf(page);
			int limits = Integer.valueOf(limit);
			rowBounds = new RowBounds((pages - 1) * limits, limits);

		}


		return rowBounds;
	}


	@RequestMapping("CoachTableOperation")
	@ResponseBody
	public int coachTableOperation(HttpServletRequest request) throws ServletException, IOException
	{


		String operation = request.getParameter("do").trim();
		String id = request.getParameter("did");
		System.out.println("这是参数" + operation);
		System.out.println("这是id" + id);


		int Did = Integer.valueOf(id);
		int index = 0;


		if (operation.equals("start"))
		{
			System.out.println("start");
			index = manageDSCService.updateCoachStateByDid(Did, 1);
			//执行xml的 对应的方法
		} else if (operation.equals("stop"))
		{
			System.out.println("stop");
			index = manageDSCService.updateCoachStateByDid(Did, 2);
			//执行xml的 对应的方法
		} else if (operation.equals("rePsw"))
		{
			String password = request.getParameter("password");
			index = manageDSCService.updateCoachPwdByDid(Did, password);


		} else if (operation.equals("delete"))
		{
			index = manageDSCService.updateCoachStateByDid(Did, 3);


		}

		System.out.println("这是修改结果index" + index);

		//


		return index;

	}


	@RequestMapping("QueryDSCPJ")
	@ResponseBody
	public tableParam QueryDSCPJ(@RequestParam Map<String, Object> reqMap, HttpServletRequest request)
	{

		System.out.println("进入搜索方法");
		System.out.println(reqMap);
		System.out.println(reqMap.get("did"));

		String did = request.getParameter("did");

		//		Map<String, Object> search = new HashMap<String, Object>();
		//		;
		//		if (searchParams != null)
		//		{
		//
		//			JSONObject a = JSONObject.fromObject(searchParams);
		//			search = (Map<String, Object>) a;
		//		}


		RowBounds rowBounds = createRowBounds(request);
		//		manageDSCService.queryDSC(reqMap,rowBounds);
		List<Examination> list = manageDSCService.querySTUpj(Integer.valueOf(did), rowBounds);
		JSONArray JSO = JSONArray.fromObject(list);
		System.out.println("********");
		System.out.println(JSO);


		tableParam tableParam = new tableParam();

		//0表示成功
		tableParam.setCode(0);
		//数据库查询count数量
		tableParam.setCount(list.size());
		//失败数据
		tableParam.setMsg("");
		tableParam.setData(list);

		return tableParam;
	}

	@RequestMapping("echartPJ")
	@ResponseBody
	public JSONArray echartPJ()
	{
		JSONArray array = null;
		List<echaretsDSC> echaretsDSCS = manageDSCService.echaretstest();
		array = JSONArray.fromObject(echaretsDSCS);


		return array;
	}




	@RequestMapping("queryqianDSC")
//	@ResponseBody
	public String queryqianDSC(@RequestParam Map<String, Object> reqMap, HttpServletRequest request)
	{

		System.out.println("前端接收驾校列表");
		System.out.println(reqMap);


		RowBounds rowBounds = new RowBounds(0,8);

		List<Drivingschool> list = manageDSCService.queryqianDSC(reqMap, rowBounds);

         request.getSession().setAttribute("drivingschoollist",list);

		return "frontdrivinglist";
	}














}
