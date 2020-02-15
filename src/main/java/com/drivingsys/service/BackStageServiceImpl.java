package com.drivingsys.service;

import com.drivingsys.dao.BackStageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("backStageService")
public class BackStageServiceImpl implements BackStageService
{

	@Autowired
	private BackStageMapper backStageMapper;

	@Override
	public void backLogin()
	{
		System.out.println("业务类访问了！");
	}
}
