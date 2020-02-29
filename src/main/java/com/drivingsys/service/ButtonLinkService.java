package com.drivingsys.service;

import com.drivingsys.bean.Workbuttonlink;

import java.util.Map;

/**
 * 底部友情链接
 * @author Stephen
 */
public interface ButtonLinkService
{
	/**
	 * 查询友情链接
	 * @return
	 */
	public Workbuttonlink queryButtonLink();

	public int updateButtonLink(Map<String, String> map);
}
