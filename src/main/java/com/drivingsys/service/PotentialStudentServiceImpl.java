package com.drivingsys.service;

import com.drivingsys.bean.Getready;
import com.drivingsys.bean.Journalism;
import com.drivingsys.bean.tableParam;
import com.drivingsys.dao.PotentialStudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("PotentialStudentService")
public class PotentialStudentServiceImpl implements PotentialStudentService
{

	@Autowired
	private PotentialStudentMapper potentialStudentMapper;

	@Override
	public tableParam queryAllPotentialWithLimit(Map<String, String> map)
	{
		//查询首页显示的table和总数
		List<Getready> getreadyList = potentialStudentMapper.queryAllPotentialWithLimit(map);
		int i = potentialStudentMapper.queryAllpotentialNum();

		tableParam tableParam = new tableParam();
		tableParam.setCode(0);
		tableParam.setMsg("");
		tableParam.setCount(i);
		tableParam.setData(getreadyList);

		return tableParam;
	}

	@Override
	public tableParam queryPotentialWithParam(Map<String, String> map)
	{
		tableParam tableInfo = new tableParam();
		tableInfo.setMsg("");
		tableInfo.setCode(0);

		//查询所有用户总数，并进行表总数设置
		int num = potentialStudentMapper.queryPotentialWithParamTotalNum(map);
		tableInfo.setCount(num);

		//获取文件list
		List<Getready> getreadyList = potentialStudentMapper.queryPotentialWithParam(map);
		tableInfo.setData(getreadyList);
		return tableInfo;
	}

	@Override
	public int insertPotentialContent(Map<String, String> map)
	{
		int i = potentialStudentMapper.insertPontentialContent(map);
		return i;
	}

	@Override
	public int updatePotentialStatue(Map<String, String> map)
	{
		int i = potentialStudentMapper.updatePontentialStatue(map);
		return i;
	}

	@Override
	public int updatePotentialContent(Map<String, String> map)
	{
		int i = potentialStudentMapper.updatePontentialContent(map);
		return i;
	}
}
