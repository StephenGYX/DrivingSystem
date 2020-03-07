package com.drivingsys.service;

import com.drivingsys.bean.backmenu.BackMenu;
import com.drivingsys.bean.backmenu.ZtreeMenu;
import com.drivingsys.bean.echarsParam;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ChartsService
{
	//查询每个用户的教练
	public List<echarsParam> queryStudentByCoach();
	//查询各个驾校的价格
	public List<echarsParam> querySchoolPrice();

	//查询各个驾校的价格
	public List<echarsParam> newStudentByTime(Map timeMap);
}
