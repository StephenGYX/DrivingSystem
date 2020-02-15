package com.drivingsys.service;

import com.drivingsys.dao.BackMenuMapper;
import com.drivingsys.dao.BackStageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("backMenuService")
public class BackMenuServiceImpl implements BackMenuService
{

	@Autowired
	private BackMenuMapper backMenuMapper;

	@Override
	public void queryRoleMenu()
	{

	}
}
