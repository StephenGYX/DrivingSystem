package com.drivingsys.service;

import com.drivingsys.bean.Workbuttonlink;
import com.drivingsys.dao.ButtonLinkMapper;
import com.drivingsys.dao.NewsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 底部友情链接业务类
 * @author Stephen
 */
@Service("ButtonLinkService")
public class ButtonLinkServiceImpl implements ButtonLinkService
{

	@Autowired
	private ButtonLinkMapper buttonLinkMapper;

	@Override
	public Workbuttonlink queryButtonLink()
	{
		Workbuttonlink workbuttonlink = buttonLinkMapper.queryButtonLink();
		return workbuttonlink;
	}

	@Override
	public int updateButtonLink(Map<String, String> map)
	{
		int i = buttonLinkMapper.updateButtonLink(map);
		return i;
	}
}
