package com.drivingsys.service;

import com.drivingsys.bean.RoleMenu;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface BackMenuService
{

	/**
	 * 查找角色对应的id
	 * @param rid
	 */
	public HashMap<String, ArrayList<RoleMenu>> queryRoleMenu(int rid);


}
