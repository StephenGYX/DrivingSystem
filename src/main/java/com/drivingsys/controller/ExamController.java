package com.drivingsys.controller;

import com.drivingsys.bean.Cuoti;
import com.drivingsys.bean.Kaoti;
import com.drivingsys.service.ExamService;
import com.google.gson.Gson;


import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@RestController
public class ExamController
{
	@Autowired
	private ExamService examService;

	@GetMapping("/bysequence/{kemu}") //这里为空或者是login都能进入该方法
	public List<Kaoti> examBysequence(@PathVariable("kemu") String kemu) {
		System.out.println("!!!");
//		return "keyishunxu";
//		ModelAndView mv=new ModelAndView();
		//String kaotilist=new Gson().toJson(examService.selectAll());
//		JSONArray kaotilist=new JSONArray(examService.selectAll());
//		mv.addObject("kaoti",kaotilist.toString());
//		mv.setViewName("keyishunxu");
		return examService.selectAll(kemu);


	}

	@GetMapping("/byRand") //这里为空或者是login都能进入该方法
	public List<Kaoti> exambyRand() {
		System.out.println("模拟考试");
		return examService.selectRand();
	}
	@PostMapping("/cuotiAdd")
	public int cuotiAdd(@RequestBody Cuoti cuoti) {
		System.out.println(cuoti.getCid()+","+cuoti.getIid());
		System.out.println("错题更新");
		return examService.cuotiAdd(cuoti);

	}
	@RequestMapping(value = "/selectWrong/{cid}/{kemu}",method = {RequestMethod.POST,RequestMethod.GET})
	public List<Kaoti> selectWrong(@PathVariable("cid") String cid,@PathVariable("kemu") String kemu){
		System.out.println(cid+","+kemu);
		return examService.selectWrong(cid,kemu);
	}

}
