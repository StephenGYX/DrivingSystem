package com.drivingsys.service;

import com.drivingsys.bean.Journalism;
import com.drivingsys.bean.Strategy;

import java.util.List;

public interface StrategyService
{
	public List<Strategy> queryAllStrategy(String limit);

	public Strategy querySingleStrategy(int sid);
}
