package com.drivingsys.bean.backmenu;

import java.util.ArrayList;

public class MenuInfoX
{
	private String title;
	private String href;
	private String icon;
	private String target;
	private ArrayList<MenuInfoX> child;

	public MenuInfoX()
	{
	}

	public MenuInfoX(String title, String href, String icon, String target, ArrayList<MenuInfoX> child)
	{
		this.title = title;
		this.href = href;
		this.icon = icon;
		this.target = target;
		this.child = child;
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

	public ArrayList<MenuInfoX> getChild()
	{
		return child;
	}

	public void setChild(ArrayList<MenuInfoX> child)
	{
		this.child = child;
	}
}
