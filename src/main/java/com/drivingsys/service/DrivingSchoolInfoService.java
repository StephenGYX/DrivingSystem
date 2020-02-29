package com.drivingsys.service;

import com.drivingsys.bean.Drivingschool;
import com.drivingsys.bean.Kecheng;
import com.drivingsys.bean.echarsParam;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface DrivingSchoolInfoService
{
	//查询驾校的信息
	public List<?> querySchoolInfo( String did);
	public List<Kecheng> querySchoolKeCheng(String did);

	public int insertBaoMing(Map<String, Object> baoMing);



}
