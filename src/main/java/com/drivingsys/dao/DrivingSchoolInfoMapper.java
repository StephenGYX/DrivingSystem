package com.drivingsys.dao;

import com.drivingsys.bean.Drivingschool;
import com.drivingsys.bean.Examination;
import com.drivingsys.bean.Kecheng;
import com.drivingsys.bean.RoleMenu;
import com.drivingsys.bean.backmenu.ZtreeMenu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Mapper
@Repository
public interface DrivingSchoolInfoMapper
{
 //查询驾校的信息
 public List<Drivingschool> querySchoolInfoByDid(@Param("did") String did);

 public List<Kecheng> querySchoolKeCheng(@Param("did") String did);

 public int insertBaoMing(Map<String, Object> baoMing);

 public Examination queryExamExist(@Param("cid") String cid,@Param("evehicletype") String evehicletype);


 public List<Examination> queryExamListByCid(@Param("cid") String cid);

}
