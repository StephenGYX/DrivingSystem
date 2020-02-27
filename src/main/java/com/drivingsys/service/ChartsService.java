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


}
