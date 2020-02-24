package com.drivingsys.bean;

import java.util.List;

public class backmsg
{
	private Integer code;
	private Integer msg;
	private int count;
	private List<Vehicle> data;

	public Integer getCode()
	{
		return code;
	}

	public void setCode(Integer code)
	{
		this.code = code;
	}

	public Integer getMsg()
	{
		return msg;
	}

	public void setMsg(Integer msg)
	{
		this.msg = msg;
	}

	public int getCount()
	{
		return count;
	}

	public void setCount(int count)
	{
		this.count = count;
	}

	public List<Vehicle> getData()
	{
		return data;
	}

	public void setData(List<Vehicle> data)
	{
		this.data = data;
	}
}
