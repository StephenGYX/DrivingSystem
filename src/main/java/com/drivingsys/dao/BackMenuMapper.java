package com.drivingsys.dao;

import com.drivingsys.bean.RoleMenu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface BackMenuMapper
{

	public List<RoleMenu> queryRoleMenu(int rid);

}
