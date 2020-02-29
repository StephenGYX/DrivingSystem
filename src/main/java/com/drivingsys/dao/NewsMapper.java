package com.drivingsys.dao;

import com.drivingsys.bean.Journalism;
import com.drivingsys.bean.Log;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Mapper
public interface NewsMapper
{

	/**
	 * 前端网页查看新闻资讯
	 * @param type
	 * @return
	 */
	public List<Journalism> queryAllNewWithType(String type);

	/**
	 * 前端table显示
	 * @param map
	 * @return
	 */
	public List<Journalism> queryAllNews(Map<String, String> map);

	/**
	 * 查询所有的news总数
	 * @return
	 */
	@Select("select count(*) from journalism")
	public int queryNewsTotalNum();

	/**
	 * 查询单个
	 * @param jid
	 * @return
	 */
	public Journalism querySingleNews(int jid);

	/**
	 * 带条件查询总数
	 * @param map
	 * @return
	 */
	public int queryNewsWithParamTotalNum(Map<String, String> map);

	/**
	 * 带条件查询
	 * @param map
	 * @return
	 */
	public List<Journalism> queryNewsWithParam(Map<String, String> map);


	/**
	 * 更新状态
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
	 * 新增文章
	 * @param map
	 * @return
	 */
	public int insertNewsContent(Map<String, String> map);
}
