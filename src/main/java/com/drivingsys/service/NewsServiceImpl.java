package com.drivingsys.service;

import com.drivingsys.bean.Journalism;
import com.drivingsys.dao.LogMapper;
import com.drivingsys.dao.NewsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 新闻资讯业务实现类
 * @author Stephen
 */
@Service("NewsService")
public class NewsServiceImpl implements NewsService
{

	@Autowired
	private NewsMapper newsMapper;

	@Override
	public List<Journalism> queryAllNews(String limit)
	{
		List<Journalism> journalismList = newsMapper.queryAllNewWithLimit(limit);
		return journalismList;
	}

	@Override
	public Journalism querySingleNews(int jid)
	{
		Journalism journalism = newsMapper.querySingleNews(jid);
		return journalism;
	}
}
