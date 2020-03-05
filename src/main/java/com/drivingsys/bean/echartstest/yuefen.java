package com.drivingsys.bean.echartstest;

import java.util.ArrayList;
import java.util.List;

public class yuefen
{
	// {
	// 	name: '直接访问',
	// 	type: 'line',
	// 	stack: '总量',
	// 	areaStyle: {},
	// 	data: [320, 332, 301, 334, 390, 330, 320]
	// },

	private String name;
	private String type="line";
	private List<Integer> data=new ArrayList<>();

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getType()
	{
		return type;
	}

	public void setType(String type)
	{
		this.type = type;
	}

	public List<Integer> getData()
	{
		return data;
	}

	public void setData(List<Integer> data)
	{
		this.data = data;
	}
}
