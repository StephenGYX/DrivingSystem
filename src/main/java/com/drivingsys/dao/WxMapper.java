package com.drivingsys.dao;

import com.drivingsys.bean.Monirecord;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface WxMapper
{
	public Map selectUserinfo(String account);
	public List<Monirecord> selectmonirecord(@Param("cid") String cid, @Param("kemu") String kemu);
}
