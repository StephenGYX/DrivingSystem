package com.drivingsys.controller;

import com.drivingsys.bean.FileUploadMsg;
import com.drivingsys.bean.Workbuttonlink;
import com.drivingsys.service.ButtonLinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 底部链接信息控制类
 * @author Stephen
 */
@Controller
@RequestMapping("/buttonlink")
public class ButtonLinkController
{
	@Autowired
	private ButtonLinkService buttonLinkService;

	@RequestMapping("/queryButtonLink")
	public String queryButtonLink( HttpServletRequest request){
		Workbuttonlink workbuttonlink = buttonLinkService.queryButtonLink();
		request.getSession().setAttribute("workbuttonlink",workbuttonlink);
		return "fileupload";
	}

	@RequestMapping("/updateButtonLink")
	public FileUploadMsg updateButtonLink(@RequestParam Map<String, String> reqMap, MultipartFile file, HttpServletRequest request) throws IOException
	{
		System.out.println(reqMap.toString());

		//获取文件上传的位置:这里文件上传的路径无法确保在工程目录下(所以需要获取tomcat服务器下的路径)
		String path = request.getSession().getServletContext().getRealPath("/images");

		//判断该文件夹是否存在，若不存在则创建一个新文件夹
		File fileact = new File(path);
		if (!fileact.exists())
		{
			boolean mkdir = fileact.mkdir();
		}

		//整合新的文件路径，并且写出到本地
		String filePath = path + "\\" + file.getOriginalFilename();
		String showFilePath = "\\images\\"+file.getOriginalFilename();
		file.transferTo(new File(filePath));
		reqMap.put("workimage",showFilePath);

		//更新数据库中的底部链接数据
		buttonLinkService.updateButtonLink(reqMap);

		//layui规定返回的的response数据
		FileUploadMsg fileUploadMsg = new FileUploadMsg();
		HashMap<String,String> data = new HashMap<>();
		data.put("src",filePath);
		fileUploadMsg.setData(data);
		return fileUploadMsg;
	}
}
