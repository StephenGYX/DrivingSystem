package com.drivingsys.bean;


import java.util.List;

public class backmsgall
{
	private Integer code;
	private Integer msg;
	private int count;
	private List<Backstage> data;

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

	public List<Backstage> getData()
	{
		return data;
	}

	public void setData(List<Backstage> data)
	{
		this.data = data;
	}

}
