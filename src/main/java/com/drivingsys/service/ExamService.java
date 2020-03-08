package com.drivingsys.service;

import com.drivingsys.bean.*;
import com.drivingsys.dao.KaoshiMapper;
import com.drivingsys.dao.KaotiMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class ExamService implements IExamService
{

	@Autowired
	private KaotiMapper kaotiMapper;
	@Autowired
	private KaoshiMapper kaoshiMapper;
	public String getTablename(String kemu){
		String tableName="";
		if ("ky".equals(kemu)){
			tableName="itembank";
		}else if ("ks".equals(kemu)){
			tableName="ksbank";
		}
		return tableName;
	}
	@Override
	public List<Kaoti> selectAll(String kemu)
	{
		List<Kaoti> kaotis=new ArrayList<>();
		if ("ky".equals(kemu))
		{
			kaotis = kaotiMapper.selectAll();
		}else if ("ks".equals(kemu)){
			kaotis=kaotiMapper.selectAllks();
		}
		System.out.println("考题数量："+kaotis.size());
		return kaotis;
	}

	@Override
	public List<Kaoti> selectRand(String kemu)
	{
		String tableName="";
		if ("1".equals(kemu)){
			tableName = "itembank";
		} else if ("4".equals(kemu))
		{
			tableName = "ksbank";
		}
		List<Kaoti> kaotis=kaotiMapper.selectRand(tableName);
		System.out.println("考题数量："+kaotis.size());
		return kaotis;
	}

	@Override
	public int cuotiAdd(Cuoti cuoti)
	{
		return kaotiMapper.cuotiAdd(cuoti);
	}

	@Override
	public List<Kaoti> selectWrong(String cid,String kemu)
	{
		String tableName=getTablename(kemu);
		return kaotiMapper.selectWrong(cid,kemu,tableName);
	}

	@Override
	public List<Videoinfo> selectVideo(String subject,String id,String info,String page)
	{
		int pageInt;
		String startpage="";
		if (page!=null&&!("").equals(page))
		{
			 pageInt = Integer.valueOf(page);
			startpage=(pageInt-1)*10+""; //计算开始条数
		}

		return kaotiMapper.selectVideo(subject,id,info,startpage);
	}

	@Override
	public int videoCount(String subject, String id, String info)
	{
		return kaotiMapper.videoCount(subject,id,info);
	}

	@Override
	public tableParam timuList(String kemu, String iid, String icontent, String page, String limit)
	{
		int pageInt = Integer.valueOf(page);
		int limitInt = Integer.valueOf(limit);
		int startpage=(pageInt-1)*limitInt; //计算开始条数
		String tableName=getTablename(kemu);
		System.out.println(tableName);
		List<Kaoti> kaotis=kaotiMapper.kaotiList(tableName,iid,icontent,startpage+"",limit);
		int count=kaotiMapper.kaotiCount(tableName,iid,icontent,startpage+"",limit);
		tableParam tableParam=new tableParam();
		tableParam.setCount(count);
		tableParam.setData(kaotis);
		return tableParam;

	}
	@Override
	public int deletekaoti(String kemu,  String iid){
		String tableName=getTablename(kemu);
		return kaotiMapper.deletekaoti(tableName,iid);
	}
	public int updatetimu(String kemu,Kaoti kaoti){
		String tableName=getTablename(kemu);
		kaoti.setTableName(tableName);
		return kaotiMapper.updatetimu(kaoti);
	}

	@Override
	public int inserttimu(String kemu, Kaoti kaoti)
	{
		String tableName=getTablename(kemu);
		kaoti.setTableName(tableName);
		return kaotiMapper.inserttimu(kaoti);

	}

	@Override
	public int updatevideo(Videoinfo videoinfo)
	{
		return kaotiMapper.updatevideo(videoinfo);
	}

	@Override
	public int deletevideo(String id)
	{
		return kaotiMapper.deletevideo(id);
	}

	@Override
	public int insertmonirecord(String cid, String testtime, String score, String kemu)
	{
		return kaoshiMapper.insertmonirecord(cid,testtime,score,kemu);
	}

	@Override
	public tableParam selectmonirecord(String page,String cid, String kemu)
	{
		int pageInt = Integer.valueOf(page);
		int startpage=(pageInt-1)*5; //计算开始条数
		List records= kaoshiMapper.selectmonirecord(cid, kemu,startpage+"");
		int total=kaoshiMapper.selectrecordcount(cid,kemu);
		tableParam tableParam=new tableParam();
		tableParam.setData(records);
		tableParam.setCount(total);
		return tableParam;
	}

	@Override
	public Map selectexamschedule(String cid)
	{
		return kaoshiMapper.selectexamschedule(cid);
	}

	@Override
	public List<Cuotiechart> selectWrongechart(String cid, String kemu)
	{
		return kaotiMapper.selectWrongechart(cid, kemu);
	}


	@Override
	public int insertvideo(String subject, Videoinfo videoinfo)
	{
		videoinfo.setSubject(subject);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=df.format(new Date());
		videoinfo.setAddtime(time);
		return kaotiMapper.insertvideo(videoinfo);
	}

}
