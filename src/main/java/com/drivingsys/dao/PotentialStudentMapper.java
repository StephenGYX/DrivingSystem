package com.drivingsys.dao;

import com.drivingsys.bean.Getready;
import com.drivingsys.bean.Journalism;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface PotentialStudentMapper
{
	/**
	 * 查询所有数量
	 * @return
	 */
	public List<Getready> queryAllPotentialWithLimit(Map<String, String> map);

	/**
	 * 查询所有数量
	 * @return
	 */
	@Select("select count(*) from getready")
	public int queryAllpotentialNum();

	/**
	 * 带条件查询总数
	 * @param map
	 * @return
	 */
	public int queryPotentialWithParamTotalNum(Map<String, String> map);

	/**
	 * 带条件查询
	 * @param map
	 * @return
	 */
	public List<Getready> queryPotentialWithParam(Map<String, String> map);

	/**
	 * 新增潜在客户
	 * @param map
	 * @return
	 */
	public int insertPontentialContent(Map<String, String> map);

	/**
	 * 更新状态
	 * @param map
	 * @return
	 */
	public int updatePontentialStatue(Map<String, String> map);

	/**
	 * 更新咨询内容
	 * @param map
	 * @return
	 */
	public int updatePontentialContent(Map<String, String> map);
}
