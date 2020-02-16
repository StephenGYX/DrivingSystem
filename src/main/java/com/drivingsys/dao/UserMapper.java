package com.drivingsys.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper
{


	public void adduser(String account,String pass);
}
