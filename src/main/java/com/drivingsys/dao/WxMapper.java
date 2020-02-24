package com.drivingsys.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface WxMapper
{
	public Map selectUserinfo(String account);
}
