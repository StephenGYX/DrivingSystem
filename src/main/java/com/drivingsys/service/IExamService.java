package com.drivingsys.service;

import com.drivingsys.bean.Cuoti;
import com.drivingsys.bean.Kaoti;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IExamService
{

	public List<Kaoti> selectAll(String kemu);
	public List<Kaoti> selectRand();
	public int cuotiAdd(Cuoti cuoti);
	public List<Kaoti>  selectWrong(String cid,String kemu);
}
