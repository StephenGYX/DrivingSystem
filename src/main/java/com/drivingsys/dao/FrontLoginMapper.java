package com.drivingsys.dao;

import com.drivingsys.bean.Backstage;
import com.drivingsys.bean.Consumer;
import com.drivingsys.bean.Drivingschool;
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

	@Select("select * from drivingschool where daccount=#{username} and dpassword=#{password}")
	public Drivingschool queryDrivingschool(Map<String, String> map);

	@Select("select * from consumer where caccount=#{username} and cpassword=#{password}")
	public Consumer queryConsumer(Map<String, String> map);
}
