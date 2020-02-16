package com.drivingsys.service;

import com.drivingsys.bean.RoleMenu;
import com.drivingsys.dao.BackMenuMapper;
import com.drivingsys.dao.BackStageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("backMenuService")
public class BackMenuServiceImpl implements BackMenuService
{

	@Autowired
	private BackMenuMapper backMenuMapper;

	/**
	 * 查询对应角色的已分配菜单
	 * @param rid
	 * @return
	 */
	@Override
	public List<RoleMenu> queryRoleMenu(int rid)
	{
		return backMenuMapper.queryRoleMenu(rid);
	}
}
