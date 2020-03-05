package com.drivingsys.controller;

import com.drivingsys.bean.*;
import com.drivingsys.service.ButtonLinkService;
import com.drivingsys.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 前端新闻资讯控制层
 * @author Stephen
 */
@Controller
@RequestMapping("/homepage")
public class HomePageController
{
	@Autowired
	private NewsService newsService;

	@Autowired
	private ButtonLinkService buttonLinkService;

	@RequestMapping("/queryNewsWithId/{jid}")
	public String queryNewsWithLimit(@PathVariable("jid") int jid, HttpServletRequest request){

		Journalism journalism = newsService.querySingleNews(jid);
		request.getSession().setAttribute("news",journalism);

		return "news1";
	}

	@RequestMapping("/drivingSchool")
	public String drivingSchool(HttpServletRequest request){

		List<Journalism> journalismList = newsService.queryAllNews("1");
		request.getSession().setAttribute("newsList",journalismList);

		List<Journalism> strategyList = newsService.queryAllNews("2");
		request.getSession().setAttribute("strategyList",strategyList);

		Workbuttonlink workbuttonlink = buttonLinkService.queryButtonLink();
		request.getSession().setAttribute("buttonlink",workbuttonlink);

		return "drivinghomepage";
	}

	@RequestMapping("/returnSchoolJoin")
	public String returnSchoolJoin(){
		return "area";
	}

	@RequestMapping("/returnSchoolJoinMain")
	public String returnSchoolJoinMain(){
		return "schooljoin";
	}

	@RequestMapping("/returnNewsTable")
	public String returnNewsTable(){
		return "newstable";
	};

	@RequestMapping("/returnChattest")
	public String returnChattest(){
		return "chattest";
	};

	@ResponseBody
	@RequestMapping("/queryNewsList")
	public tableParam queryNewsList(@RequestParam Map<String,String> reqMap, HttpServletRequest request){

		int page = Integer.valueOf(reqMap.get("page"));
		int limit = Integer.valueOf(reqMap.get("limit"));

		//设置起始和限制条数
		String statrNum = ((page - 1) * limit)+"";
		reqMap.put("start",statrNum);

		//查询对应回显的table数据
		tableParam tableParam = newsService.queryAllNewsWithLimit(reqMap);

		return tableParam;
	}

	@ResponseBody
	@RequestMapping("/queryNewsWithParam")
	public tableParam queryNewsWithParam(@RequestParam Map<String,String> reqMap)
	{
		String start = "";
		String end = "";
		int page = Integer.valueOf(reqMap.get("page"));
		int limit = Integer.valueOf(reqMap.get("limit"));

		if (reqMap.get("jtime") != "")
		{
			String[] time = reqMap.get("jtime").split(" ");
			start = time[0];
			end = time[2];
		}
		String statrNum = String.valueOf((page - 1) * limit);

		//存入hashmap中
		reqMap.put("start", start);
		reqMap.put("end", end);
		reqMap.put("statrNum",statrNum);

		tableParam tableInfo = newsService.queryNewsWithParam(reqMap);
		return tableInfo;
	}

	@ResponseBody
	@RequestMapping("/updateNewsStatue")
	public int updateNewsStatue(@RequestParam Map<String,String> reqMap)
	{
		//获取到表格参数，并且回传到前端
		int i = newsService.updateNewsStatue(reqMap);
		return i;
	}

	@ResponseBody
	@RequestMapping("/updateNewsContent")
	public int updateNewsContent(@RequestParam Map<String,String> reqMap)
	{
		//操作时间
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
		String jtime = dateFormat.format(date);

		//插入时间
		reqMap.put("jtime",jtime);
		String[] time = (jtime.split("  ")[0]).split("-");
		reqMap.put("jyear",time[0]);
		reqMap.put("jmonth",time[1]);
		reqMap.put("jday",time[2]);

		//修改数据库
		int i = newsService.updateNewsContent(reqMap);
		return i;
	}

	@ResponseBody
	@RequestMapping("/insertNewsContent")
	public int insertNewsContent(@RequestParam Map<String,String> reqMap)
	{
		//操作时间
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
		String jtime = dateFormat.format(date);

		//插入时间
		reqMap.put("jtime",jtime);
		String[] time = (jtime.split("  ")[0]).split("-");
		reqMap.put("jyear",time[0]);
		reqMap.put("jmonth",time[1]);
		reqMap.put("jday",time[2]);

		//修改数据库
		int i = newsService.insertNewsContent(reqMap);
		return i;
	}
}
