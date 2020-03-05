package com.drivingsys.dao;

import com.drivingsys.bean.*;
import com.drivingsys.bean.echartstest.bannian;
import com.drivingsys.bean.echartstest.echaretsDSC;
import org.apache.ibatis.annotations.*;
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

	@Select("select * from kecheng where did=#{did}")
	List<Kecheng> QueryDSCkecheng(Map<String, Object> search, RowBounds rowBounds);

	int instertkecheng(Map<String, Object> reqMap);

	int updatakecheng(Map<String, Object> reqMap);

	int delkecheng(@Param("kid") String kid);

	@Select("select count(*) from kecheng where did=#{did}")
	long QueryDSCkechengcount(Map<String, Object> search);

	public void instertimage(@Param("did") String did, @Param("lujing") String lujing, @Param("leixing") String jxxx);


	public Drivingschool queryDSCbydaccount(@Param("daccount") String daccount);

	public void updatezigeimage(@Param("did") String did,@Param("zigeimage") String showFilePath);

	void updatadscimage(@Param("did")String did, @Param("dschoolimage")String showFilePath);

	List<Practise> Queryjiaolianshenhe(Map<String, Object> search, RowBounds rowBounds);

	long Queryjiaolianshenhecount(Map<String, Object> search);

	@Update("update practise set paccountstate=#{i} where did=#{did}")
	int updateCoachStatejiaolianByDid(int did, int i);

	List<bannian> echartyuefen();
}
