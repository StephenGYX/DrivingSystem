package com.drivingsys.service;

import com.drivingsys.bean.Journalism;
import com.drivingsys.bean.Log;
import com.drivingsys.bean.tableParam;
import com.drivingsys.dao.LogMapper;
import com.drivingsys.dao.NewsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
	public List<Journalism> queryAllNews(String type)
	{
		List<Journalism> journalismList = newsMapper.queryAllNewWithType(type);
		return journalismList;
	}

	@Override
	public tableParam queryAllNewsWithLimit(Map<String, String> map)
	{
		//查询首页显示的table和总数
		List<Journalism> journalismList = newsMapper.queryAllNews(map);
		int i = newsMapper.queryNewsTotalNum();

		tableParam tableParam = new tableParam();
		tableParam.setCode(0);
		tableParam.setMsg("");
		tableParam.setCount(i);
		tableParam.setData(journalismList);

		return tableParam;
	}


	@Override
	public Journalism querySingleNews(int jid)
	{
		Journalism journalism = newsMapper.querySingleNews(jid);
		return journalism;
	}

	@Override
	public tableParam queryNewsWithParam(Map<String, String> map)
	{
		tableParam tableInfo = new tableParam();
		tableInfo.setMsg("");
		tableInfo.setCode(0);

		//查询所有用户总数，并进行表总数设置
		int num = newsMapper.queryNewsWithParamTotalNum(map);
		tableInfo.setCount(num);

		//获取文件list
		List<Journalism> fileInfos = newsMapper.queryNewsWithParam(map);
		tableInfo.setData(fileInfos);
		return tableInfo;
	}

	@Override
	public int updateNewsStatue(Map<String, String> map)
	{
		int i = newsMapper.updateNewsStatue(map);
		return i;
	}

	@Override
	public int updateNewsContent(Map<String, String> map)
	{
		int i = newsMapper.updateNewsContent(map);
		return i;
	}

	@Override
	public int insertNewsContent(Map<String, String> map)
	{
		int i = newsMapper.insertNewsContent(map);
		return i;
	}
}
