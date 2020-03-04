package com.drivingsys.shiro;

import com.drivingsys.bean.Practise;
import com.drivingsys.dao.FrontLoginMapper;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class PractiseRealm extends AuthorizingRealm
{
	@Autowired
	private FrontLoginMapper userService;

	/**
	 * 用户授权
	 **/
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {

				System.out.println("===执行授权===");

				Subject subject = SecurityUtils.getSubject();
//				Practise user = (Practise)subject.getPrincipal();

				SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
					// 角色与权限字符串集合


				info.addRole("practise");
				return info;

	}

	/**
	 * 用户认证
	 **/
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authenticationToken) throws AuthenticationException
	{

		System.out.println("===PractiseRealm执行认证===");

		UsernamePasswordToken token = (UsernamePasswordToken)authenticationToken;
		Map map = new HashMap();
		map.put("account",token.getUsername());
		map.put("password",String.valueOf(token.getPassword()));
		Practise bean = userService.queryPractiseAccount(map);

		if(null == bean){
			throw new UnknownAccountException();
		}

		ByteSource credentialsSalt = ByteSource.Util.bytes(bean.getPaccount());

		return new SimpleAuthenticationInfo(bean, bean.getPpassword(), credentialsSalt, getName());
	}

}
