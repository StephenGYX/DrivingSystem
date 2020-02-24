package com.drivingsys.service;

import com.drivingsys.bean.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IExamService
{

	public List<Kaoti> selectAll(String kemu);
	public List<Kaoti> selectRand(String kemu);
	public int cuotiAdd(Cuoti cuoti);
	public List<Kaoti>  selectWrong(String cid,String kemu);
	public List<Videoinfo> selectVideo(String subject,String id,String info,String page);
	public int videoCount(String subject, String id, String info);

	public tableParam timuList(String kemu, String iid, String icontent, String page, String limit);
	public int deletekaoti(String kemu,String iid);
	public int updatetimu(String kemu,Kaoti kaoti);
	public int inserttimu(String kemu,Kaoti kaoti);
	public  int insertvideo(String subject,Videoinfo videoinfo);
	public  int updatevideo(Videoinfo videoinfo);
	public int deletevideo(String id);
	public int insertmonirecord(String cid, String testtime,  String score, String kemu);
	public tableParam selectmonirecord(String page,String cid, String kemu);
	public Map selectexamschedule(String cid);


}
