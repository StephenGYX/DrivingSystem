package com.drivingsys.controller;

import com.drivingsys.bean.*;
import com.drivingsys.service.ExamService;
import com.google.gson.Gson;


import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


@RestController
public class ExamController
{
	@Autowired
	private ExamService examService;

	@GetMapping("/bysequence/{kemu}")
	public List<Kaoti> examBysequence(@PathVariable("kemu") String kemu) {
		System.out.println("!!!");
		return examService.selectAll(kemu);
	}

	@GetMapping("/byRand/{kemu}")
	public List<Kaoti> exambyRand(@PathVariable("kemu")String kemu) {
		System.out.println("模拟考试");
		return examService.selectRand(kemu);
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
	@RequestMapping(value = "/selectWrongechart/{cid}/{kemu}",method = {RequestMethod.POST,RequestMethod.GET})
	public List<Cuotiechart> selectWrongechart(@PathVariable("cid") String cid,@PathVariable("kemu") String kemu){
		System.out.println(cid+","+kemu);
		return examService.selectWrongechart(cid,kemu);
	}

	@GetMapping("/getVideo/{subject}")
	public List<Videoinfo> selectVideo(@PathVariable String subject){
		System.out.println(subject);
		return examService.selectVideo(subject,"","","");
	}
	@RequestMapping("/insertscore")
	public String insertmonirecord(@RequestBody Map<String, String> params){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String time=df.format(new Date());
		String cid = params.get("cid");
		String score = params.get("score");
		String kemu = params.get("kemu");
		if (examService.insertmonirecord(cid, time, score, kemu) > 0)
		{
			return "succ";
		}else
		{
			return "fail";
		}

	}
	@RequestMapping("/selectScore/{kemu}/{page}/{cid}")
	public tableParam selectmonirecord(@PathVariable("cid") String cid,@PathVariable("kemu") String kemu,@PathVariable("page") String page){
		return examService.selectmonirecord(page, cid, kemu);
	}
	@RequestMapping("/selectExamschedule/{cid}")
	public Map selectExamschedule(@PathVariable("cid") String cid)
	{
		return examService.selectexamschedule(cid);
	}


}
