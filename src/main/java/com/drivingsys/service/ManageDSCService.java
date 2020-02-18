package com.drivingsys.service;

import com.drivingsys.bean.Drivingschool;
import com.drivingsys.dao.ManageDSCMapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class ManageDSCService
{

	@Resource
	private ManageDSCMapper manageDSCMapper;

	public List<Drivingschool> queryDSC(Map<String,Object> reqMap, RowBounds rb)
	{return manageDSCMapper.queryDSC(reqMap,rb);}

	public int delDSC(List<Drivingschool> del)
	{ return manageDSCMapper.delDSC(del);
	}

	;

}
