package com.drivingsys.controller;

import com.drivingsys.bean.tableParam;
import com.drivingsys.service.WxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class WxController
{
	@Autowired
	WxService wxService;
	@RequestMapping("/login")
	public Map login(@RequestBody Map<String, String> params){
		String pwd = params.get("pwd");
		String account = params.get("account");
		String result=wxService.login(account,pwd);
		Map map=new HashMap();
		if ("".equals(result)){
			map.put("result","fail");

		}else {
			map.put("result", "succ");
			map.put("cid",result);
		}
		return map;
	}

	@RequestMapping("/getmonirecord/{kemu}/{cid}")
	public List selectmonirecord(@PathVariable("cid") String cid, @PathVariable("kemu") String kemu){
		return wxService.selectmonirecord( cid, kemu);
	}

}
