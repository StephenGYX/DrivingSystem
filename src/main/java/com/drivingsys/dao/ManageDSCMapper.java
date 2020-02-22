package com.drivingsys.dao;

import com.drivingsys.bean.Consumer;
import com.drivingsys.bean.Drivingschool;
import com.drivingsys.bean.Examination;
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


	public int delDSC(List<Drivingschool> del);

	@Update("update drivingschool set daccountstate=#{i} where did=#{did}")
	public int updateCoachStateByDid(long did, int i);

	@Update("update drivingschool set dpassword=#{password} where did=#{did}")
	public int updateCoachPwdByDid(int did, String password);

	List<Examination> querySTUpj(int did, RowBounds rowBounds);
}
