package com.drivingsys.dao;

import com.drivingsys.bean.Consumer;
import com.drivingsys.bean.Practise;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface DrivingSchoolManageMapper
{

	//带条件查询本驾校的教练
	public List<Practise> queryCoachByMySchool( RowBounds rb, @Param("selectParam") HashMap selectParam) ;
	public long queryCoachByMySchoolCount( @Param("selectParam")HashMap selectParam) ;

	//对本驾校的教练进行启用禁用，逻辑删除操作
	public int updateCoachStateByPid( @Param("pid")int pid,@Param("paccountstate")int paccountstate) ;
	//对本驾校的教练进行重置密码操作
	public int updateCoachPwdByPid( @Param("pid")int pid,@Param("ppassword")String ppassword) ;


	//带条件查询本驾校的学员
	public List<Consumer> queryStudentByMySchool(RowBounds rb, @Param("selectParam") HashMap selectParam) ;
	public long queryStudentByMySchoolCount( @Param("selectParam")HashMap selectParam) ;

	//对本驾校的学员进行启用禁用，逻辑删除操作
	public int updateStudentStateByCid( @Param("cid")int cid,@Param("cstate")int cstate) ;
	//对本驾校的教练进行重置密码操作
	public int updateStudentPwdByCid( @Param("cid")int cid,@Param("cpassword")String ppassword) ;

}
