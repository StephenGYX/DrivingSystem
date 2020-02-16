package com.drivingsys.service;

import com.drivingsys.bean.RoleMenu;
import com.drivingsys.bean.backmenu.BackMenu;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface BackMenuService
{

	/**
	 * 查找角色对应的id
	 * @param rid
	 */
	public BackMenu queryRoleMenu(int rid);

	public void queryMenuByRole();
}
