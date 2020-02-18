package com.drivingsys.bean.backmenu;

public class HomeInfo
{
	private String title = "首页";
	private String icon = "fa fa-home";
	private String href = "back/page/welcome-1.html?mpi=m-p-i-0";

	public HomeInfo()
	{
	}

	public HomeInfo(String title, String icon, String href)
	{
		this.title = title;
		this.icon = icon;
		this.href = href;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getIcon()
	{
		return icon;
	}

	public void setIcon(String icon)
	{
		this.icon = icon;
	}

	public String getHref()
	{
		return href;
	}

	public void setHref(String href)
	{
		this.href = href;
	}
}
