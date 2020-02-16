package com.drivingsys.service;

import com.drivingsys.bean.RoleMenu;

import java.util.List;

public interface BackMenuService
{

	/**
	 * 查找角色对应的id
	 * @param rid
	 */
	public List<RoleMenu> queryRoleMenu(int rid);
}
