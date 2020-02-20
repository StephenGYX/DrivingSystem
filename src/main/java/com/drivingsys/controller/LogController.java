package com.drivingsys.controller;

import com.drivingsys.aspectJ.Log;
import com.drivingsys.bean.tableParam;
import com.drivingsys.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/log")
public class LogController
{

	@Autowired
	private LogService logService;

	@RequestMapping("/logView")
	@ResponseBody
	public tableParam fileView(int page, int limit)
	{

		//创建传参的map
		HashMap<String, Integer> hashMap = new HashMap<>();

		//设置起始和限制条数
		int statrNum = (page - 1) * limit;
		hashMap.put("start", statrNum);
		hashMap.put("limit", limit);

		//获取到表格参数，并且回传到前端
		tableParam tableInfo = logService.queryAllLog(hashMap);

		return tableInfo;
	}

	@RequestMapping("/queryLogWithParam")
	@ResponseBody
	public tableParam queryFileWithParam(@RequestParam Map<String,String> reqMap)
	{
		String start = "";
		String end = "";
		int page = Integer.valueOf(reqMap.get("page"));
		int limit = Integer.valueOf(reqMap.get("limit"));

		if (reqMap.get("opetime") != "")
		{
			String[] time = reqMap.get("opetime").split(" ");
			start = time[0];
			end = time[2];
		}
		String statrNum = String.valueOf((page - 1) * limit);

		//存入hashmap中
		reqMap.put("start", start);
		reqMap.put("end", end);
		reqMap.put("statrNum",statrNum);

		tableParam tableInfo = logService.queryLogWithParam(reqMap);

		System.out.println(tableInfo.toString());

		return tableInfo;
	}

	@RequestMapping("/tologView")
	public String logOut(){
		return "logtable";
	}
}
