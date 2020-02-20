package com.drivingsys.service;

import com.drivingsys.bean.Log;
import com.drivingsys.bean.tableParam;

import java.util.Map;

/**
 * 日志接口
 * @author Stephen
 */
public interface LogService
{
	/**
	 * 插入新日志
	 * @param log
	 * @return
	 */
	public int insertNewLog(Log log);

	/**
	 * 查询所有的log日志
	 * @param map
	 * @return
	 */
	public tableParam queryAllLog(Map<String, Integer> map);

	/**
	 * 多条件查询
	 * @param map
	 * @return
	 */
	public tableParam queryLogWithParam(Map<String, String> map);


}
