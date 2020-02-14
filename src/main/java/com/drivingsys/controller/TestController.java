package com.drivingsys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * 测试
 */

@RestController
public class TestController
{
	@ResponseBody
	@RequestMapping("/hello")
	public String testMain(){
		return "index";
	}

	@RequestMapping("/index")
	public String index(){
		return "Getting start from spring boot!";
	}
}
