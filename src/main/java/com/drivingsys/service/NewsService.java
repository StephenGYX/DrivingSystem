package com.drivingsys.service;

import com.drivingsys.bean.Journalism;
import com.drivingsys.bean.Log;
import com.drivingsys.bean.tableParam;

import java.util.List;
import java.util.Map;

public interface NewsService
{

	/**
	 * 前端展示4条新闻资讯
	 * @param type
	 * @return
	 */
	public List<Journalism> queryAllNews(String type);

	/**
	 * 查询显示前端网页
	 * @param map
	 * @return
	 */
	public tableParam queryAllNewsWithLimit(Map<String, String> map);

	/**
	 * 查询单个新闻对象
	 * @param jid
	 * @return
	 */
	public Journalism querySingleNews(int jid);

	/**
	 * 带条件查询新闻资讯
	 * @param map
	 * @return
	 */
	public tableParam queryNewsWithParam(Map<String, String> map);

	/**
	 * 修改文章状态
	 * @param map
	 * @return
	 */
	public int updateNewsStatue(Map<String, String> map);

	/**
	 * 更新文章内容
	 * @param map
	 * @return
	 */
	public int updateNewsContent(Map<String, String> map);

	/**
	 * 新增资讯文章
	 * @param map
	 * @return
	 */
	public int insertNewsContent(Map<String, String> map);
}
