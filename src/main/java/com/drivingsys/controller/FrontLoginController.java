package com.drivingsys.controller;

import com.drivingsys.bean.Consumer;
import com.drivingsys.bean.Drivingschool;
import com.drivingsys.bean.Practise;
import com.drivingsys.service.BackStageService;
import com.drivingsys.service.FrontLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 测试
 */

@Controller
@RequestMapping("/fact/")
public class FrontLoginController
{

	@Autowired
	private FrontLoginService frontLoginService;


	@RequestMapping("hello")
	public String testMain(@RequestParam Map<String, String> reqMap, HttpServletRequest request)
	{
		System.out.println(reqMap);
		//		System.out.println("hellos");
		String roleid = request.getSession().getAttribute("roleid") + "";

		if (roleid.equals("null"))
		{
			roleid = "4";
		}
		System.out.println("roleid=" + roleid);
		if (roleid.equals("3"))
		{
			Practise practise = frontLoginService.queryPractiseAccount(reqMap);
			if (practise == null)
			{
				System.out.println("没找到教练");
				return "frontlogin";
			} else
			{
				System.out.println("找到了教练");
				return "index";
			}



		} else if (roleid.equals("2"))
		{
			Drivingschool drivingschool=frontLoginService.queryDrivingschool(reqMap);
			if (drivingschool==null){System.out.println("没找到驾校");
				return "frontlogin";}
		else {System.out.println("找到了驾校");
				return "index";}
		}else if (roleid.equals("4"))
		{
			Consumer consumer=frontLoginService.queryConsumer(reqMap);
			if (consumer==null){System.out.println("没找到学生");
				return "frontlogin";}
			else {System.out.println("找到了学生");
				return "index";}
		}
		return "frontlogin";
	}

	@RequestMapping("roleid")
	@ResponseBody
	public String testMain(String roleid, HttpServletRequest request)
	{
		System.out.println("roleid方法参数" + roleid);
		String roleid1 = "4";
		roleid1 = roleid;
		request.getSession().setAttribute("roleid", roleid1);
		System.out.println(roleid1);
		return roleid1;
	}

	@RequestMapping("/index")
	public String index()
	{
		return "Getting start from spring boot!";
	}
}
