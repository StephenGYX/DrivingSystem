package com.drivingsys.service;

import com.drivingsys.dao.UserinfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@Service
public class UserinfoService implements IUserinfoService
{
	@Autowired
	public UserinfoMapper userinfoMapper;
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@Override
	public int updateuserface(String cid, String facetoken)
	{
		return userinfoMapper.updateuserface(cid,facetoken);
	}

	@Override
	public String selectFacetoken(String cid)
	{
		return userinfoMapper.selectFacetoken(cid);
	}

	@Override
	public int selectkemunow(String cid)
	{
		return userinfoMapper.selectkemunow(cid);
	}

	@Override
	public int updateclasshour(String cid, String kemunow, String totaltime)
	{
		return userinfoMapper.updateClasshour(cid, kemunow, totaltime);


	}
	public Map selectclasshours(String cid){
		return userinfoMapper.selectclasshours(cid);
	}

	@Override
	public Map selectdrivingschool(String cid)
	{
		return userinfoMapper.selectdrivingschool(cid);
	}

	@Override
	public Map selectorderstate(String cid,String type)
	{
		Map map=null;
		if (type.equals("school"))
		{
			map= userinfoMapper.selectorderstate(cid);
		} else if ("coach".equals(type))
		{
			map= userinfoMapper.selectcoachrated(cid);
		}
		return map;
	}

	@Override
	public int updaterate(String cid, String score, String content,String type)
	{
		String time=df.format(new Date());
		if ("school".equals(type)){
			return userinfoMapper.updateschoolrate(cid, score, content,time);
		}else {
			return userinfoMapper.updatecoachrate(cid,score,content,time);
		}
	}
	public String selectcoach(String cid){
		return userinfoMapper.selectcoach(cid);
	}

}
