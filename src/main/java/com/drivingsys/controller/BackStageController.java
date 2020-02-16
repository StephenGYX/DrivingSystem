package com.drivingsys.controller;

import com.drivingsys.bean.Backstage;
import com.drivingsys.bean.RoleMenu;
import com.drivingsys.service.BackMenuService;
import com.drivingsys.service.BackStageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.swing.text.View;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Stephen
 * 后台管理员控制层
 */

@Controller
@RequestMapping("/back")
public class BackStageController
{

	@Autowired
	private BackStageService backStageService;

	@Autowired
	private BackMenuService backMenuService;

	@ResponseBody
	@RequestMapping("/backLogin")
	public HashMap<String, ArrayList<RoleMenu>> backLogin(@RequestParam Map<String,String> reqMap, HttpServletRequest request){

		//调用service查找账户的方法
		Backstage backstage = backStageService.queryBackStageAccount(reqMap);

		//获取改角色类型的菜单目录
		HashMap<String, ArrayList<RoleMenu>> menu = backMenuService.queryRoleMenu(backstage.getRid());

		//将该用户放入session域中
		request.getSession().setAttribute("backstage",backstage);

		//将该角色的菜单存入session域中
		request.getSession().setAttribute("menu",menu);

		System.out.println(menu.toString());

		//响应前端
		String msg = "";
		if(backstage!=null){
			msg = "1";
		}else {
			msg = "2";
		}
		return menu;
	}

	@RequestMapping("/logOut")
	public String logOut(){
		return "/backlogin";
	}

}
