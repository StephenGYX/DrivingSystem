package com.drivingsys.service;

import com.drivingsys.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

public class MyServiceImpl implements UserService
{
	@Autowired
	private UserMapper userMapper;




	@Override
	public void adduser(String name, String pwd)

	{
		userMapper.adduser(name,pwd);
	}


}
