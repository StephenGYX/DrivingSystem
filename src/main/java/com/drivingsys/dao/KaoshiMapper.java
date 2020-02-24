package com.drivingsys.dao;

import com.drivingsys.bean.Cuoti;
import com.drivingsys.bean.Kaoti;
import com.drivingsys.bean.Monirecord;
import com.drivingsys.bean.Videoinfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface KaoshiMapper
{
	public int insertmonirecord(@Param("cid") String cid, @Param("testtime") String testtime, @Param("score") String score, @Param("kemu") String kemu);

	public List<Monirecord> selectmonirecord(@Param("cid") String cid, @Param("kemu") String kemu, @Param("start") String start);

	public int selectrecordcount(@Param("cid") String cid, @Param("kemu") String kemu);

	public Map selectexamschedule(@Param("cid") String cid);
}
