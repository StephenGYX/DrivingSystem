package com.drivingsys.dao;

import com.drivingsys.bean.Practise;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface DrivingSchoolManageMapper
{

	//查询本驾校的教练
	public List<Practise> queryCoachByMySchool(@Param("pdrivingid") long pdrivingid, RowBounds rb) ;
	public Long queryCoachByMySchoolCount(@Param("pdrivingid") long pdrivingid) ;


}
