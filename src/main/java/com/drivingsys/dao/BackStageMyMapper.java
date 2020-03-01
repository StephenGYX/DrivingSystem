package com.drivingsys.dao;

import com.drivingsys.bean.Drivingschool;
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
	@Select("insert into practise (pdrivingid,paccount,ppassword,psex,page,pphone,pemail,pname,pidcard,presume,pworkexperience) values(#{drivingid},#{account},#{pass},#{sex},#{age},#{phone},#{email},#{name},#{idcard},#{resume},#{workexperience})")
	public void addpuser(String drivingid,String account,String pass,String sex,int age,String phone,String email,String name,String idcard,String resume,String workexperience);
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
	@Select("insert into vehicle (vcarnum,vbrand,vmodel,vphoto,vdrivingid,vcarstate) values(#{num},#{brand},#{model},#{path},#{drivingid},'正常')")
	public void addcar(String num,String brand,String model,String path,Long drivingid);
	@Select("insert into vehicle (vcarnum,vbrand,vmodel,vphoto,vcarstate) values(#{num},#{brand},#{model},#{path},'正常')")
	public void backaddcar(String num,String brand,String model,String path);
	@Select("update vehicle set vcarstate=#{state},vcarnum=#{ncarnum},vbrand=#{carbrand},vmodel=#{carmodel} where vcarnum=#{num}")
	public void updat(String state,String ncarnum,String num,String carbrand,String carmodel);
	@Select("select count(vid) from vehicle where (vcarstate='正常' or vcarstate='维修中' or vcarstate='使用中')")
	public int count();
	@Select("select count(vid) from vehicle where vdrivingid=(select did from drivingschool where did=#{did}) and (vcarstate='正常' or vcarstate='维修中' or vcarstate='使用中')")
	public int count1(Long did);
	@Select("select * from drivingschool group by dname")
	public List<Drivingschool> driving();
}
