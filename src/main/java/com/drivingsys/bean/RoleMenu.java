package com.drivingsys.bean;

public class RoleMenu
{

	private long rid;
	private String fallocation;
	private String firtitle;
	private String sectitle;
	private String firURL;
	private String secURL;
	private String firicon;
	private String secicon;
	private String firtarget;
	private String sectarget;

	public RoleMenu()
	{
	}

	public RoleMenu(long rid, String fallocation, String firtitle, String sectitle, String firURL, String secURL, String firicon, String secicon, String firtarget, String sectarget)
	{
		this.rid = rid;
		this.fallocation = fallocation;
		this.firtitle = firtitle;
		this.sectitle = sectitle;
		this.firURL = firURL;
		this.secURL = secURL;
		this.firicon = firicon;
		this.secicon = secicon;
		this.firtarget = firtarget;
		this.sectarget = sectarget;
	}

	public long getRid()
	{
		return rid;
	}

	public void setRid(long rid)
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

	public String getFirtitle()
	{
		return firtitle;
	}

	public void setFirtitle(String firtitle)
	{
		this.firtitle = firtitle;
	}

	public String getSectitle()
	{
		return sectitle;
	}

	public void setSectitle(String sectitle)
	{
		this.sectitle = sectitle;
	}

	public String getFirURL()
	{
		return firURL;
	}

	public void setFirURL(String firURL)
	{
		this.firURL = firURL;
	}

	public String getSecURL()
	{
		return secURL;
	}

	public void setSecURL(String secURL)
	{
		this.secURL = secURL;
	}

	public String getFiricon()
	{
		return firicon;
	}

	public void setFiricon(String firicon)
	{
		this.firicon = firicon;
	}

	public String getSecicon()
	{
		return secicon;
	}

	public void setSecicon(String secicon)
	{
		this.secicon = secicon;
	}

	public String getFirtarget()
	{
		return firtarget;
	}

	public void setFirtarget(String firtarget)
	{
		this.firtarget = firtarget;
	}

	public String getSectarget()
	{
		return sectarget;
	}

	public void setSectarget(String sectarget)
	{
		this.sectarget = sectarget;
	}

	@Override
	public String toString()
	{
		return "RoleMenu{" + "rid=" + rid + ", fallocation='" + fallocation + '\'' + ", firtitle='" + firtitle + '\'' + ", sectitle='" + sectitle + '\'' + ", firURL='" + firURL + '\'' + ", secURL='" + secURL + '\'' + ", firicon='" + firicon + '\'' + ", secicon='" + secicon + '\'' + ", firtarget='" + firtarget + '\'' + ", sectarget='" + sectarget + '\'' + '}';
	}
}
