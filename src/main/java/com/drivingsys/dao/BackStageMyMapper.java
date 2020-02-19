package com.drivingsys.dao;

import com.drivingsys.bean.Vehicle;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface BackStageMyMapper
{
	@Select("insert into consumer (caccount,cpassword,cphone,csex,cage,cname,cemail,cidcard,cwechat) values(#{account},#{pass},#{phone},#{sex},#{age},#{name},#{email},#{idcard},#{wechat})")
	public void adduser(String account,String pass,String phone,String sex,int age,String name,String email,String idcard,String wechat);
	@Select("insert into practise (paccount,ppassword,psex,page,pphone,pemail,pname,pidcard,presume,pworkexperience) values(#{account},#{pass},#{sex},#{age},#{phone},#{email},#{name},#{idcard},#{resume},#{workexperience})")
	public void addpuser(String account,String pass,String sex,int age,String phone,String email,String name,String idcard,String resume,String workexperience);
	@Select("select * from vehicle")
	public List<Vehicle> table();
}
