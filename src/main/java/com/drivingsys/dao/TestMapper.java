package com.drivingsys.dao;

import com.drivingsys.bean.Practise;
import com.drivingsys.bean.RoleMenu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface TestMapper
{
	@Select("select * from practise where paccount=#{username} and ppassword=#{password}")
	public Practise queryPractiseAccount(Map<String, String> map);

}
