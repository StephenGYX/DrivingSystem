package com.drivingsys.service;

import com.drivingsys.bean.RoleMenu;
import com.drivingsys.bean.backmenu.BackMenu;
import com.drivingsys.bean.backmenu.MenuInfoX;
import com.drivingsys.bean.backmenu.ZtreeMenu;
import com.drivingsys.bean.echarsParam;
import com.drivingsys.dao.BackMenuMapper;
import com.drivingsys.dao.ChartsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service()
public class ChartsServiceImpl implements ChartsService
{
    @Autowired
	private ChartsMapper chartsMapper;

	@Override
	public List<echarsParam> queryStudentByCoach()
	{

		return chartsMapper.queryStudentByCoach();
	}
}
