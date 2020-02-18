package com.drivingsys.bean.backmenu;

import java.util.ArrayList;

public class Currency
{
	private String title = "常规管理";
	private String icon = "fa fa-address-book";
	private ArrayList<MenuInfoX> child;

	public Currency()
	{
	}

	public Currency(String title, String icon, ArrayList<MenuInfoX> child)
	{
		this.title = title;
		this.icon = icon;
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

	public String getIcon()
	{
		return icon;
	}

	public void setIcon(String icon)
	{
		this.icon = icon;
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
