package com.drivingsys.service;

import com.drivingsys.bean.Consumer;
import com.drivingsys.bean.Practise;
import com.drivingsys.dao.DrivingSchoolManageMapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DrivingSchoolManageServiceImpl implements DrivingSchoolManageService
{

	@Autowired
	private DrivingSchoolManageMapper drivingSchoolManageMapper;

	/**
	 * 传入驾校的ID，和搜索条件，查询该驾校的教练
	 * @param selectParam
	 * @return
	 */
	@Override
	public List<Practise> queryCoachByMySchool( RowBounds rb, HashMap selectParam)
	{
		return drivingSchoolManageMapper.queryCoachByMySchool(rb,selectParam);
	}

	@Override
	public long queryCoachByMySchoolCount(HashMap selectParam)
	{
		return drivingSchoolManageMapper.queryCoachByMySchoolCount(selectParam);
	}

	@Override
	public int updateCoachStateByPid(int pid, int coachState)
	{
		return drivingSchoolManageMapper.updateCoachStateByPid(pid,coachState);
	}

	@Override
	public int updateCoachPwdByPid(int pid, String pwd)
	{

		return drivingSchoolManageMapper.updateCoachPwdByPid(pid,pwd);
	}



	@Override
	public List<Consumer> queryStudentByMySchool(RowBounds rb, HashMap selectParam)
	{
		return drivingSchoolManageMapper.queryStudentByMySchool(rb,selectParam);
	}

	@Override
	public long queryStudentByMySchoolCount(HashMap selectParam)
	{
		return drivingSchoolManageMapper.queryStudentByMySchoolCount(selectParam);
	}

	@Override
	public int updateStudentStateByCid(int cid, int studentState)
	{
		return drivingSchoolManageMapper.updateStudentStateByCid(cid,studentState);
	}

	@Override
	public int updateStudentPwdByCid(int cid, String pwd)
	{
		return drivingSchoolManageMapper.updateStudentPwdByCid(cid,pwd);
	}
}
