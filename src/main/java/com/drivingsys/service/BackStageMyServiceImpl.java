package com.drivingsys.service;

import com.drivingsys.bean.Vehicle;
import com.drivingsys.dao.BackStageMyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("BackStageMyService")
public class BackStageMyServiceImpl implements BackStageMyService
{
	@Autowired
	private BackStageMyMapper backStageMyMapper;

	@Override
	public void adduser(String account,String pass,String phone,String sex,int age,String name,String email,String idcard,String wechat)

	{
		backStageMyMapper.adduser(account,pass,phone,sex,age,name,email,idcard,wechat);
	}

	@Override
	public void addpuser(String account, String pass, String sex, int age, String phone, String email, String name, String idcard, String resume, String workexperience)
	{
		backStageMyMapper.addpuser(account, pass, sex, age, phone, email, name, idcard, resume, workexperience);
	}

	@Override
	public List<Vehicle> table(int page,int limit)
	{
		List<Vehicle> vehicles =backStageMyMapper.table(page,limit);
		return vehicles;
	}

	@Override
	public List<Vehicle> search(String n)
	{
		List<Vehicle> vehicle=backStageMyMapper.search(n);
		return vehicle;
	}

	@Override
	public void del(String vid)
	{
		backStageMyMapper.del(vid);
	}

	@Override
	public void addcar(String num, String brand, String model)
	{
		backStageMyMapper.addcar(num,brand,model);
	}

	@Override
	public void updat(String state, String driving, String num)
	{
		backStageMyMapper.updat(state,driving,num);
	}

	@Override
	public int count()
	{
		int i=backStageMyMapper.count();
		return i;
	}

	@Override
	public List<Vehicle> search1(String d)
	{
		List<Vehicle> vehicle1=backStageMyMapper.search1(d);
		return vehicle1;
	}


}
