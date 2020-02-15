package com.drivingsys.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * @author Stephen
 * @create 2020/02/15 16:35
 */
@Mapper
public interface BackStageMapper
{
	@Select("")
	public void queryBackStageAccount();
}
