package com.drivingsys.controller;

import com.drivingsys.service.MyServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * 测试
 */

@RestController
public class TestController
{
	@Resource
	private MyServiceImpl myServiceImpl;

	@ResponseBody
	@RequestMapping("/hello")
	public String testMain(){
		return "index";
	}

	@RequestMapping("/index")
	public String index(){
		return "Getting start from spring boot!";
	}



	@RequestMapping("/reg")
	public void reg(@RequestParam("username")String account,@RequestParam("password")String pass,@RequestParam("password1")String pass1)
	{
		myServiceImpl.adduser(account,pass);
	}

}
