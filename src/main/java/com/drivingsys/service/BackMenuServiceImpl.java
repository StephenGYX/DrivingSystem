package com.drivingsys.service;

import com.drivingsys.bean.RoleMenu;
import com.drivingsys.bean.backmenu.BackMenu;
import com.drivingsys.bean.backmenu.MenuInfoX;
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
	public BackMenu queryRoleMenu(int rid)
	{
		//需要返回的数据
		BackMenu backMenu = new BackMenu();

		//查询数据库角色类型所对应的菜单集合
		List<RoleMenu> roleMenus = backMenuMapper.queryRoleMenu(rid);

		//一二级菜单目录
		ArrayList<MenuInfoX> menuInfos = new ArrayList<>();

		//循环遍历
		for (int i = 0; i <roleMenus.size() ; i++)
		{
			RoleMenu rm = roleMenus.get(i);
			String firtitle = rm.getFirtitle();
			boolean flag = false;
			int k = -1;

			//判断该集合中是否已经存入该一级菜单
			for (int j = 0; j < menuInfos.size(); j++)
			{
				k++;
				if(menuInfos.get(j)==null || menuInfos.get(j).getTitle().equals(firtitle)){
					flag = true;
					break;
				}
			}

			//如果不存在,则创建一个一级目录对象，并且添加到目录中，等待添加二级目录
			if(flag==false){

				//新增的一级目录对象，并添加入总目录中
				MenuInfoX firMenuInfo = new MenuInfoX();
				firMenuInfo.setTitle(rm.getFirtitle());
				firMenuInfo.setHref(rm.getFirURL());
				firMenuInfo.setIcon(rm.getFiricon());
				firMenuInfo.setTarget(rm.getFirtarget());

				//创建一个二级目录的容器,存入一级目录对象中
				ArrayList<MenuInfoX> menuInfoArr = new ArrayList<>();
				firMenuInfo.setChild(menuInfoArr);
				menuInfos.add(firMenuInfo);


				//添加二级目录至，二级目录容器中
				MenuInfoX secMenuInfo = new MenuInfoX();
				secMenuInfo.setTitle(rm.getSectitle());
				secMenuInfo.setTarget(rm.getSectarget());
				secMenuInfo.setIcon(rm.getSecicon());
				secMenuInfo.setHref(rm.getSecURL());
				firMenuInfo.getChild().add(secMenuInfo);
			}

			//表示目前存在该一级目录对象,则直接存入二级对象即可
			else{

				//添加二级目录至，二级目录容器中
				MenuInfoX secMenuInfo = new MenuInfoX();
				secMenuInfo.setTitle(rm.getSectitle());
				secMenuInfo.setTarget(rm.getSectarget());
				secMenuInfo.setIcon(rm.getSecicon());
				secMenuInfo.setHref(rm.getSecURL());
				menuInfos.get(k).getChild().add(secMenuInfo);
			}
		}

		//插入数据库查找的一二级目录，并且返回
		backMenu.getMenuInfo().getCurrency().setChild(menuInfos);
		return backMenu;
	}

	@Override
	public void queryMenuByRole()
	{

	}
}
