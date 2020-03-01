package com.drivingsys.service;

import com.drivingsys.bean.Drivingschool;
import com.drivingsys.bean.Log;
import com.drivingsys.bean.Vehicle;

import java.util.List;


public interface BackStageMyService
{

	public void adduser(String account,String pass,String phone,String sex,int age,String name,String email,String idcard,String wechat);
	public void addpuser(String drivingid,String account,String pass,String sex,int age,String phone,String email,String name,String idcard,String resume,String workexperience);
	public List<Vehicle> table(Long did, int page, int limit);
	public List<Vehicle> table1(int page,int limit);
	public List<Vehicle> search(String n);
	public void del(String vid);
	public void addcar(String num,String brand,String model,String path,Long drivingid);
	public void backaddcar(String num,String brand,String model,String path);
	public void updat(String state,String ncarnum,String num,String carbrand,String carmodel);
	public int count();
	public List<Vehicle> search1(String d);
	public int count1(Long did);
	//查看所有驾校名称
	public List<Drivingschool> driving();
}
