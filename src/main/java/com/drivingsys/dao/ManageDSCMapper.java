package com.drivingsys.dao;

import com.drivingsys.bean.Drivingschool;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Mapper
@Repository
public interface ManageDSCMapper
{
	//查询所有驾校
	public List<Drivingschool>queryDSC(Map<String,Object> reqMap, RowBounds rb);

	public int delDSC(List<Drivingschool>del);
}
