package com.drivingsys.bean;

public class roleBackMenu
{
	private String rid;
	private String fallocation;
	private String mname1;
	private String mname2;
	private String mlink;

	public roleBackMenu()
	{
	}

	public roleBackMenu(String rid, String fallocation, String mname1, String mname2, String mlink)
	{
		this.rid = rid;
		this.fallocation = fallocation;
		this.mname1 = mname1;
		this.mname2 = mname2;
		this.mlink = mlink;
	}

	public String getRid()
	{
		return rid;
	}

	public void setRid(String rid)
	{
		this.rid = rid;
	}

	public String getFallocation()
	{
		return fallocation;
	}

	public void setFallocation(String fallocation)
	{
		this.fallocation = fallocation;
	}

	public String getMname1()
	{
		return mname1;
	}

	public void setMname1(String mname1)
	{
		this.mname1 = mname1;
	}

	public String getMname2()
	{
		return mname2;
	}

	public void setMname2(String mname2)
	{
		this.mname2 = mname2;
	}

	public String getMlink()
	{
		return mlink;
	}

	public void setMlink(String mlink)
	{
		this.mlink = mlink;
	}

	@Override
	public String toString()
	{
		return "rid : "+rid+",fallocation  : "+fallocation+",mname1  : "+mname1+",mname2  : "+mname2
				+",mlink  : "+mlink
				;
	};

}
