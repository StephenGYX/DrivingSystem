package com.drivingsys.service;

import org.springframework.stereotype.Service;

@Service
public interface UserService
{

	public void adduser(String account,String pass);
}