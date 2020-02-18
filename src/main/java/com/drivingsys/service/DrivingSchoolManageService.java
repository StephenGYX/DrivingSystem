package com.drivingsys.service;


import com.drivingsys.bean.Practise;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface DrivingSchoolManageService
{
    /**
	 * 查询该驾校里的所有教练
	 */
	public List<Practise> queryCoachByMySchool(long dsId, RowBounds rb);
	public long queryCoachByMySchoolCount(long dsId);

}
