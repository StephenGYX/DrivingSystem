package com.drivingsys.controller;

import com.drivingsys.aspectJ.Log;
import com.drivingsys.bean.*;
import com.drivingsys.bean.backmenu.BackMenu;
import com.drivingsys.service.BackMenuService;
import com.drivingsys.service.FrontLoginService;
import com.drivingsys.service.ManageDSCService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 学员端、驾校段、教练端登录
 */

@Controller
@RequestMapping("/fact/")
public class FrontLoginController
{

	@Autowired
	private FrontLoginService frontLoginService;
	@Resource
	private ManageDSCService manageDSCService;


	@Autowired
	private BackMenuService backMenuService;

	@ResponseBody
	@RequestMapping("/queryRoleMenu")

	public BackMenu queryRoleMenu(HttpServletRequest request)
	{


		int rid = Integer.valueOf(request.getSession().getAttribute("roleid") + "");

		//获取该角色类型的菜单目录
		BackMenu backMenu = backMenuService.queryRoleMenu(rid);
		return backMenu;
	}


	@RequestMapping("frontLogin")
	@ResponseBody
	public String testMain(@RequestParam Map<String, String> reqMap, HttpServletRequest request)
	{
		System.out.println(reqMap);
		String roleid = request.getSession().getAttribute("roleid") + "";
		String CODE = request.getSession().getAttribute("CODE") + "";
		String code = reqMap.get("code");
		if (!code.equalsIgnoreCase(CODE))
		{
			System.out.println("验证码错误");
			request.getSession().setAttribute("fmsg", "yzmcw");
			return "3";

		}
		;
		if (roleid.equals("null"))
		{
			roleid = "4";
		}
		System.out.println("roleid=" + roleid);
		if (roleid.equals("3"))
		{

			Practise practise = frontLoginService.queryPractiseAccount(reqMap);
			if (practise == null)
			{
				System.out.println("没找到教练");
				request.getSession().setAttribute("fmsg", "2");
				return "2";
			} else
			{
				System.out.println("找到了教练");
				request.getSession().invalidate();
				request.getSession().setAttribute("practise", practise);
				return "20";
			}


		} else if (roleid.equals("2"))
		{
			Drivingschool drivingschool = frontLoginService.queryDrivingschool(reqMap);
			if (drivingschool == null)
			{
				System.out.println("没找到驾校");

				request.getSession().setAttribute("fmsg", "2");
				return "2";
			} else
			{
				System.out.println("找到了驾校");
				request.getSession().removeAttribute("drivingschool");
				request.getSession().setAttribute("drivingschool", drivingschool);
				//				return "DSCHinfo";
				return "30";
			}
		} else if (roleid.equals("4"))
		{
			Consumer consumer = frontLoginService.queryConsumer(reqMap);
			if (consumer == null)
			{
				System.out.println("没找到学生");
				request.getSession().setAttribute("fmsg", "2");
				return "2";
			} else
			{
				System.out.println("找到了学生");
				request.getSession().invalidate();
				request.getSession().setAttribute("consumer", consumer);

				return "10";
			}
		}
		return "frontlogin3";
	}

	@RequestMapping("roleid")
	@ResponseBody
	public String testMain(String roleid, HttpServletRequest request)
	{
		System.out.println("roleid方法参数" + roleid);
		String roleid1 = "4";
		roleid1 = roleid;
		request.getSession().setAttribute("roleid", roleid1);
		System.out.println(roleid1);
		return roleid1;
	}


	@RequestMapping("role")
	@ResponseBody
	public void testMain(HttpServletRequest request)
	{

		request.getSession().setAttribute("roleid", "4");

	}


