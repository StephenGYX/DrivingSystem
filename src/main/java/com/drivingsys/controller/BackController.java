package com.drivingsys.controller;

import com.alibaba.fastjson.JSON;
import com.drivingsys.bean.*;
import com.drivingsys.service.BackStageMyServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * 测试
 */

@RestController
public class BackController
{
	ModelAndView modelAndView = new ModelAndView();
	backmsg a = new backmsg();
	backmsgall backmsgall=new backmsgall();
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
	public ModelAndView reg(@RequestParam("username") String account, @RequestParam("password") String pass, @RequestParam("password1") String pass1, @RequestParam("phone") String phone, @RequestParam("sex") String sex, @RequestParam("age") int age, @RequestParam("name") String name, @RequestParam("email") String email, @RequestParam("idcard") String idcard, @RequestParam("wechat") String wechat, HttpServletResponse response) throws IOException
	{
		if (sex.equals("1"))
		{
			sex = "男";
		} else if (sex.equals("2"))
		{
			sex = "女";
		}
//		List<Consumer> consumers =backStageMyService.selectallc();
			backStageMyService.adduser(account, pass, phone, sex, age, name, email, idcard, wechat);
		modelAndView.setViewName("/frontlogin3");
		return modelAndView;
	}

	@RequestMapping("/preg")
	public ModelAndView preg(@RequestParam("mySelect") String driving, @RequestParam("province") String province, @RequestParam("city") String city, @RequestParam("county") String county, @RequestParam("username") String account, @RequestParam("password") String pass, @RequestParam("password1") String pass1, @RequestParam("sex") String sex, @RequestParam("age") int age, @RequestParam("phone") String phone, @RequestParam("email") String email, @RequestParam("name") String name, @RequestParam("idcard") String idcard, @RequestParam("question") String resume, @RequestParam("workexperience") String workexperience)
	{
		if (sex.equals("1"))
		{
			sex = "男";
		} else if (sex.equals("2"))
		{
			sex = "女";
		}
		backStageMyService.addpuser(driving, account, pass, sex, age, phone, email, name, idcard, resume, workexperience);
		modelAndView.setViewName("/frontlogin3");
		return modelAndView;
	}

	@RequestMapping("/table")
	public backmsg talbe(@RequestParam("page") int page, @RequestParam("limit") int limit, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		Drivingschool did = (Drivingschool) session.getAttribute("drivingschool");

		page = (page - 1) * limit;
		if (did != null)
		{
			List<Vehicle> List = backStageMyService.table(did.getDid(), page, limit);
			int i = backStageMyService.count1(did.getDid());
			a.setCode(0);
			a.setCount(i);
			a.setMsg(0);
			a.setData(List);
		} else
		{
			List<Vehicle> List1 = backStageMyService.table1(page, limit);
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
		int i=backStageMyService.countnum(demoReload);
		List<Vehicle> vehicle = backStageMyService.search(demoReload);
		a.setCount(i);
		a.setData(vehicle);
		return a;
	}

	@RequestMapping("/search1")
	public backmsg search1(@RequestParam("demoReload1") String demoReload1)
	{
		List<Vehicle> vehicle = backStageMyService.search1(demoReload1);
		a.setData(vehicle);
		return a;
	}

	@RequestMapping("/del")
	public void del(@RequestParam("vid") String vid)
	{

		backStageMyService.del(vid);
	}

	//新增数据
	@RequestMapping("/addcar1")
	public void addcar1(@RequestParam("num") String num, @RequestParam("brand") String brand, @RequestParam("model") String model,@RequestParam("carimages")String path, HttpServletRequest request){
		HttpSession session = request.getSession();
		Drivingschool did = (Drivingschool) session.getAttribute("drivingschool");
		System.out.println("车牌号"+num);
		System.out.println("品牌"+brand);
		System.out.println("型号"+model);
		System.out.println("地址"+path);
		if(did!=null){
			backStageMyService.addcar(num, brand, model, path,did.getDid());
		}else{
			backStageMyService.backaddcar(num, brand, model, path);
		}
	}

	//保存图片
	@RequestMapping("/addcar")
	public Map<String, Object> addcar( @RequestParam("file") MultipartFile file, HttpServletRequest request)
	{
//
		System.out.println("进入了");
		OutputStream out = null;
		InputStream fileInput = null;
		try
		{
			if (file != null)
			{
				String filepath = request.getServletContext().getRealPath("/") + "images\\" + file.getOriginalFilename();

				String path="..\\images\\"+file.getOriginalFilename();
				System.out.println("路径"+path);
				File files = new File(filepath);
				if (!files.getParentFile().exists())
				{
					files.getParentFile().mkdirs();
				}
				file.transferTo(files);
				Map<String, Object> map = new HashMap<>();
				map.put("code", 0);
				map.put("msg", "");
				map.put("src", path);
				return map;

			}

		} catch (Exception e)
		{
		} finally
		{
			try
			{
				if (out != null)
				{
					out.close();
				}
				if (fileInput != null)
				{
					fileInput.close();
				}
			} catch (IOException e)
			{
			}
		}
		Map<String, Object> map = new HashMap<>();
		map.put("code", 1);
		map.put("msg", "");
		return map;

	}


	@RequestMapping("/updat")
	public void updat(@RequestParam("state") String state, @RequestParam("ncarnum") String ncarnum, @RequestParam("num") String num, @RequestParam("carbrand") String carbrand, @RequestParam("carmodel") String carmodel)
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
		System.out.println("新车牌号" + ncarnum);
		System.out.println("车牌号" + num);
		System.out.println("新车型" + carmodel);
		System.out.println("新品牌" + carbrand);
		backStageMyService.updat(state, ncarnum, num, carbrand, carmodel);
	}

