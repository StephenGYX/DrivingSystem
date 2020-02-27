package com.drivingsys.dao;

import com.drivingsys.bean.Workbuttonlink;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface ButtonLinkMapper
{
	/**
	 * 查找底部友情链接
	 */
	public Workbuttonlink queryButtonLink();

	public int updateButtonLink(Map<String, String> map);
}
