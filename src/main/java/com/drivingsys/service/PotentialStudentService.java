package com.drivingsys.service;

import com.drivingsys.bean.tableParam;
import java.util.Map;

public interface PotentialStudentService
{

	/**
	 * 查询显示前端网页
	 * @param map
	 * @return
	 */
	public tableParam queryAllPotentialWithLimit(Map<String, String> map);

	/**
	 * 带条件查询新闻资讯
	 * @param map
	 * @return
	 */
	public tableParam queryPotentialWithParam(Map<String, String> map);

	/**
	 * 新增潜在客户
	 * @param map
	 * @return
	 */
	public int insertPotentialContent(Map<String, String> map);

	/**
	 * 删除咨询用户
	 * @param map
	 * @return
	 */
	public int updatePotentialStatue(Map<String, String> map);

	/**
	 * 更新咨询用户内容
	 * @param map
	 * @return
	 */
	public int updatePotentialContent(Map<String, String> map);
}