	@RequestMapping("DSCreg")
	@ResponseBody
	public int DSCreg(@RequestParam Map<String, Object> reqMap, HttpServletRequest request)
	{

		System.out.println("进入注册方法");
		System.out.println(reqMap);
		System.out.println(reqMap.get("dscParams"));

		String dscParams = request.getParameter("dscParams");

		Map<String, Object> del = new HashMap<String, Object>();
		;
		if (dscParams != null)
		{

			JSONObject a = JSONObject.fromObject(dscParams);
			del = (Map<String, Object>) a;
		}


		//		RowBounds rowBounds=createRowBounds(request);
		int i = frontLoginService.instertDSC(del);


		System.out.println("操作条数" + i);
		return i;

	}

	@RequestMapping("DSCupdatainfo")
	@ResponseBody
	public int DSCupdatainfo(@RequestParam Map<String, Object> reqMap, HttpServletRequest request)
	{
		int i = 0;
		System.out.println("进入更改信息方法");
		System.out.println("DSCupdatainfo" + reqMap);
		System.out.println("DSCupdatainfo" + reqMap.get("dscParams"));

		String dscParams = request.getParameter("dscParams");

		Map<String, Object> updata = new HashMap<String, Object>();
		;
		if (dscParams != null)
		{

			JSONObject a = JSONObject.fromObject(dscParams);
			updata = (Map<String, Object>) a;
		}
		if (updata != null)
		{
			i = manageDSCService.updatedscinfo(updata);
		}

		//		int i=frontLoginService.instertDSC(del);
		//
		//
		//		System.out.println("操作条数"+i);
		return i;

	}


	@RequestMapping("upload")
	@ResponseBody
	public String uploadFile(HttpServletRequest request, @RequestParam Map<String, String> reqMap) throws IOException
	{
		System.out.println("进入驾校图片上传方法");
		//获取文件上传的位置:这里文件上传的路径无法确保在工程目录下(所以需要获取tomcat服务器下的路径)
		String path = request.getSession().getServletContext().getRealPath("/images");

		String did = reqMap.get("did");
		if (did == null || did.equals(""))
		{
			did = "default";
		}
		;String jxxx = reqMap.get("jxxx");
		if (jxxx == null || jxxx.equals(""))
		{
			jxxx = "error";
		}

		System.out.println("reqmap" + reqMap);

		List<MultipartFile> files = ((MultipartHttpServletRequest) request).getFiles("file");
		for (int i = 0; i < files.size(); i++)
		{
			MultipartFile file = files.get(i);
			if (file.isEmpty())
			{
				return "上传第" + (i++) + "个文件失败";
			}
			String fileName = file.getOriginalFilename();
			System.out.println("fileName" + fileName);

			//整合新的文件路径，并且写出到本地
			String filePath = path + "\\" + did + "\\" + fileName;
			String showFilePath = "\\images\\"  + did + "\\" + fileName;
			System.out.println(filePath);
			File dest = new File(filePath);
			try
			{
				if (dest.exists() == false)
				{
					dest.mkdirs();
				}
				;
				file.transferTo(dest);
				System.out.println("第" + (i + 1) + "个文件上传成功");
				manageDSCService.instertimage(did,showFilePath,jxxx);


			} catch (IOException e)
			{
				//				LOGGER.error(e.toString(), e);
				System.out.println("异常");
				return "上传第" + (i++) + "个文件失败";
			}
		}
		return "全部成功";
	}


	@RequestMapping("/getyzm")
	@ResponseBody
	public void getyzm(HttpServletRequest req, HttpServletResponse resp) throws IOException
	{
		resp.setHeader("Pragma", "No-cache");
		resp.setHeader("Cache-Control", "no-cache");
		resp.setDateHeader("Expires", 0);
		resp.setContentType("image/jpeg");

		//生成随机字串
		String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
		//存入会话session
		req.getSession().setAttribute("CODE", verifyCode.toLowerCase());

		//生成图片
		int width = 100;//宽
		int height = 40;//高
		VerifyCodeUtils.outputImage(width, height, resp.getOutputStream(), verifyCode);
	}
}
