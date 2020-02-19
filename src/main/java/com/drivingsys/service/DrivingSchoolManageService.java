package com.drivingsys.service;


import com.drivingsys.bean.Consumer;
import com.drivingsys.bean.Practise;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface DrivingSchoolManageService
{
    /**
	 * 查询该驾校里的所有教练
	 */
	public List<Practise> queryCoachByMySchool(RowBounds rb, HashMap selectParam);
	public long queryCoachByMySchoolCount(HashMap selectParam);

	/**
	 * 对该驾校里的所有教练进行启用禁用重置密码等操作
	 */
	public int updateCoachStateByPid(int pid,int coachState );
	public int updateCoachPwdByPid(int pid,String pwd );

	/**
	 * 查询该驾校里的所有学员
	 */
	public List<Consumer> queryStudentByMySchool(RowBounds rb, HashMap selectParam);
	public long queryStudentByMySchoolCount(HashMap selectParam);
	/**
	 * 对该驾校里的所有教练进行启用禁用重置密码等操作
	 */
	public int updateStudentStateByCid(int cid,int studentState );
	public int updateStudentPwdByCid(int cid,String pwd );


	//通过驾校ID和教练ID，查看该教练
	public Practise queryCoachByPidAndDid(HashMap selectParam) ;

	//修改学员表的所属教练一栏，将其和教练绑定
	public int updateStudentTheCoachId(HashMap selectParam) ;
	//修改订单表的教练一栏，将其和教练绑定
	public int updateOrderTheCoachId(HashMap selectParam) ;


	//修改订单表的教练一栏，将其和教练绑定
	public int updateOrderState(HashMap selectParam) ;

}
