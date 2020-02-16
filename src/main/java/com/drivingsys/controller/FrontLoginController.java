package com.drivingsys.controller;


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
 * 学员端、驾校段、教练端登录
 */

@Controller
@RequestMapping("/fact/")
public class FrontLoginController
{

	@Autowired
	private FrontLoginService frontLoginService;


	@RequestMapping("frontLogin")
	public String testMain(@RequestParam Map<String,String> reqMap, HttpServletRequest request){
		System.out.println(reqMap);
		String roleid=request.getSession().getAttribute("roleid")+"";

		if (roleid.equals("null")){
			roleid="4";
		}
		System.out.println("roleid="+roleid);
		 Practise practise = frontLoginService.queryPractiseAccount(reqMap);
		if (practise == null)
		{
			System.out.println("没找到");
		}else{
			System.out.println("找到了");
		};
		 		return "index";

	}
	@RequestMapping("roleid")
	@ResponseBody
	public String testMain(String roleid, HttpServletRequest request){
		System.out.println("roleid方法参数"+roleid);
		String roleid1 = "4";
		roleid1=roleid;
		request.getSession().setAttribute("roleid",roleid1);
		System.out.println(roleid1);
		return roleid1;
	}

	@RequestMapping("/index")
	public String index(){
		return "Getting start from spring boot!";
	}
}
