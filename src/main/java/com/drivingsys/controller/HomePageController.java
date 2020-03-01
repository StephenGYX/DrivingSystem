package com.drivingsys.controller;

import com.drivingsys.bean.Journalism;
import com.drivingsys.bean.Log;
import com.drivingsys.bean.Strategy;
import com.drivingsys.bean.Workbuttonlink;
import com.drivingsys.service.ButtonLinkService;
import com.drivingsys.service.LogService;
import com.drivingsys.service.NewsService;
import com.drivingsys.service.StrategyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
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
	private StrategyService strategyService;

	@Autowired
	private ButtonLinkService buttonLinkService;

	@RequestMapping("/queryNewsWithId/{jid}")
	public String queryNewsWithLimit(@PathVariable("jid") int jid, HttpServletRequest request){

		Journalism journalism = newsService.querySingleNews(jid);
		request.getSession().setAttribute("news",journalism);

		return "news1";
	}

	@RequestMapping("/queryStrategyWithId/{sid}")
	public String queryStrategyWithLimit(@PathVariable("sid") int sid, HttpServletRequest request){

		Strategy strategy = strategyService.querySingleStrategy(sid);
		request.getSession().setAttribute("strategy",strategy);

		return "gonglve1";
	}

	@RequestMapping("/drivingSchool")
	public String drivingSchool(HttpServletRequest request){

		String limit = "4";
		List<Journalism> journalismList = newsService.queryAllNews(limit);
		request.getSession().setAttribute("newsList",journalismList);

		List<Strategy> strategyList = strategyService.queryAllStrategy(limit);
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

	@RequestMapping("/returnButtonLink")
	public String returnButtonLink(){
		return "";
	};
}
