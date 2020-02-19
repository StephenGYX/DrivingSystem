package com.drivingsys.dao;

import com.drivingsys.bean.Cuoti;
import com.drivingsys.bean.Kaoti;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface KaotiMapper
{
	public List<Kaoti> selectAll();
	public List<Kaoti> selectAllks();
	public List<Kaoti> selectRand();
	public int cuotiAdd(Cuoti cuoti);
	public List<Kaoti>  selectWrong(@Param("cid") String cid,@Param("kemu")String kemu,@Param("tableName")String tableName);
}
