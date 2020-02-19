package com.drivingsys.service;

import com.drivingsys.bean.Log;
import com.drivingsys.bean.LogInfo;

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
}
