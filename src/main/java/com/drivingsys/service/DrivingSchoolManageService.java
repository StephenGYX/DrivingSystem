package com.drivingsys.service;


import com.drivingsys.bean.Consumer;
import com.drivingsys.bean.Drivingschool;
import com.drivingsys.bean.Examination;
import com.drivingsys.bean.Practise;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface DrivingSchoolManageService
{
	/**
	 * 查找本校的全部教练
	 */
	public List<Practise> queryCoachByDid(String did) ;

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

	//根据学员和教练，考试科目和考试时间，修改订单表的考试时间一栏
	public int updateOrderKaoshiTime(HashMap kaoShiParam) ;

	//通过驾校和教练ID，查看该教练所收到的评价
	public List<Examination> queryCoachEval( String pid,String did) ;

	//通过驾校和学员ID，查看该学员所有的评价
	public List<Examination> queryStudentAllEval(String cid,  String did) ;

	//通过教练ID，查看该教练
	public Practise queryPractiseById(String pid) ;


	//查询全部驾校
	public List<Drivingschool> queryAllSchool() ;

}
