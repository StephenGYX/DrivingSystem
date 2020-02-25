package com.drivingsys.dao;

import com.drivingsys.bean.Cuoti;
import com.drivingsys.bean.Kaoti;
import com.drivingsys.bean.Videoinfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface KaotiMapper
{
	public List<Kaoti> selectAll();
	public List<Kaoti> selectAllks();
	public List<Kaoti> selectRand(String tableName);
	public int cuotiAdd(Cuoti cuoti);
	public List<Kaoti>  selectWrong(@Param("cid") String cid,@Param("kemu")String kemu,@Param("tableName")String tableName);
	public List<Videoinfo> selectVideo(@Param("subject") String subject,@Param("id") String id,@Param("info") String info,@Param("start") String start);
	public List<Kaoti> kaotiList(@Param("tableName")String tableName,@Param("iid") String iid,@Param("icontent") String icontent,@Param("start") String start,@Param("limit") String limit);
	public int kaotiCount(@Param("tableName")String tableName,@Param("iid") String iid,@Param("icontent") String icontent,@Param("start") String start,@Param("limit") String limit);
	public int deletekaoti(@Param("tableName")String tableName,@Param("iid") String iid);
	public int updatetimu(Kaoti kaoti);
	public int inserttimu(Kaoti kaoti);
	public int insertvideo(Videoinfo videoinfo);
	public int videoCount(@Param("subject") String subject,@Param("id") String id,@Param("info") String info);
	public  int updatevideo(Videoinfo videoinfo);
	public int deletevideo(String id);

}
