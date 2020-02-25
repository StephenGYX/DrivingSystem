package com.drivingsys.controller;

import com.drivingsys.bean.Cuoti;
import com.drivingsys.bean.Kaoti;
import com.drivingsys.bean.Videoinfo;
import com.drivingsys.bean.tableParam;
import com.drivingsys.service.ExamService;
import com.google.gson.Gson;


import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@RestController
public class TikumanageController
{
	@Autowired
	private ExamService examService;
	@RequestMapping("/timuList/{kemu}")
	public tableParam timuList(@PathVariable String kemu, String iid, String icontent, String page, String limit) {
		System.out.println("题目列表");

		return examService.timuList(kemu,iid,icontent,page,limit);

	}
	@RequestMapping("deletekaoti/{kemu}")
	public String deletekaoti(@PathVariable String kemu, String iid) {
		System.out.println("题目删除");

		if( examService.deletekaoti(kemu,iid)>0){
			return "succ";
		}else {
			return "fail";
		}

	}
	@RequestMapping("updatetimu/{kemu}")
	public String updatetimu(@PathVariable String kemu, Kaoti kaoti) {
		System.out.println("题目更新");
		if (examService.updatetimu(kemu,kaoti)>0){
			return "succ";
		}else {
			return "fail";
		}
	}
	@RequestMapping("inserttimu/{kemu}")
	public String inserttimu(@PathVariable String kemu, Kaoti kaoti) {
		System.out.println("题目插入");
		if (examService.inserttimu(kemu,kaoti)>0){
			return "succ";
		}else {
			return "fail";
		}

	}

	@RequestMapping("insertvideo/{subject}")
	public String insertvideo(@PathVariable String subject, Videoinfo videoinfo) {
		System.out.println("题目插入");
		System.out.println(subject);
		if (examService.insertvideo(subject,videoinfo)>0){
			return "succ";
		}else {
			return "fail";
		}
	}

	@RequestMapping("updatevideo")
	public String deletevideo(Videoinfo videoinfo) {
		System.out.println("视频更新");

		if (examService.updatevideo(videoinfo)>0){
			return "succ";
		}else {
			return "fail";
		}
	}

	@RequestMapping("deletevideo")
	public String deletevideo(String id) {
		System.out.println("视频删除");

		if (examService.deletevideo(id)>0){
			return "succ";
		}else {
			return "fail";
		}
	}

	@RequestMapping("videoList/{subject}")
	public tableParam timuList(@PathVariable String subject, String id,String info,String page) {
		System.out.println("视频列表");
		tableParam tableParam=new tableParam();
		tableParam.setCount(examService.videoCount(subject,id,info));
		tableParam.setData(examService.selectVideo(subject,id,info,page));
		return tableParam;
	}



}
