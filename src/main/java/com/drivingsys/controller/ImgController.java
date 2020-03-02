package com.drivingsys.controller;

import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 文件上传
 * @author Stephen
 */
@Controller
@RequestMapping("/image")
public class ImgController {

	@Autowired
	private HttpServletRequest request;

	/**
	 * 图片上传
	 * @param mf
	 * @return
	 */
	@RequestMapping(value ="/upload",method= RequestMethod.POST)
	@ResponseBody
	public Object UpLoadImg(@RequestParam(value="myFileName") MultipartFile mf) {

		String realPath = request.getSession().getServletContext().getRealPath("images/news");

		//获取源文件
		String filename = mf.getOriginalFilename();
		String[] names=filename.split("\\.");
		String tempNum=(int)(Math.random()*100000)+"";
		String uploadFileName=tempNum +System.currentTimeMillis()+"."+names[names.length-1];

		//目标文件
		File targetFile = new File(realPath,uploadFileName);

		//开始从源文件拷贝到目标文件

		//传图片一步到位
		try {
			mf.transferTo(targetFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Map<String, String> map = new HashMap<String, String>();

		//这里应该是项目路径
		map.put("data",request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/images/news/" + uploadFileName);

		//将图片地址返回
		return map;
	}
}
