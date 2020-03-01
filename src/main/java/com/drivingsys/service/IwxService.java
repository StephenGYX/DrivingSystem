package com.drivingsys.service;

import com.drivingsys.bean.tableParam;

import java.util.List;

public interface IwxService
{
	public String login(String account,String pwd);
	public List selectmonirecord(String cid, String kemu);

}
