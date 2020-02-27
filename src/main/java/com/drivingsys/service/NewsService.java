package com.drivingsys.service;

import com.drivingsys.bean.Journalism;

import java.util.List;

public interface NewsService
{

	/**
	 * 前端展示4条新闻资讯
	 * @param limit
	 * @return
	 */
	public List<Journalism> queryAllNews(String limit);

	/**
	 * 查询单个新闻对象
	 * @param jid
	 * @return
	 */
	public Journalism querySingleNews(int jid);
}
