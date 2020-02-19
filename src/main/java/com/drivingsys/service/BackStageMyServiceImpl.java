package com.drivingsys.service;

import com.drivingsys.bean.Vehicle;
import com.drivingsys.dao.BackStageUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("BackStageUserService")

public class BackStageMyServiceImpl implements BackStageUserService
{
	@Autowired
	private BackStageUserMapper backStageUserMapper;




	@Override
	public void adduser(String account,String pass,String phone,String sex,int age,String name,String email,String idcard,String wechat)

	{
		backStageUserMapper.adduser(account,pass,phone,sex,age,name,email,idcard,wechat);
	}

	@Override
	public void addpuser(String account, String pass, String sex, int age, String phone, String email, String name, String idcard, String resume, String workexperience)
	{
		backStageUserMapper.addpuser(account, pass, sex, age, phone, email, name, idcard, resume, workexperience);
	}

	@Override
	public List<Vehicle> table()
	{
		List<Vehicle> vehicles =backStageUserMapper.table();
		return vehicles;
	}


}
