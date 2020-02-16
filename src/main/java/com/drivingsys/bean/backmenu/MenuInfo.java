package com.drivingsys.bean.backmenu;

public class MenuInfo
{
	private Currency currency = new Currency();

	public MenuInfo()
	{
	}

	public MenuInfo(Currency currency)
	{
		this.currency = currency;
	}

	public Currency getCurrency()
	{
		return currency;
	}

	public void setCurrency(Currency currency)
	{
		this.currency = currency;
	}
}
