package com.drivingsys.service;

import com.drivingsys.bean.Log;
import com.drivingsys.bean.LogInfo;
import com.drivingsys.dao.LogMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 日志实现类
 * @author Stephen
 */
@Service("LogService")
public class LogServiceImpl implements LogService
{

	@Autowired
	private LogMapper logMapper;

	@Override
	public int insertNewLog(Log log)
	{
		int i = logMapper.insertNewLog(log);
		return i;
	}
}
