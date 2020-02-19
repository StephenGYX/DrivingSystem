package com.drivingsys.controller;

import com.drivingsys.bean.Vehicle;
import com.drivingsys.service.BackStageMyServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 测试
 */

@RestController
public class BackController
{
	ModelAndView modelAndView = new ModelAndView();
	@Autowired
	private BackStageMyServiceImpl backStageMyService;

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
	public ModelAndView reg(@RequestParam("username")String account,@RequestParam("password")String pass,@RequestParam("password1")String pass1,@RequestParam("phone")String phone,@RequestParam("sex")String sex,@RequestParam("age")int age,@RequestParam("name")String name,@RequestParam("email")String email,@RequestParam("idcard")String idcard,@RequestParam("wechat")String wechat,HttpServletRequest request)
	{
		if(sex.equals("1")){
			sex="男";
		}else if(sex.equals("2")){
			sex="女";
		}

		if((account.replaceAll(" ", "")!=null&&!"".equals(account.replaceAll(" ", ""))&&account.replaceAll(" ", "").length()>0&&account.replaceAll(" ", "").length()<16)&&
				(pass.replaceAll(" ", "")!=null&&!"".equals(pass.replaceAll(" ", ""))&&pass.replaceAll(" ", "").length()>0&&pass.replaceAll(" ", "").length()<21)&&
				(pass1.replaceAll(" ", "")!=null&&!"".equals(pass1.replaceAll(" ", ""))&&pass1.replaceAll(" ", "").length()>0&&pass1.replaceAll(" ", "").length()<21)
		){
			if(pass.equals(pass1)){
				backStageMyService.adduser(account,pass,phone,sex,age,name,email,idcard,wechat);
				String u="注册成功";
				request.setAttribute("cg",u);
				modelAndView.setViewName("/backlogin");
			}else{
				System.out.println("密码错误");
			}
		}else{
			System.out.println("输入有误");
		}
		return modelAndView;
	}

	@RequestMapping("/preg")
	public ModelAndView preg(@RequestParam("province")String  province,@RequestParam("city")String city,@RequestParam("county")String county,@RequestParam("username")String account,@RequestParam("password")String pass,@RequestParam("password1")String pass1,@RequestParam("sex")String sex,@RequestParam("age")int age,@RequestParam("phone")String phone,@RequestParam("email")String email,@RequestParam("name")String name,@RequestParam("idcard")String idcard,@RequestParam("question")String resume,@RequestParam("workexperience")String workexperience){
		if(sex.equals("1")){
			sex="男";
		}else if(sex.equals("2")){
			sex="女";
		}
		backStageMyService.addpuser(account,pass,sex,age,phone,email,name,idcard,resume,workexperience);
		modelAndView.setViewName("/backlogin");
		return modelAndView;
	}

	@RequestMapping("/table")
	public List<Vehicle> talbe(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		List<Vehicle> List=backStageMyService.table();

		return List;
	}
}
