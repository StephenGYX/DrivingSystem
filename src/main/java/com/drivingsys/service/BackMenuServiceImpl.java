package com.drivingsys.service;

import com.drivingsys.bean.RoleMenu;
import com.drivingsys.dao.BackMenuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
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
	public HashMap<String, ArrayList<RoleMenu>> queryRoleMenu(int rid)
	{
		//查询数据库角色类型所对应的菜单集合
		List<RoleMenu> roleMenus = backMenuMapper.queryRoleMenu(rid);

		//创建要传输的hashmap菜单
		HashMap<String, ArrayList<RoleMenu>> finalMenuMap = new HashMap<>();

		//遍历数据库集合，并且利用键值对的形式存入hashmap中
		for (int i = 0; i < roleMenus.size(); i++)
		{
			RoleMenu menuInfo = roleMenus.get(i);

			//判断一级菜单是否已经存入(是的情况)
			if (finalMenuMap.containsKey(menuInfo.getFirst()))
			{

				//获取该键对应的值
				ArrayList<RoleMenu> menuInfos1 = finalMenuMap.get(menuInfo.getFirst());

				//将对象存入该原有集合中
				menuInfos1.add(menuInfo);
			}
			//否的情况
			else
			{

				//不存在,创建一个储存二级菜单的集合；
				ArrayList<RoleMenu> menuInfos = new ArrayList<>();

				//将该未重名的对象放入
				menuInfos.add(menuInfo);

				//再添加入hashmap当中(一级菜单名，二级菜单对象数组)
				finalMenuMap.put(menuInfo.getFirst(), menuInfos);
			}
		}

		return finalMenuMap;
	}
}
