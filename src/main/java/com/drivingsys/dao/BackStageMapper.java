package com.drivingsys.dao;

import com.drivingsys.bean.Backstage;

import com.drivingsys.bean.Practise;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * @author Stephen
 * @create 2020/02/15 16:35
 */

@Mapper
@Repository
public interface BackStageMapper
{
	@Select("select * from backstage where baccount=#{account} and bpassword=#{password}")
	public Backstage queryBackStageAccount(Map<String,String> map);

}
