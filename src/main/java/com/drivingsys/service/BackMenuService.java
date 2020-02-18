package com.drivingsys.service;

import com.drivingsys.bean.RoleMenu;
import com.drivingsys.bean.backmenu.BackMenu;
import com.drivingsys.bean.backmenu.ZtreeMenu;

import java.util.ArrayList;
import java.util.List;

public interface BackMenuService
{

	/**
	 * 查找角色对应的id
	 * @param rid
	 */
	public BackMenu queryRoleMenu(int rid);

	/**
	 * 初始化菜单权限
	 * @return
	 */
	public List<ZtreeMenu> initMenuChange(int rid);

	/**
	 * 修改角色菜单
	 * @param rid
	 */
	public int updateMenu(int rid, ArrayList<Integer> check);
}
