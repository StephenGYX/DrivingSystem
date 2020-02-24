package com.drivingsys.service;

import com.drivingsys.bean.Practise;
import com.drivingsys.bean.backmenu.BackMenu;
import com.drivingsys.bean.backmenu.ZtreeMenu;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface BackPractiseManageService
{
    //教练的用户列表查询
	public List<Practise> queryAllCoach (RowBounds rb,HashMap selectParam);
	public long queryAllCoachCount( @Param("selectParam")HashMap selectParam) ;


}
