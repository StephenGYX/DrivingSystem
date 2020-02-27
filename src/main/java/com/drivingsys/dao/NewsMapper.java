package com.drivingsys.dao;

import com.drivingsys.bean.Journalism;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NewsMapper
{

	/**
	 * 前端网页查看新闻资讯
	 * @param limit
	 * @return
	 */
	public List<Journalism> queryAllNewWithLimit(String limit);

	public Journalism querySingleNews(int jid);
}
