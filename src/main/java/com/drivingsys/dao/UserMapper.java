package com.drivingsys.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper
{
	public void querySingleUser();
	public void adduser(String account,String pass);
}
