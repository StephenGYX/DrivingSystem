package com.drivingsys.dao;

import com.drivingsys.bean.Practise;
import org.apache.ibatis.annotations.Select;

import java.util.Map;

public interface TestMapper
{

	@Select("select * from practise where paccount=#{username} and ppassword=#{password}")
	public Practise queryPractiseAccount(Map<String, String> map);

}
