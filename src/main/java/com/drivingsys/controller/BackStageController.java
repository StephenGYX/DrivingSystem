package com.drivingsys.controller;

import com.drivingsys.service.BackStageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Stephen
 * 后台管理员控制层
 */

@RestController()
@RequestMapping("/back")
public class BackStageController
{

	@Autowired
	private BackStageService backStageService;


	@RequestMapping("/backLogin")
	public void backLogin(String account,String password,String captcha){
		System.out.println(account);
		System.out.println("控制层：后台管理员登录");
	}

}
