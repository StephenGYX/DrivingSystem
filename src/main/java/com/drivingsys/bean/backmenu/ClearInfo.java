package com.drivingsys.bean.backmenu;

public class ClearInfo
{
	private String ClearUrl = "api/clear.json";

	public ClearInfo()
	{
	}

	public ClearInfo(String clearUrl)
	{
		ClearUrl = clearUrl;
	}

	public String getClearUrl()
	{
		return ClearUrl;
	}

	public void setClearUrl(String clearUrl)
	{
		ClearUrl = clearUrl;
	}
}
