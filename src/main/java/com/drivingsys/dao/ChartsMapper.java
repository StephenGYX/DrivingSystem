package com.drivingsys.dao;

import com.drivingsys.bean.echarsParam;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface ChartsMapper
{
    //查询每个用户的教练
	public List<echarsParam> queryStudentByCoach();


}
