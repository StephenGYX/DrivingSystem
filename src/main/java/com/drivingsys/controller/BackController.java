package com.drivingsys.controller;

import com.drivingsys.bean.Drivingschool;
import com.drivingsys.bean.Vehicle;
import com.drivingsys.bean.backmsg;
import com.drivingsys.service.BackStageMyServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
	public String testMain()
	{
		return "index";
	}

	@RequestMapping("/index")
	public String index()
	{
		return "Getting start from spring boot!";
	}


	@RequestMapping("/reg")
	public ModelAndView reg(@RequestParam("username") String account, @RequestParam("password") String pass, @RequestParam("password1") String pass1, @RequestParam("phone") String phone, @RequestParam("sex") String sex, @RequestParam("age") int age, @RequestParam("name") String name, @RequestParam("email") String email, @RequestParam("idcard") String idcard, @RequestParam("wechat") String wechat, HttpServletRequest request)
	{
		if (sex.equals("1"))
		{
			sex = "男";
		} else if (sex.equals("2"))
		{
			sex = "女";
		}

		if ((account.replaceAll(" ", "") != null && !"".equals(account.replaceAll(" ", "")) && account.replaceAll(" ", "").length() > 0 && account.replaceAll(" ", "").length() < 16) && (pass.replaceAll(" ", "") != null && !"".equals(pass.replaceAll(" ", "")) && pass.replaceAll(" ", "").length() > 0 && pass.replaceAll(" ", "").length() < 21) && (pass1.replaceAll(" ", "") != null && !"".equals(pass1.replaceAll(" ", "")) && pass1.replaceAll(" ", "").length() > 0 && pass1.replaceAll(" ", "").length() < 21))
		{
			if (pass.equals(pass1))
			{
				backStageMyService.adduser(account, pass, phone, sex, age, name, email, idcard, wechat);
				String u = "注册成功";
				request.setAttribute("cg", u);
				modelAndView.setViewName("/backlogin");
			} else
			{
				System.out.println("密码错误");
			}
		} else
		{
			System.out.println("输入有误");
		}
		return modelAndView;
	}

	@RequestMapping("/preg")
	public ModelAndView preg(@RequestParam("province") String province, @RequestParam("city") String city, @RequestParam("county") String county, @RequestParam("username") String account, @RequestParam("password") String pass, @RequestParam("password1") String pass1, @RequestParam("sex") String sex, @RequestParam("age") int age, @RequestParam("phone") String phone, @RequestParam("email") String email, @RequestParam("name") String name, @RequestParam("idcard") String idcard, @RequestParam("question") String resume, @RequestParam("workexperience") String workexperience)
	{
		if (sex.equals("1"))
		{
			sex = "男";
		} else if (sex.equals("2"))
		{
			sex = "女";
		}
		backStageMyService.addpuser(account, pass, sex, age, phone, email, name, idcard, resume, workexperience);
		modelAndView.setViewName("/backlogin");
		return modelAndView;
	}

	@RequestMapping("/table")
	public backmsg talbe(@RequestParam("page") int page, @RequestParam("limit") int limit,HttpServletRequest request)
	{
		backmsg a = new backmsg();
		HttpSession session = request.getSession();
		Drivingschool did =  (Drivingschool)session.getAttribute("drivingschool");

		page = (page - 1) * limit;
		if(did!=null){
			List<Vehicle> List = backStageMyService.table(did.getDid(),page, limit);
			int i = backStageMyService.count();
			a.setCode(0);
			a.setCount(i);
			a.setMsg(0);
			a.setData(List);
		}else{
			List<Vehicle> List1=backStageMyService.table1(page,limit);
			int i = backStageMyService.count();
			a.setCode(0);
			a.setCount(i);
			a.setMsg(0);
			a.setData(List1);
		}

		return a;
	}

	@RequestMapping("/search")
	public backmsg search(@RequestParam("demoReload") String demoReload)
	{
		backmsg a=new backmsg();
		List<Vehicle> vehicle = backStageMyService.search(demoReload);
		a.setData(vehicle);
		return a;
	}
	@RequestMapping("/search1")
	public backmsg search1(@RequestParam("demoReload1") String demoReload1)
	{
		backmsg a=new backmsg();
		List<Vehicle> vehicle = backStageMyService.search1(demoReload1);
		a.setData(vehicle);
		return a;
	}
	@RequestMapping("/del")

	public void del(@RequestParam("vid") String vid)
	{
		backStageMyService.del(vid);
	}

	@RequestMapping("/addcar")
	public void addcar(@RequestParam("num") String num, @RequestParam("brand") String brand, @RequestParam("model") String model)
	{
		System.out.println(num);
		System.out.println(brand);
		System.out.println(model);
		backStageMyService.addcar(num, brand, model);
	}

	@RequestMapping("/updat")
	public void updat(@RequestParam("state") String state, @RequestParam("driving") String driving, @RequestParam("num") String num)
	{
		if (state.equals("1"))
		{
			state = "正常";
		} else if (state.equals("2"))
		{
			state = "使用中";
		} else if (state.equals("3"))
		{
			state = "维修中";
		} else if (state.equals("4"))
		{
			state = "报废";
		}
		System.out.println(state);
		System.out.println(driving);
		System.out.println(num);
		backStageMyService.updat(state, driving, num);

	}
}

