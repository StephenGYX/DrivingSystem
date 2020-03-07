package com.drivingsys.controller;

import com.drivingsys.bean.Drivingschool;
import com.drivingsys.bean.SendSignHttpsClient;
import com.drivingsys.bean.Vehicle;
import com.drivingsys.bean.backmsg;
import com.drivingsys.service.BackStageMyServiceImpl;
import com.google.gson.Gson;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 测试
 */
@Controller
@RequestMapping("/tuling/")
public class TulingController
{
	@RequestMapping(value = "get",produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	@CrossOrigin(origins = "*")
	public String get(@RequestBody String json, HttpServletRequest request, HttpServletResponse response) {
		//		LOGGER.info("test");
		System.out.println("进入到图灵接口方法");
		try
		{
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		System.out.println("httpclienct test");
		System.out.println(json);


		JSONObject jsonObject =
				SendSignHttpsClient.doPostForJson("http://openapi.tuling123.com/openapi/api/v2",json);
		JSONArray o = (JSONArray)jsonObject.get("results");
		JSONObject A=(JSONObject)o.get(0);
		JSONObject B=(JSONObject)A.get("values");
		System.out.println(B.getString("text"));
//		return jsonObject;
				return B.getString("text");
	}

}

