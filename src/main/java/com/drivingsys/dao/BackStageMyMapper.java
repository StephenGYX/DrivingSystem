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
	@Select("select * from vehicle where (vcarstate='正常' or vcarstate='维修中' or vcarstate='使用中') and vdrivingid=(select did from drivingschool where did=#{did}) limit  #{page,jdbcType=INTEGER},#{limit,jdbcType=INTEGER} ")
	public List<Vehicle> table(Long did,int page,int limit);
	@Select("select * from vehicle where vcarstate='正常' or vcarstate='维修中' or vcarstate='使用中' limit  #{page,jdbcType=INTEGER},#{limit,jdbcType=INTEGER} ")
	public List<Vehicle> table1(int page,int limit);
	@Select("select * from vehicle where vcarnum=#{n}")
	public List<Vehicle> search(String n);
	@Select("select * from vehicle where vdrivingid=#{d}")
	public List<Vehicle> search1(String d);
	@Select("update vehicle set vcarstate='报废' where vid=#{vid}")
	public void del(String vid);
	@Select("insert into vehicle (vcarnum,vbrand,vmodel,vcarstate) values(#{num},#{brand},#{model},'正常')")
	public void addcar(String num,String brand,String model);
	@Select("update vehicle set vcarstate=#{state},vdrivingid=#{driving} where vcarnum=#{num}")
	public void updat(String state,String driving,String num);
	@Select("select count(vid) from vehicle")
	public int count();
}
