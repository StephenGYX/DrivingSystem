package com.drivingsys.service;

import com.drivingsys.bean.*;

import java.util.List;
import java.util.Map;


public interface BackStageMyService
{

	public void adduser(String account,String pass,String phone,String sex,int age,String name,String email,String idcard,String wechat);
	public List<Consumer> selectallc();
	public void addpuser(String drivingid,String account,String pass,String sex,int age,String phone,String email,String name,String idcard,String resume,String workexperience);
	public List<Vehicle> table(Long did, int page, int limit);
	public List<Vehicle> table1(int page,int limit);
	public List<Vehicle> search(String n);
	public List<Vehicle> searchbrand(String brand);
	public List<Vehicle> searchmodel(String model);
	public void del(String vid);
	public void addcar(String num,String brand,String model,String path,Long drivingid);
	public void backaddcar(String num,String brand,String model,String path);
	public void updat(String state,String ncarnum,String num,String carbrand,String carmodel);
	public int count();
	public List<Vehicle> search1(String d);
	public int count1(Long did);
	public int countnum(String num);
	public int countbrand(String brand);
	public int countmodel(String model);
	//查看所有驾校名称
	public List<Drivingschool> driving();
	public List<Backstage> tableall(int page, int limit);
	public void backdel(String bid);
	public void stop(String bid);
	public void start(String bid);
	public void edit(String bid);
	public void addbackuser(String bacc,String bpass,String bname,String bstate);
	public int backcount();
	public List<Backstage> backsearchacc(String bacc);
	public List<Backstage> backsearchname(String bname);
	public List<Backstage> backsearchstate(String bstate);
	public List<Practise> selectavatar(Long pid);
	public void updateavatar(String avatar,Long pid);
	public void updatename(String updatename,Long pid);
	public void updatepass(String updatepass,Long pid);
	public void updatephone(String updatephone,Long pid);
	public void updateemail(String updateemail,Long pid);
	public void updateidcard(String updateidcard,Long pid);
	public void updateresume(String updateresume,Long pid);
	public List<Practise> chart(Long did);
}
