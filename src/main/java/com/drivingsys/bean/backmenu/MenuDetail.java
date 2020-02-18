package com.drivingsys.bean.backmenu;

public class MenuDetail
{

	private String title;
	private String href;
	private String icon;
	private String target;

	public MenuDetail()
	{
	}

	public MenuDetail(String title, String href, String icon, String target)
	{
		this.title = title;
		this.href = href;
		this.icon = icon;
		this.target = target;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getHref()
	{
		return href;
	}

	public void setHref(String href)
	{
		this.href = href;
	}

	public String getIcon()
	{
		return icon;
	}

	public void setIcon(String icon)
	{
		this.icon = icon;
	}

	public String getTarget()
	{
		return target;
	}

	public void setTarget(String target)
	{
		this.target = target;
	}

	@Override
	public String toString()
	{
		return "MenuDetail{" + "title='" + title + '\'' + ", href='" + href + '\'' + ", icon='" + icon + '\'' + ", target='" + target + '\'' + '}';
	}
}
