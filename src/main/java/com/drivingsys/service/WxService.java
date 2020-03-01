package com.drivingsys.service;

import com.drivingsys.bean.Monirecord;
import com.drivingsys.bean.tableParam;
import com.drivingsys.dao.WxMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
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

	@Override
	public List<Monirecord> selectmonirecord(String cid, String kemu)
	{
		return wxMapper.selectmonirecord(cid,kemu);
	}
}
