package com.drivingsys.bean;

public class Workbuttonlink
{
	private int wid;
	private String fixedphone;
	private String worktime;
	private String workaddress;
	private String mobilephone;
	private String workemail;
	private String workQQ;
	private String workimage;

	public Workbuttonlink()
	{
	}

	public Workbuttonlink(int wid, String fixedphone, String worktime, String workaddress, String mobilephone, String workemail, String workQQ, String workimage)
	{
		this.wid = wid;
		this.fixedphone = fixedphone;
		this.worktime = worktime;
		this.workaddress = workaddress;
		this.mobilephone = mobilephone;
		this.workemail = workemail;
		this.workQQ = workQQ;
		this.workimage = workimage;
	}

	public int getWid()
	{
		return wid;
	}

	public void setWid(int wid)
	{
		this.wid = wid;
	}

	public String getFixedphone()
	{
		return fixedphone;
	}

	public void setFixedphone(String fixedphone)
	{
		this.fixedphone = fixedphone;
	}

	public String getWorktime()
	{
		return worktime;
	}

	public void setWorktime(String worktime)
	{
		this.worktime = worktime;
	}

	public String getWorkaddress()
	{
		return workaddress;
	}

	public void setWorkaddress(String workaddress)
	{
		this.workaddress = workaddress;
	}

	public String getMobilephone()
	{
		return mobilephone;
	}

	public void setMobilephone(String mobilephone)
	{
		this.mobilephone = mobilephone;
	}

	public String getWorkemail()
	{
		return workemail;
	}

	public void setWorkemail(String workemail)
	{
		this.workemail = workemail;
	}

	public String getWorkQQ()
	{
		return workQQ;
	}

	public void setWorkQQ(String workQQ)
	{
		this.workQQ = workQQ;
	}

	public String getWorkimage()
	{
		return workimage;
	}

	public void setWorkimage(String workimage)
	{
		this.workimage = workimage;
	}
}
