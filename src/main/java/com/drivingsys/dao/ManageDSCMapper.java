package com.drivingsys.dao;

import com.drivingsys.bean.Consumer;
import com.drivingsys.bean.Drivingschool;
import com.drivingsys.bean.Examination;
import com.drivingsys.bean.echartstest.echaretsDSC;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface ManageDSCMapper
{
	//查询所有驾校
	public List<Drivingschool> queryDSC(Map<String, Object> reqMap, RowBounds rb);

	//以及他对应的条数
	public long queryDSCcount(Map<String, Object> reqMap);

	public int delDSC(List<Drivingschool> del);

	@Update("update drivingschool set daccountstate=#{i} where did=#{did}")
	public int updateCoachStateByDid(long did, int i);

	@Update("update drivingschool set dpassword=#{password} where did=#{did}")
	public int updateCoachPwdByDid(int did, String password);

	@Update("update drivingschool set dshenhestate=#{i} where did=#{did}")
	public int updateshenheStateByDid(long did, int i);

	@Update("update drivingschool set daccountstate=1 where did=#{did}")
	public int updateqiyongStateByDid(long did);


	List<Examination> querySTUpj(int did, RowBounds rowBounds);

	public long querySTUpjcount(int did);

	List<echaretsDSC> echaretstest();

	List<Drivingschool> queryqianDSC(Map<String, Object> reqMap, RowBounds rowBounds);

//审核页面查询
	List<Drivingschool> QueryDSCshenhe(Map<String, Object> reqMap, RowBounds rowBounds);
//审核页面查询条数
	long QueryDSCshenheCount(Map<String, Object> reqMap);

	int updatedscinfo(Map<String, Object> updata);
}
