package com.drivingsys.service;

import java.util.Map;

public interface IUserinfoService
{
	public int updateuserface(String cid,String facetoken);
	public String selectFacetoken(String cid);
	public int selectkemunow(String cid);
	public int updateclasshour(String cid,String kemunow,String totaltime);
	public Map selectclasshours(String cid);
	public Map selectdrivingschool(String cid);
	public Map selectorderstate(String cid,String type);
	public int updaterate(String cid,String score,String content,String type);
	public String selectcoach(String cid);
	public Map selectschoolpoint(String cid);

}
