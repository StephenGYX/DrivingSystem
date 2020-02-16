package com.drivingsys.service;

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
	}

	;

}
