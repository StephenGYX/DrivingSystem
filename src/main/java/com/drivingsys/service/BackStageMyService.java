package com.drivingsys.service;

import com.drivingsys.bean.Vehicle;
import org.springframework.stereotype.Service;

import java.util.List;


public interface BackStageMyService
{

	public void adduser(String account,String pass,String phone,String sex,int age,String name,String email,String idcard,String wechat);
	public void addpuser(String account,String pass,String sex,int age,String phone,String email,String name,String idcard,String resume,String workexperience);
	public List<Vehicle> table(int page,int limit);
	public List<Vehicle> search(String n);
	public void del(String vid);
	public void addcar(String num,String brand,String model);
	public void updat(String state,String driving,String num);
	public int count();
	public List<Vehicle> search1(String d);
}
