package com.drivingsys.dao;

import com.drivingsys.bean.Journalism;
import com.drivingsys.bean.Strategy;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StrategyMapper
{
	/**
	 * 查找所有的考试攻略
	 * @param limit
	 * @return
	 */
	public List<Strategy> queryAllStrategyWithLimit(String limit);

	/**
	 * 查找单个攻略文章
	 * @param sid
	 * @return
	 */
	public Strategy querySingleStrategy(int sid);
}
