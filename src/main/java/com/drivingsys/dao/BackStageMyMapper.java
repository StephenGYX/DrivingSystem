package com.drivingsys.dao;

import com.drivingsys.bean.*;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface BackStageMyMapper
{
	//学员注册
	@Select("insert into consumer (caccount,cpassword,cphone,csex,cage,cname,cemail,cidcard,rid,cstate,cwechat) values(#{account},#{pass},#{phone},#{sex},#{age},#{name},#{email},#{idcard},4,1,#{wechat})")
	public void adduser(String account,String pass,String phone,String sex,int age,String name,String email,String idcard,String wechat);
	//查找所有学员账号，判断是否存在
	@Select("select caccount from consumer")
	public List<Consumer> selectallc();
	//教练注册
	@Select("insert into practise (pdrivingid,paccount,ppassword,psex,page,pphone,pemail,pname,pidcard,presume,pworkexperience,rid,paccountstate,pidimage) values(#{drivingid},#{account},#{pass},#{sex},#{age},#{phone},#{email},#{name},#{idcard},#{resume},#{workexperience},3,1,#{pidimage})")
	public void addpuser(String drivingid,String account,String pass,String sex,int age,String phone,String email,String name,String idcard,String resume,String workexperience,String pidimage);
//	@Select("insert into practise (pdrivingid,paccount,ppassword,psex,page,pphone,pemail,pname,pidcard,presume,pworkexperience,pidimage) values(#{drivingid},#{account},#{pass},#{sex},#{age},#{phone},#{email},#{name},#{idcard},#{resume},#{workexperience},#{pidimage})")
//	public void addpuser(String drivingid,String account,String pass,String sex,int age,String phone,String email,String name,String idcard,String resume,String workexperience,String pidimage);
	//驾校端查看教练车
	@Select("select * from vehicle where (vcarstate='正常' or vcarstate='维修中' or vcarstate='使用中') and vdrivingid=(select did from drivingschool where did=#{did}) limit  #{page,jdbcType=INTEGER},#{limit,jdbcType=INTEGER} ")
	public List<Vehicle> table(Long did,int page,int limit);
	//后台端查看教练车
	@Select("select * from vehicle where vcarstate='正常' or vcarstate='维修中' or vcarstate='使用中' limit  #{page,jdbcType=INTEGER},#{limit,jdbcType=INTEGER} ")
	public List<Vehicle> table1(int page,int limit);
	//搜索车牌
	@Select("select * from vehicle where vcarnum=#{n}")
	public List<Vehicle> search(String n);
	@Select("select * from vehicle where vdrivingid=#{d}")
	public List<Vehicle> search1(String d);
	//搜索品牌
	@Select("select * from vehicle where vbrand=#{brand}")
	public List<Vehicle> searchbrand(String brand);
	//搜索车型
	@Select("select * from vehicle where vmodel=#{model}")
	public List<Vehicle> searchmodel(String model);
	//驾校端删除车辆
	@Select("update vehicle set vcarstate='报废' where vid=#{vid}")
	public void del(String vid);
	//驾校端添加车辆
	@Select("insert into vehicle (vcarnum,vbrand,vmodel,vphoto,vdrivingid,vcarstate) values(#{num},#{brand},#{model},#{path},#{drivingid},'正常')")
	public void addcar(String num,String brand,String model,String path,Long drivingid);
	//驾校端上传车辆图片
	@Select("insert into vehicle (vcarnum,vbrand,vmodel,vphoto,vcarstate) values(#{num},#{brand},#{model},#{path},'正常')")
	public void backaddcar(String num,String brand,String model,String path);
	//修改车辆信息
	@Select("update vehicle set vcarstate=#{state},vcarnum=#{ncarnum},vbrand=#{carbrand},vmodel=#{carmodel} where vcarnum=#{num}")
	public void updat(String state,String ncarnum,String num,String carbrand,String carmodel);
	@Select("select count(vid) from vehicle where (vcarstate='正常' or vcarstate='维修中' or vcarstate='使用中')")
	//驾校端表格总条数
	public int count();
	//后台端表格总条数
	@Select("select count(vid) from vehicle where vdrivingid=(select did from drivingschool where did=#{did}) and (vcarstate='正常' or vcarstate='维修中' or vcarstate='使用中')")
	public int count1(Long did);
	//驾校端搜索车牌总条数
	@Select("select count(vid) from vehicle where vcarnum=#{num} and (vcarstate='正常' or vcarstate='维修中' or vcarstate='使用中')")
	public int countnum(String num);
	//驾校端搜索品牌总条数
	@Select("select count(vid) from vehicle where vbrand=#{brand} and (vcarstate='正常' or vcarstate='维修中' or vcarstate='使用中')")
	public int countbrand(String brand);
	//驾校端搜索型号总条数
	@Select("select count(vid) from vehicle where vmodel=#{model} and (vcarstate='正常' or vcarstate='维修中' or vcarstate='使用中')")
	public int countmodel(String model);
	//教练注册选择驾校
	@Select("select did,dname from drivingschool")
	public List<Drivingschool> driving();
	//管理员用户
	@Select("select * from backstage limit  #{page,jdbcType=INTEGER},#{limit,jdbcType=INTEGER} ")
	public List<Backstage> tableall(int page, int limit);
	//删除普通管理员
	@Select("update backstage set bstate='2' where bid=#{bid}")
	public void backdel(String bid);
	//禁用
	@Select("update backstage set bstate='0' where bid=#{bid}")
	public void stop(String bid);
	//启用
	@Select("update backstage set bstate='1' where bid=#{bid}")
	public void start(String bid);
	//重置密码
	@Select("update backstage set bpassword='123456' where bid=#{bid}")
	public void edit(String bid);
	//添加管理员
	@Select("insert into backstage (baccount,bpassword,bname,rid,bstate) values(#{bacc},#{bpass},#{bname},#{bstate},1)")
	public void addbackuser(String bacc,String bpass,String bname,String bstate);
	//管理员总条数
	@Select("select count(bid) from backstage")
	public int backcount();
	//搜索管理员账号
	@Select("select * from (select * from backstage where baccount=#{bacc}) a,(select count(bid) as c from backstage where baccount=#{bacc}) b")
	public List<Backstage> backsearchacc(String bacc);
	//搜索管理员名称
	@Select("select * from (select * from backstage where bname=#{bacc}) a,(select count(bid) as c from backstage where bname=#{bacc}) b ")
	public List<Backstage> backsearchname(String bname);
	//搜索管理员状态
	@Select("select * from (select * from backstage where bstate=#{bacc}) a,(select count(bid) as c from backstage where bstate=#{bacc}) b ")
	public List<Backstage> backsearchstate(String bstate);

	//查看教练信息
	@Select("select pname,pphoto,pphone,pemail,pidcard,presume from practise where pid=#{pid}")
	public List<Practise> selectavatar(Long pid);

	//修改教练头像
	@Select("update practise set pphoto=#{avatar} where pid=#{pid}")
	public void updateavatar(String avatar,Long pid);
	//修改教练名称
	@Select("update practise set pname=#{updatename} where pid=#{pid}")
	public void updatename(String updatename,Long pid);
	//修改教练密码
	@Select("update practise set ppassword=#{updatepass} where pid=#{pid}")
	public void updatepass(String updatepass,Long pid);
	//修改教练手机
	@Select("update practise set pphone=#{updatephone} where pid=#{pid}")
	public void updatephone(String updatephone,Long pid);
	//修改邮箱
	@Select("update practise set pemail=#{updateemail} where pid=#{pid}")
	public void updateemail(String updateemail,Long pid);
	//修改身份证
	@Select("update practise set pidcard=#{updateidcard} where pid=#{pid}")
	public void updateidcard(String updateidcard,Long pid);
	//修改个人简介
	@Select("update practise set presume=#{updateresume} where pid=#{pid}")
	public void updateresume(String updateresume,Long pid);




	//搜索某个驾校下的所有教练
	@Select("select c.pname,ifnull(count,0) as pcount from (select * from (select pid,pname from practise ) as a left join (select count(cid) as count,cpritiseid from consumer where cpritiseid in (select pid from practise)  group by cpritiseid) as b on  a.pid=b.cpritiseid) as c")
	public List<Practise> chart();
	//搜索某个驾校下所有车辆
	@Select("select count(vid) as pcount,ifnull(vcarstate,'正常')as vcarstate from vehicle where vcarstate='正常' union select count(vid),ifnull(vcarstate,'使用中')as vcarstate from vehicle where  vcarstate='使用中' union select count(vid),ifnull(vcarstate,'维修中')as vcarstate from vehicle where  vcarstate='维修中' union  select count(vid),ifnull(vcarstate,'报废')as vcarstate from vehicle where  vcarstate='报废'")
	public List<Vehicle> vehiclechart();
}
