package com.drivingsys.service;

import com.drivingsys.bean.Practise;
import com.drivingsys.dao.BackMenuMapper;
import com.drivingsys.dao.BackPractiseManageMapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class BackPractiseManageServiceImpl implements  BackPractiseManageService
{

	@Autowired
	private BackPractiseManageMapper backPractiseManageMapper;
	@Override
	public List<Practise> queryAllCoach(RowBounds rb,HashMap selectParam)
	{
		return backPractiseManageMapper.queryAllCoach(rb,selectParam);
	}

	@Override
	public long queryAllCoachCount(HashMap selectParam)
	{
		return backPractiseManageMapper.queryAllCoachCount(selectParam);
	}
}
