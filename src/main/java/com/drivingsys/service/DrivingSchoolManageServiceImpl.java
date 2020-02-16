package com.drivingsys.service;

import com.drivingsys.bean.Practise;
import com.drivingsys.dao.DrivingSchoolManageMapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DrivingSchoolManageServiceImpl implements DrivingSchoolManageService
{

	@Autowired
	private DrivingSchoolManageMapper drivingSchoolManageMapper;

	/**
	 * 传入驾校的ID，查询该驾校的全部教练
	 * @param dsId
	 * @return
	 */
	@Override
	public List<Practise> queryCoachByMySchool(long dsId, RowBounds rb)
	{
		return drivingSchoolManageMapper.queryCoachByMySchool(dsId,rb);
	}

	@Override
	public long queryCoachByMySchoolCount(long dsId)
	{
		return drivingSchoolManageMapper.queryCoachByMySchoolCount(dsId);
	}
}
