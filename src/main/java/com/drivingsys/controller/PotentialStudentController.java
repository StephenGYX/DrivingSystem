package com.drivingsys.controller;

import com.drivingsys.bean.tableParam;

import com.drivingsys.service.PotentialStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

/**
 * 潜在客户表
 * @author Stephen
 */
@Controller
@RequestMapping("/potential")
public class PotentialStudentController
{

	@Autowired
	private PotentialStudentService potentialStudentService;

	@RequestMapping("/potentialView")
	@ResponseBody
	public tableParam fileView(@RequestParam Map<String,String> reqMap)
	{

		System.out.println("进入方法");
		int page = Integer.valueOf(reqMap.get("page"));
		int limit = Integer.valueOf(reqMap.get("limit"));

		//设置起始和限制条数
		String statrNum = ((page - 1) * limit)+"";
		reqMap.put("start",statrNum);

		System.out.println("传入的参数："+reqMap);
		//查询对应回显的table数据
		tableParam tableParam = potentialStudentService.queryAllPotentialWithLimit(reqMap);

		return tableParam;
	}

	@ResponseBody
	@RequestMapping("/queryPotentialWithParam")
	public tableParam queryPotentialWithParam(@RequestParam Map<String,String> reqMap)
	{
		String start = "";
		String end = "";
		int page = Integer.valueOf(reqMap.get("page"));
		int limit = Integer.valueOf(reqMap.get("limit"));

		if (reqMap.get("gtime") != "")
		{
			String[] time = reqMap.get("gtime").split(" ");
			start = time[0];
			end = time[2];
		}
		String statrNum = String.valueOf((page - 1) * limit);

		//存入hashmap中
		reqMap.put("start", start);
		reqMap.put("end", end);
		reqMap.put("statrNum",statrNum);

		tableParam tableInfo = potentialStudentService.queryPotentialWithParam(reqMap);
		return tableInfo;
	}

	@ResponseBody
	@RequestMapping("/insertPotentialContent")
	public int insertNewsContent(@RequestParam Map<String,String> reqMap)
	{
		//操作时间
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
		String gtime = dateFormat.format(date);

		//插入时间
		reqMap.put("gtime",gtime);

		//修改数据库
		int i = potentialStudentService.insertPotentialContent(reqMap);
		return i;
	}

	@ResponseBody
	@RequestMapping("/updatePotentialStatue")
	public int updateNewsStatue(@RequestParam Map<String,String> reqMap)
	{
		//获取到表格参数，并且回传到前端
		int i = potentialStudentService.updatePotentialStatue(reqMap);
		return i;
	}

	@ResponseBody
	@RequestMapping("/updatePotentialContent")
	public int updatePotentialContent(@RequestParam Map<String,String> reqMap)
	{
		//操作时间
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
		String gtime = dateFormat.format(date);

		//插入时间
		reqMap.put("gtime",gtime);

		//修改数据库
		int i = potentialStudentService.updatePotentialContent(reqMap);
		return i;
	}
}
