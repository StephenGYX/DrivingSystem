package com.drivingsys.bean;

public class echarsParam
{
	private int num;
	private int pid;
	private String pname;
	private String dprice;
	private String dname;
	public echarsParam()
	{
	}

	public String getDprice()
	{
		return dprice;
	}

	public void setDprice(String dprice)
	{
		this.dprice = dprice;
	}

	public String getDname()
	{
		return dname;
	}

	public void setDname(String dname)
	{
		this.dname = dname;
	}

	public String getPname()
	{
		return pname;
	}

	public void setPname(String pname)
	{
		this.pname = pname;
	}

	public int getNum()
	{
		return num;
	}

	public void setNum(int num)
	{
		this.num = num;
	}

	public int getPid()
	{
		return pid;
	}

	public void setPid(int pid)
	{
		this.pid = pid;
	}
}
