package com.drivingsys.service;

import com.drivingsys.bean.Cuoti;
import com.drivingsys.bean.Kaoti;
import com.drivingsys.dao.KaotiMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ExamService implements IExamService
{

	@Autowired
	private KaotiMapper kaotiMapper;
	@Override
	public List<Kaoti> selectAll(String kemu)
	{
		List<Kaoti> kaotis=new ArrayList<>();
		if ("ky".equals(kemu))
		{
			kaotis = kaotiMapper.selectAll();
		}else if ("ks".equals(kemu)){
			kaotis=kaotiMapper.selectAllks();
		}
		System.out.println("考题数量："+kaotis.size());
		return kaotis;
	}

	@Override
	public List<Kaoti> selectRand()
	{
		List<Kaoti> kaotis=kaotiMapper.selectRand();
		System.out.println("考题数量："+kaotis.size());
		return kaotis;
	}

	@Override
	public int cuotiAdd(Cuoti cuoti)
	{
		return kaotiMapper.cuotiAdd(cuoti);
	}

	@Override
	public List<Kaoti> selectWrong(String cid,String kemu)
	{
		String tableName="";
		if ("ky".equals(kemu)){
			tableName="itembank";
		}else if ("ks".equals(kemu)){
			tableName="ksbank";
		}
		return kaotiMapper.selectWrong(cid,kemu,tableName);
	}
}
