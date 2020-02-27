package com.drivingsys.bean;

import java.util.HashMap;

public class FileUploadMsg
{
	private String code="0";
	private String msg="";
	private HashMap<String,String> data;

	public FileUploadMsg()
	{
	}

	public FileUploadMsg(String code, String msg, HashMap<String, String> data)
	{
		this.code = code;
		this.msg = msg;
		this.data = data;
	}

	public String getCode()
	{
		return code;
	}

	public void setCode(String code)
	{
		this.code = code;
	}

	public String getMsg()
	{
		return msg;
	}

	public void setMsg(String msg)
	{
		this.msg = msg;
	}

	public HashMap<String, String> getData()
	{
		return data;
	}

	public void setData(HashMap<String, String> data)
	{
		this.data = data;
	}
}
