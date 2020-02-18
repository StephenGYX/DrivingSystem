package com.drivingsys.service;

import com.drivingsys.bean.Backstage;
import org.springframework.stereotype.Service;

import java.util.Map;

public interface BackStageService
{
	/**
	 *
	 * @param map
	 * @return
	 */
	public Backstage queryBackStageAccount(Map<String,String> map);
}
