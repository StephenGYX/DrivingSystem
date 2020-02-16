package com.drivingsys.bean.backmenu;

public class BackMenu
{
	private ClearInfo clearInfo = new ClearInfo();
	private HomeInfo homeInfo = new HomeInfo();
	private LogoInfo logoInfo = new LogoInfo();
	private MenuInfo menuInfo = new MenuInfo();

	public BackMenu()
	{
	}

	public BackMenu(ClearInfo clearInfo, HomeInfo homeInfo, LogoInfo logoInfo, MenuInfo menuInfo)
	{
		this.clearInfo = clearInfo;
		this.homeInfo = homeInfo;
		this.logoInfo = logoInfo;
		this.menuInfo = menuInfo;
	}

	public ClearInfo getClearInfo()
	{
		return clearInfo;
	}

	public void setClearInfo(ClearInfo clearInfo)
	{
		this.clearInfo = clearInfo;
	}

	public HomeInfo getHomeInfo()
	{
		return homeInfo;
	}

	public void setHomeInfo(HomeInfo homeInfo)
	{
		this.homeInfo = homeInfo;
	}

	public LogoInfo getLogoInfo()
	{
		return logoInfo;
	}

	public void setLogoInfo(LogoInfo logoInfo)
	{
		this.logoInfo = logoInfo;
	}

	public MenuInfo getMenuInfo()
	{
		return menuInfo;
	}

	public void setMenuInfo(MenuInfo menuInfo)
	{
		this.menuInfo = menuInfo;
	}
}
