package com.drivingsys.controller;

import com.drivingsys.aspectJ.Log;
import com.drivingsys.bean.Backstage;
import com.drivingsys.bean.backmenu.BackMenu;
import com.drivingsys.bean.backmenu.ZtreeMenu;
import com.drivingsys.service.BackMenuService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("/menu")
public class BackMenuController
{
	@Autowired
	private BackMenuService backMenuService;

	@ResponseBody
	@RequestMapping("/queryRoleMenu")
	@Log(operationType = "查询操作", operationName = "查询菜单权限")
	public BackMenu queryRoleMenu(HttpServletRequest request){

		Backstage backstage = (Backstage) request.getSession().getAttribute("backstage");
		int rid = 0;

		//获取该角色类型的菜单目录
		BackMenu backMenu = backMenuService.queryRoleMenu(rid);
		return backMenu;
	}


	@ResponseBody
	@RequestMapping("/initMenuChange")
	@Log(operationType = "查询操作", operationName = "查询菜单权限")
	public List<ZtreeMenu> initMenuChange(HttpServletRequest request,int rid){

		List<ZtreeMenu> ztreeMenus = backMenuService.initMenuChange(rid);
		return ztreeMenus;
	}

	@ResponseBody
	@RequestMapping("/changeMenu")
	@Log(operationType = "修改操作", operationName = "修改角色菜单")
	public int changeMenu(HttpServletRequest request, int rid, String checkList){

		//获取勾选的菜单list
		ArrayList check = new Gson().fromJson(checkList,new ArrayList<Integer>().getClass());

		//将该角色菜单初始化
		int i = backMenuService.updateMenu(rid, check);
		return i;
	}

	/**
	 * 跳转到菜单页
	 * @return
	 */
	@RequestMapping("/menuRight")
	@Log(operationType = "无数据操作", operationName = "跳转菜单权限")
	public String logOut(){
		return "backmenuchange";
	}

}
