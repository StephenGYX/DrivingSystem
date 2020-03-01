package com.drivingsys.service;

import com.drivingsys.bean.Drivingschool;
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
	public void addpuser(String drivingid,String account, String pass, String sex, int age, String phone, String email, String name, String idcard, String resume, String workexperience)
	{
		backStageMyMapper.addpuser(drivingid,account, pass, sex, age, phone, email, name, idcard, resume, workexperience);
	}

	@Override
	public List<Vehicle> table(Long did,int page,int limit)
	{
		List<Vehicle> vehicles =backStageMyMapper.table(did,page,limit);
		return vehicles;
	}

	@Override
	public List<Vehicle> table1(int page, int limit)
	{
		List<Vehicle> vehicles1 =backStageMyMapper.table1(page,limit);
		return vehicles1;
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
	public void addcar(String num, String brand, String model,String path,Long drivingid)
	{

		backStageMyMapper.addcar(num,brand,model,path,drivingid);
	}

	@Override
	public void backaddcar(String num, String brand, String model, String path)
	{
		backStageMyMapper.backaddcar(num, brand, model, path);
	}

	@Override
	public void updat(String state, String ncarnum, String num,String carbrand,String carmodel)
	{
		backStageMyMapper.updat(state,ncarnum,num,carbrand,carmodel);
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

	@Override
	public int count1(Long did)
	{
		int i=backStageMyMapper.count1(did);
		return i;
	}

	@Override
	public List<Drivingschool> driving()
	{
		List<Drivingschool> drivingschools=backStageMyMapper.driving();
		return drivingschools;
	}


}
