package com.drivingsys.service;

import com.drivingsys.bean.Backstage;
import com.drivingsys.dao.BackStageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("backStageService")
public class BackStageServiceImpl implements BackStageService
{

	@Autowired
	private BackStageMapper backStageMapper;

	/**
	 * 后台管理员登录查找
	 * @param map
	 * @return
	 */
	@Override
	public Backstage queryBackStageAccount(Map<String, String> map)
	{
		//查找数据库
		Backstage backstage = backStageMapper.queryBackStageAccount(map);
		return backstage;
	}
}
