package com.drivingsys.dao;

import com.drivingsys.bean.RoleMenu;
import com.drivingsys.bean.backmenu.MenuDetail;
import com.drivingsys.bean.backmenu.ZtreeMenu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Array;
import java.util.ArrayList;
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
	 * 初始化菜单权限
	 * @return
	 */
	public List<ZtreeMenu> initMenuChange(int rid);

	/**
	 * 初始化该角色菜单权限
	 * @param rid
	 * @return
	 */
	public int initMenuToZero(int rid);

	/**
	 * 更新角色菜单修改
	 * @param rid
	 * @param list
	 * @return
	 */
	public int updateMenu(@Param("rid") int rid, @Param("list") ArrayList<Integer> list);
}
