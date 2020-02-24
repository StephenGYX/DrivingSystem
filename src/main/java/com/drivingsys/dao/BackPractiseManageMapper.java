package com.drivingsys.dao;

import com.drivingsys.bean.Practise;
import com.drivingsys.bean.RoleMenu;
import com.drivingsys.bean.backmenu.ZtreeMenu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


@Mapper
@Repository
public interface BackPractiseManageMapper
{
	//查看后台管理端全部的教练
	public List<Practise> queryAllCoach (RowBounds rb,@Param("selectParam") HashMap selectParam);
	public long queryAllCoachCount( @Param("selectParam")HashMap selectParam) ;

}
