package com.drivingsys.bean.backmenu;

public class LogoInfo
{
	private String title = "驾考后台管理系统";
	private String image = "images/logo.png";
	private String href = "";

	public LogoInfo()
	{
	}

	public LogoInfo(String title, String image, String href)
	{
		this.title = title;
		this.image = image;
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

	public String getImage()
	{
		return image;
	}

	public void setImage(String image)
	{
		this.image = image;
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
