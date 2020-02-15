package com.drivingsys.controller;

import com.drivingsys.bean.Backstage;
import com.drivingsys.service.BackStageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

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
	public String backLogin(@RequestParam Map<String,String> reqMap){

		//调用service查找账户的方法
		Backstage backstage = backStageService.queryBackStageAccount(reqMap);

		//响应前端
		String msg = "";
		if(backstage!=null){
			msg = "1";
		}else {
			msg = "2";
		}
		return msg;
	}

}
