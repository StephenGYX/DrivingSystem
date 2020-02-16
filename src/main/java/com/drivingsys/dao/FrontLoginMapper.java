package com.drivingsys.dao;

import com.drivingsys.bean.Backstage;
import com.drivingsys.bean.Practise;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Mapper
@Repository
public interface FrontLoginMapper
{

	@Select("select * from practise where paccount=#{username} and ppassword=#{password}")
	public Practise queryPractiseAccount(Map<String, String> map);
}
