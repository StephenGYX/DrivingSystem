package com.drivingsys.controller;

import com.alibaba.druid.sql.dialect.mysql.ast.statement.MySqlShowGrantsStatement;
import com.drivingsys.aspectJ.Log;
import com.drivingsys.bean.Backstage;
import com.drivingsys.bean.RoleMenu;
import com.drivingsys.bean.VerifyCodeUtils;
import com.drivingsys.bean.backmenu.BackMenu;
import com.drivingsys.service.BackMenuService;
import com.drivingsys.service.BackStageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.View;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.awt.SystemColor.menu;

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
	@Log(operationType = "查询操作", operationName = "用户登录")
	public String backLogin(@RequestParam Map<String, String> reqMap, HttpServletRequest request)
	{

		//调用service查找账户的方法
		Backstage backstage = backStageService.queryBackStageAccount(reqMap);

		//将该用户放入session域中
		request.getSession().setAttribute("backstage", backstage);

		String CODE = request.getSession().getAttribute("CODE") + "";
		String code = reqMap.get("code");


		//响应前端
		String msg = "";
		if (!code.equals(CODE))
		{
			msg = "3";
		} else
		{
			if (backstage != null)
			{
				msg = "1";
			} else
			{
				msg = "2";
			}
		}

		return msg;
	}

	/**
	 * 注销登录
	 *
	 * @return
	 */
	@RequestMapping("/logOut")
	@Log(operationType = "无数据操作", operationName = "注销登录")
	public String logOut()
	{
		return "backlogin";
	}
}
