package com.drivingsys.service;

import com.drivingsys.bean.Log;
import com.drivingsys.bean.tableParam;
import com.drivingsys.dao.LogMapper;
import org.apache.tomcat.jni.FileInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Map;

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

	@Override
	public tableParam queryAllLog(Map<String, Integer> map)
	{
		tableParam tableInfo = new tableParam();
		tableInfo.setCode(0);
		tableInfo.setMsg("");

		//查询所有用户总数，并进行表总数设置
		int num = logMapper.queryAll();
		tableInfo.setCount(num);

		//获取文件list
		ArrayList<Log> fileInfos = logMapper.queryAllLogWithLimit(map);
		tableInfo.setData(fileInfos);

		return tableInfo;
	}

	@Override
	public tableParam queryLogWithParam(Map<String, String> map)
	{
		tableParam tableInfo = new tableParam();
		tableInfo.setMsg("");
		tableInfo.setCode(0);

		//查询所有用户总数，并进行表总数设置
		int num = logMapper.queryLogWithParamTotalNum(map);
		tableInfo.setCount(num);

		//获取文件list
		ArrayList<Log> fileInfos = logMapper.queryLogWithParam(map);
		tableInfo.setData(fileInfos);
		return tableInfo;
	}
}
