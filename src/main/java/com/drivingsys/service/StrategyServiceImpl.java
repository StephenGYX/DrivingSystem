package com.drivingsys.service;

import com.drivingsys.bean.Journalism;
import com.drivingsys.bean.Strategy;
import com.drivingsys.dao.NewsMapper;
import com.drivingsys.dao.StrategyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 新闻资讯业务实现类
 * @author Stephen
 */
@Service("StrategyService")
public class StrategyServiceImpl implements StrategyService
{
	@Autowired
	private StrategyMapper strategyMapper;

	@Override
	public List<Strategy> queryAllStrategy(String limit)
	{
		List<Strategy> strategyList = strategyMapper.queryAllStrategyWithLimit(limit);
		return strategyList;
	}

	@Override
	public Strategy querySingleStrategy(int sid)
	{
		Strategy strategy = strategyMapper.querySingleStrategy(sid);
		return strategy;
	}
}
