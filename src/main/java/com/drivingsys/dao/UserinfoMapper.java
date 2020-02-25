package com.drivingsys.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

@Mapper
public interface UserinfoMapper
{
	public int updateuserface(@Param("cid") String cid,@Param("facetoken")  String facetoken);
	public String selectFacetoken(String cid);
	public int selectkemunow(String cid);
	public int updateClasshour(@Param("cid") String cid,@Param("kemunow")  String kemunow,@Param("totaltime")String totaltime);

	public Map selectclasshours(String cid);
	public Map selectdrivingschool(String cid);
	public int updateschoolrate(@Param("cid")String cid,@Param("score")String score,@Param("content")String content,@Param("time")String time);

	public int updatecoachrate(@Param("cid") String cid, @Param("score") String score, @Param("content") String content,@Param("time")String time);
	public Map selectorderstate(String cid);
	public Map selectcoachrated(String cid);

	public String selectcoach(String cid);

}
