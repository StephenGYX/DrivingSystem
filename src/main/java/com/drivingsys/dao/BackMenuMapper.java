package com.drivingsys.dao;

import com.drivingsys.bean.RoleMenu;
import com.drivingsys.bean.backmenu.MenuDetail;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface BackMenuMapper
{

	/**
	 * 获取二级菜单信息
	 * @param rid
	 * @return
	 */
	public List<RoleMenu> queryRoleMenu(int rid);

	/**
	 * 获取一级菜单信息
	 * @param rid
	 * @return
	 */
	public List<MenuDetail> queryFirstMenuByRole(int rid);
}
