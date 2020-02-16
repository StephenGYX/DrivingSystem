package com.drivingsys.controller;

import com.drivingsys.bean.Backstage;
import com.drivingsys.bean.backmenu.BackMenu;
import com.drivingsys.service.BackMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/menu")
public class BackMenuController
{
	@Autowired
	private BackMenuService backMenuService;

	@ResponseBody
	@RequestMapping("/queryRoleMenu")
	public BackMenu queryRoleMenu(HttpServletRequest request){

		System.out.println("菜单方法进来了！");
		Backstage backstage = (Backstage) request.getSession().getAttribute("backstage");
		int rid = 0;

//		System.out.println("角色Id:"+rid);

		//获取该角色类型的菜单目录
		BackMenu backMenu = backMenuService.queryRoleMenu(rid);
		return backMenu;
	}
}
