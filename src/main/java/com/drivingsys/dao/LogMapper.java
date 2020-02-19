package com.drivingsys.dao;

import com.drivingsys.bean.Log;
import com.drivingsys.bean.LogInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
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
}
