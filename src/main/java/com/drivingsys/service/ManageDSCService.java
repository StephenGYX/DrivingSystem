package com.drivingsys.service;

import com.drivingsys.bean.*;
import com.drivingsys.bean.echartstest.bannian;
import com.drivingsys.bean.echartstest.echaretsDSC;
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

	public List<Drivingschool> queryDSC(Map<String, Object> reqMap, RowBounds rb)
	{
		return manageDSCMapper.queryDSC(reqMap, rb);
	}

	public int delDSC(List<Drivingschool> del)
	{
		return manageDSCMapper.delDSC(del);
	}

	public int updateCoachStateByDid(long did, int i)
	{
		return manageDSCMapper.updateCoachStateByDid(did, i);
	}

	public int updateCoachPwdByDid(int did, String password)
	{
		return manageDSCMapper.updateCoachPwdByDid(did, password);
	}
//驾校查看评价
	public List<Examination> querySTUpj(int did, RowBounds rowBounds)
	{
		return manageDSCMapper.querySTUpj(did, rowBounds);
	}

	public long querySTUpjcount(int did)
	{
		return manageDSCMapper.querySTUpjcount(did);
	}


	public List<echaretsDSC> echaretstest()
	{
		return manageDSCMapper.echaretstest();
	}

	public List<Drivingschool> queryqianDSC(Map<String, Object> reqMap, RowBounds rowBounds)
	{
		return manageDSCMapper.queryqianDSC(reqMap, rowBounds);
	}

	public long queryDSCcount(Map<String, Object> search)
	{
		return manageDSCMapper.queryDSCcount(search);
	}

	//查询未经过管理员审核驾校
	public List<Drivingschool> QueryDSCshenhe(Map<String, Object> search, RowBounds rowBounds)
	{
		return manageDSCMapper.QueryDSCshenhe(search, rowBounds);
	}

	public int updateshenheStateByDid(int did, int i)
	{
		return manageDSCMapper.updateshenheStateByDid(did, i);
	}

	public void updateqiyongStateByDid(int did)
	{
		manageDSCMapper.updateqiyongStateByDid(did);
	}

	public int updatedscinfo(Map<String, Object> updata)
	{
		return manageDSCMapper.updatedscinfo(updata);
	}

	public List<Kecheng> QueryDSCkecheng(Map<String, Object> search, RowBounds rowBounds)
	{
		return manageDSCMapper.QueryDSCkecheng(search, rowBounds);
	}

	public int instertkecheng(Map<String, Object> reqMap)
	{
		return manageDSCMapper.instertkecheng(reqMap);
	}

	public int updatakecheng(Map<String, Object> reqMap)
	{
		return manageDSCMapper.updatakecheng(reqMap);
	}

	public int delkecheng(String kid)
	{
		return manageDSCMapper.delkecheng(kid);
	}

	public long QueryDSCkechengcount(Map<String, Object> search)
	{
		return manageDSCMapper.QueryDSCkechengcount(search);
	}

	public long queryDSCshenhecount(Map<String, Object> search)
	{
		return manageDSCMapper.QueryDSCshenheCount(search);
	}

	public void instertimage(String did,String lujing ,  String jxxx)
	{
		manageDSCMapper.instertimage(did, lujing,jxxx);
	}

	public Drivingschool queryDSCbydaccount(String daccount)
	{return manageDSCMapper.queryDSCbydaccount(daccount);
	}

	public void updatezigeimage(String did, String showFilePath)
	{
		 manageDSCMapper.updatezigeimage(did,showFilePath);
	}

	public void updatadscimage(String did, String showFilePath)
	{manageDSCMapper.updatadscimage(did,showFilePath);
	}

	public List<Practise> Queryjiaolianshenhe(Map<String, Object> search, RowBounds rowBounds)
	{
		return  manageDSCMapper.Queryjiaolianshenhe(search,rowBounds);
	}

	public long Queryjiaolianshenhecount(Map<String, Object> search)
	{
		return manageDSCMapper.Queryjiaolianshenhecount(search);
	}

	public int updateCoachStatejiaolianByDid(int did, int i)
	{
		return manageDSCMapper.updateCoachStatejiaolianByDid(did,i);
	}

	public List<bannian> echartyuefen()
	{
		return  manageDSCMapper.echartyuefen();
	}

	public List<echaretsDSC> echartshengfen()
	{
		return manageDSCMapper.echartshengfen();
	}

	public List<echaretsDSC> echartcar()
	{return manageDSCMapper.echartcar();
	}

	public Drivingschool queryDSCbydname(String dname)
	{
		return manageDSCMapper.queryDSCbydname(dname);
	}

	;

}
