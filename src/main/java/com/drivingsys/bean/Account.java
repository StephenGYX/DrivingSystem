package com.drivingsys.bean;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public class Account implements Serializable
{
	private String username;
	private String password;
	private Double money;

	public String getUsername()
	{
		return username;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public Double getMoney()
	{
		return money;
	}

}
