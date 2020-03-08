package com.drivingsys.service;

import com.drivingsys.bean.Drivingschool;
import com.drivingsys.bean.Examination;
import com.drivingsys.bean.Kecheng;
import com.drivingsys.bean.echarsParam;
import com.drivingsys.dao.BackPractiseManageMapper;
import com.drivingsys.dao.ChartsMapper;
import com.drivingsys.dao.DrivingSchoolInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service()
public class DrivingSchoolInfoServiceImpl implements DrivingSchoolInfoService
{
	@Autowired
	private DrivingSchoolInfoMapper drivingSchoolInfoMapper;

	@Override
	public List<Drivingschool> querySchoolInfo(String did)
	{
		return drivingSchoolInfoMapper.querySchoolInfoByDid(did);
	}

	@Override
	public List<Kecheng> querySchoolKeCheng(String did)
	{
		return drivingSchoolInfoMapper.querySchoolKeCheng(did);
	}

	@Override
	public int insertBaoMing(Map<String, Object> baoMing)
	{
		return drivingSchoolInfoMapper.insertBaoMing(baoMing);
	}

	@Override
	public Examination queryExamExist(String cid, String evehicletype)
	{
		return drivingSchoolInfoMapper.queryExamExist(cid,evehicletype);
	}

	@Override
	public List<Examination> queryExamListByCid(String cid)
	{
		return drivingSchoolInfoMapper.queryExamListByCid(cid);
	}
}
