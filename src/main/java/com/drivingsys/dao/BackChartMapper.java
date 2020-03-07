package com.drivingsys.dao;

import com.drivingsys.bean.RoleMenu;
import com.drivingsys.bean.amchart.ChartData;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface BackChartMapper
{
	@Select("select gstate name,count(*) value from getready group by gstate")
	public List<ChartData> queryPotentialChart();

	@Select("select eorderstate name,count(*) value from examination group by eorderstate")
	public List<ChartData> queryStudyChart();

	@Select("SELECT DATE_FORMAT(gtime,'%Y-%m-%d') name,count(*) value from getready GROUP BY TO_DAYS(gtime)")
	public List<ChartData> queryRegNumChart();

}
