package com.drivingsys.service;

import com.drivingsys.dao.WxMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class WxService implements IwxService
{
	@Autowired
	WxMapper wxMapper;
	@Override
	public String login(String account,String pwd)
	{
		Map map = wxMapper.selectUserinfo(account);
		if (map!=null)
		{
			String password = (String) map.get("cpassword");
			if (password != null && pwd.equals(password))
			{
				String cid = map.get("cid") + "";
				return cid;
			}
		}
		return "";
	}
}