	@RequestMapping("/driving")
	public void driving(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		List<Drivingschool> drivingschools = backStageMyService.driving();


		response.setContentType("text/html; charset =utf-8");
		response.getWriter().write(new Gson().toJson(drivingschools));
		response.getWriter().flush();
	}
	@RequestMapping("/searchbrand")
	public backmsg searchbrand(@RequestParam("brand")String brand){
		int i=backStageMyService.countbrand(brand);
		List<Vehicle> vehicle = backStageMyService.searchbrand(brand);
		a.setCount(i);
		a.setData(vehicle);
		return a;
	}
	@RequestMapping("/searchmodel")
	public backmsg searchmodel(@RequestParam("model")String model){
		int i=backStageMyService.countmodel(model);
		List<Vehicle> vehicle = backStageMyService.searchmodel(model);
		a.setCount(i);
		a.setData(vehicle);
		return a;
	}
	@RequestMapping("/tableall")
	public backmsgall talbleall(@RequestParam("page") int page, @RequestParam("limit") int limit){

		page = (page - 1) * limit;
		List<Backstage> objects=backStageMyService.tableall(page, limit);
		int i=backStageMyService.backcount();
		backmsgall.setCode(0);
		backmsgall.setCount(i);
		backmsgall.setMsg(0);
		backmsgall.setData(objects);
		return backmsgall;
	}

