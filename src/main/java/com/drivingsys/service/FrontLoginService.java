package com.drivingsys.service;

import com.drivingsys.bean.Consumer;
import com.drivingsys.bean.Drivingschool;
import com.drivingsys.bean.Practise;
import com.drivingsys.dao.FrontLoginMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service
public class FrontLoginService
{
	@Resource
	private FrontLoginMapper frontLoginMapper;

	public Practise queryPractiseAccount(Map<String, String> map)
	{
		return frontLoginMapper.queryPractiseAccount(map);
	};

	public Drivingschool queryDrivingschool(Map<String, String> map)
	{return frontLoginMapper.queryDrivingschool(map);};

	public Consumer queryConsumer(Map<String, String> map)
	{return frontLoginMapper.queryConsumer(map);}

	public int instertDSC(Map<String, Object> del)
	{
		return frontLoginMapper.instertDSC(del);
	}
}
