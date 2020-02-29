package com.drivingsys.dao;

import com.drivingsys.bean.Log;
import com.drivingsys.bean.tableParam;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.tomcat.jni.FileInfo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Mapper
public interface LogMapper
{
	/**
	 * 插入操作日志
	 * @param log
	 * @return
	 */
	public int insertNewLog(Log log);

	/**
	 * @param map
	 * @return
	 */
	public ArrayList<Log> queryAllLogWithLimit(Map<String, Integer> map);

	/**
	 * 不带条件查询总数
	 * @return
	 */
	public int queryAll();

	/**
	 * 带条件查询总数
	 * @param map
	 * @return
	 */
	public int queryLogWithParamTotalNum(Map<String, String> map);

	/**
	 * 带条件查询
	 * @param map
	 * @return
	 */
	public ArrayList<Log> queryLogWithParam(Map<String, String> map);

	@Select("select * from log")
	public List<Log> queryAllLog();
}