	@RequestMapping("/backdel")
	public void backdel(@RequestParam("bid")String bid){
		backStageMyService.backdel(bid);
	}
	@RequestMapping("/stop")
	public void stop(@RequestParam("bid")String bid){
		backStageMyService.stop(bid);
	}
	@RequestMapping("/start")
	public void start(@RequestParam("bid")String bid){
backStageMyService.start(bid);
	}
	@RequestMapping("/edit")
	public void edit(@RequestParam("bid")String bid){
backStageMyService.edit(bid);
	}
	@RequestMapping("/addbackuser")
	public void adduser(@RequestParam("bacc")String bacc,@RequestParam("bpass")String bpass,@RequestParam("bname")String bname,@RequestParam("bstate")String bstate){
backStageMyService.addbackuser(bacc, bpass, bname, bstate);
	}
	@RequestMapping("/backsearchacc")
	public backmsgall backsearchacc(@RequestParam("bacc")String bacc){
		List<Backstage> backstages=backStageMyService.backsearchacc(bacc);
		if(backstages.size()==0){
			System.out.println("进来了");
			backmsgall.setCode(0);
			backmsgall.setCount(0);
			backmsgall.setMsg(0);
			backmsgall.setData(backstages);

		}else{
			int i=backstages.get(0).getC();
			backmsgall.setCode(0);
			backmsgall.setCount(i);
			backmsgall.setMsg(0);
			backmsgall.setData(backstages);
		}


		return backmsgall;
	}
	@RequestMapping("/backsearchname")
	public backmsgall backsearchname(@RequestParam("bname")String bname){
		List<Backstage> backstages=backStageMyService.backsearchname(bname);
		if(backstages.size()==0){
			backmsgall.setCode(0);
			backmsgall.setCount(0);
			backmsgall.setMsg(0);
			backmsgall.setData(backstages);
		}else{
			int i=backstages.get(0).getC();
			backmsgall.setCode(0);
			backmsgall.setCount(i);
			backmsgall.setMsg(0);
			backmsgall.setData(backstages);
		}
		return backmsgall;
	}
	@RequestMapping("/backsearchstate")
	public backmsgall backsearchstate(@RequestParam("bstate")String bstate){
		List<Backstage> backstages=backStageMyService.backsearchstate(bstate);
		if(backstages.size()==0){
			backmsgall.setCode(0);
			backmsgall.setCount(0);
			backmsgall.setMsg(0);
			backmsgall.setData(backstages);
		}else{
			int i=backstages.get(0).getC();
			backmsgall.setCode(0);
			backmsgall.setCount(i);
			backmsgall.setMsg(0);
			backmsgall.setData(backstages);
		}
		return backmsgall;
	}
	@RequestMapping("/selectavatar")
	public void selectavatar(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		HttpSession session = request.getSession();
		Practise id=(Practise)session.getAttribute("practise");
		List<Practise> msg=backStageMyService.selectavatar(id.getPid());
		response.setContentType("text/html; charset =utf-8");
		response.getWriter().write(new Gson().toJson(msg));
		response.getWriter().flush();
	}
	@RequestMapping("/updateavatar")
	public void updateavatar(@RequestParam("avatar")String avatar,@RequestParam("updatepass")String updatepass,HttpServletRequest request){
		HttpSession session = request.getSession();
		Practise id=(Practise)session.getAttribute("practise");
		if(updatepass.equals("")){
			backStageMyService.updateavatar(avatar,id.getPid());
		}else{
			backStageMyService.updateavatar(avatar,id.getPid());
			backStageMyService.updatepass(updatepass,id.getPid());
		}
	}
	@RequestMapping("/updatename")
	public void updatename(@RequestParam("updatename")String updatename,HttpServletRequest request){
		HttpSession session = request.getSession();
		Practise id=(Practise)session.getAttribute("practise");
		backStageMyService.updatename(updatename,id.getPid());
	}
	@RequestMapping("/updatephone")
	public void updatephone(@RequestParam("updatephone")String updatephone,HttpServletRequest request){
		HttpSession session = request.getSession();
		Practise id=(Practise)session.getAttribute("practise");
		backStageMyService.updatephone(updatephone,id.getPid());
	}
	@RequestMapping("/updateemail")
	public void updateemail(@RequestParam("updateemail")String updateemail,HttpServletRequest request){
		HttpSession session = request.getSession();
		Practise id=(Practise)session.getAttribute("practise");
		backStageMyService.updateemail(updateemail,id.getPid());
	}
	@RequestMapping("/updateidcard")
	public void updateidcard(@RequestParam("updateidcard")String updateidcard,HttpServletRequest request){
		HttpSession session = request.getSession();
		Practise id=(Practise)session.getAttribute("practise");
		backStageMyService.updateidcard(updateidcard,id.getPid());
	}
	@RequestMapping("/updateresume")
	public void updateresume(@RequestParam("updateresume")String updateresume,HttpServletRequest request){
		HttpSession session = request.getSession();
		Practise id=(Practise)session.getAttribute("practise");
		backStageMyService.updateresume(updateresume,id.getPid());
	}
	@RequestMapping("/chart")
	public void chart(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		HttpSession session = request.getSession();
		Drivingschool did = (Drivingschool) session.getAttribute("drivingschool");
//		List<Map<String, Object>> m = backStageMyService.chart(did.getDid());
//		for (int i = 0; i < m.size(); i++)
//		{
//			Map<String, Object> map = m.get(i);
//			Iterator iterator = map.keySet().iterator();
//			while (iterator.hasNext())
//			{
//				String string = (String) iterator.next();
//				System.out.println(map.get(string));
//		}
//		}
//		String jsonString = JSON.toJSONString(m);
//		response.setContentType("text/html; charset =utf-8");
//		response.getWriter().write(new Gson().toJson(jsonString));
//		response.getWriter().flush();
		List<Practise> objects=backStageMyService.chart(did.getDid());
				response.setContentType("text/html; charset =utf-8");
				response.getWriter().write(new Gson().toJson(objects));
				response.getWriter().flush();

	}
}

