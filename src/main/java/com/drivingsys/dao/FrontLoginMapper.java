package com.drivingsys.dao;

import com.drivingsys.bean.Consumer;
import com.drivingsys.bean.Drivingschool;
import com.drivingsys.bean.Practise;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Mapper
@Repository
public interface FrontLoginMapper
{

	@Select("select * from practise where paccount=#{account} and ppassword=#{password}")
	public Practise queryPractiseAccount(Map<String, String> map);

	@Select("select * from drivingschool where daccount=#{account} and dpassword=#{password}")
	public Drivingschool queryDrivingschool(Map<String, String> map);

	@Select("select * from consumer where caccount=#{account} and cpassword=#{password}")
	public Consumer queryConsumer(Map<String, String> map);

	@Insert("INSERT INTO drivingschool (daccount, dpassword, dname, dcontacts, dtelephone, dphone, demail, dprovince, dcity, darea, dprice, dsynopsis,longitude,latitude,idnumber) " +
			"VALUES (#{daccount}, #{password}, #{dname}, #{dcontacts}, #{phone}, #{phone}, #{email}, #{province}, #{city}, #{county}, #{cost}, #{remark},#{longitude},#{latitude},#{idnumber})")
	public int instertDSC(Map<String, Object> del);
}
