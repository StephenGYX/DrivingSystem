package com.drivingsys.service;

import com.drivingsys.bean.*;
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
	public void adduser(String account, String pass, String phone, String sex, int age, String name, String email, String idcard, String wechat)

	{
		backStageMyMapper.adduser(account, pass, phone, sex, age, name, email, idcard, wechat);
	}

	//	@Override
	//
	//	public void addpuser(String drivingid,String account, String pass, String sex, int age, String phone, String email, String name, String idcard, String resume, String workexperience,String pidimage)

	@Override
	public List<Consumer> selectallc()
	{
		List<Consumer> consumers = backStageMyMapper.selectallc();
		return consumers;
	}

	@Override
	public void addpuser(String drivingid, String account, String pass, String sex, int age, String phone, String email, String name, String idcard, String resume, String workexperience, String pidimage)

	{
		backStageMyMapper.addpuser(drivingid, account, pass, sex, age, phone, email, name, idcard, resume, workexperience, pidimage);
	}

	@Override
	public List<Vehicle> table(Long did, int page, int limit)
	{
		List<Vehicle> vehicles = backStageMyMapper.table(did, page, limit);
		return vehicles;
	}

	@Override
	public List<Vehicle> table1(int page, int limit)
	{
		List<Vehicle> vehicles1 = backStageMyMapper.table1(page, limit);
		return vehicles1;
	}

	@Override
	public List<Vehicle> search(String n)
	{
		List<Vehicle> vehicle = backStageMyMapper.search(n);
		return vehicle;
	}

	@Override
	public List<Vehicle> searchbrand(String brand)
	{
		List<Vehicle> vehicles = backStageMyMapper.searchbrand(brand);
		return vehicles;
	}

	@Override
	public List<Vehicle> searchmodel(String model)
	{
		List<Vehicle> vehicles = backStageMyMapper.searchmodel(model);
		return vehicles;
	}

	@Override
	public void del(String vid)
	{
		backStageMyMapper.del(vid);
	}

	@Override
	public void addcar(String num, String brand, String model, String path, Long drivingid)
	{

		backStageMyMapper.addcar(num, brand, model, path, drivingid);
	}

	@Override
	public void backaddcar(String num, String brand, String model, String path)
	{
		backStageMyMapper.backaddcar(num, brand, model, path);
	}

	@Override
	public void updat(String state, String ncarnum, String num, String carbrand, String carmodel)
	{
		backStageMyMapper.updat(state, ncarnum, num, carbrand, carmodel);
	}

	@Override
	public int count()
	{
		int i = backStageMyMapper.count();
		return i;
	}

	@Override
	public List<Vehicle> search1(String d)
	{
		List<Vehicle> vehicle1 = backStageMyMapper.search1(d);
		return vehicle1;
	}

	@Override
	public int count1(Long did)
	{
		int i = backStageMyMapper.count1(did);
		return i;
	}

	@Override
	public int countnum(String num)
	{
		int i = backStageMyMapper.countnum(num);
		return i;
	}

	@Override
	public int countbrand(String brand)
	{
		int i = backStageMyMapper.countbrand(brand);
		return i;

	}

	@Override
	public int countmodel(String model)
	{
		int i = backStageMyMapper.countmodel(model);
		return i;
	}

	@Override
	public List<Drivingschool> driving()
	{
		List<Drivingschool> drivingschools = backStageMyMapper.driving();
		return drivingschools;
	}

	@Override
	public List<Backstage> tableall(int page, int limit)
	{
		List<Backstage> objects = backStageMyMapper.tableall(page, limit);
		return objects;
	}

	@Override
	public void backdel(String bid)
	{
		backStageMyMapper.backdel(bid);
	}

	@Override
	public void stop(String bid)
	{
		backStageMyMapper.stop(bid);
	}

	@Override
	public void start(String bid)
	{
		backStageMyMapper.start(bid);
	}

	@Override
	public void edit(String bid)
	{
		backStageMyMapper.edit(bid);
	}

	@Override
	public void addbackuser(String bacc, String bpass, String bname, String bstate)
	{
		backStageMyMapper.addbackuser(bacc, bpass, bname, bstate);
	}

	@Override
	public int backcount()
	{
		int i = backStageMyMapper.backcount();
		return i;
	}

	@Override
	public List<Backstage> backsearchacc(String bacc)
	{
		List<Backstage> backstages = backStageMyMapper.backsearchacc(bacc);
		return backstages;
	}

	@Override
	public List<Backstage> backsearchname(String bname)
	{
		List<Backstage> backstages = backStageMyMapper.backsearchname(bname);
		return backstages;
	}

	@Override
	public List<Backstage> backsearchstate(String bstate)
	{
		List<Backstage> backstages = backStageMyMapper.backsearchstate(bstate);
		return backstages;
	}

	@Override
	public List<Practise> selectavatar(Long pid)
	{
		List<Practise> msg = backStageMyMapper.selectavatar(pid);
		return msg;
	}

	@Override
	public void updateavatar(String avatar, Long pid)
	{
		backStageMyMapper.updateavatar(avatar, pid);
	}

	@Override
	public void updatename(String updatename, Long pid)
	{
		backStageMyMapper.updatename(updatename, pid);
	}

	@Override
	public void updatepass(String updatepass, Long pid)
	{
		backStageMyMapper.updatepass(updatepass, pid);
	}

	@Override
	public void updatephone(String updatephone, Long pid)
	{
		backStageMyMapper.updatephone(updatephone, pid);
	}

	@Override
	public void updateemail(String updateemail, Long pid)
	{
		backStageMyMapper.updateemail(updateemail, pid);
	}

	@Override
	public void updateidcard(String updateidcard, Long pid)
	{
		backStageMyMapper.updateidcard(updateidcard, pid);
	}

	@Override
	public void updateresume(String updateresume, Long pid)
	{
		backStageMyMapper.updateresume(updateresume, pid);
	}


}
