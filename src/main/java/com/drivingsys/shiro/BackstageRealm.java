package com.drivingsys.shiro;

import com.drivingsys.bean.Backstage;
import com.drivingsys.bean.Drivingschool;
import com.drivingsys.dao.FrontLoginMapper;
import com.drivingsys.service.BackStageMyService;
import com.drivingsys.service.BackStageService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.Map;

public class BackstageRealm  extends AuthorizingRealm
{
	@Autowired
	private BackStageService backStageService;

	/**
	 * 用户授权
	 **/
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {

		return null;
	}

	/**
	 * 用户认证
	 **/
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authenticationToken) throws AuthenticationException
	{

		System.out.println("===BackstageRealm执行认证===");

		UsernamePasswordToken token = (UsernamePasswordToken)authenticationToken;
		Map map = new HashMap();
		map.put("account",token.getUsername());
		map.put("password",String.valueOf(token.getPassword()));

		Backstage bean = backStageService.queryBackStageAccount(map);

		if(null == bean){
			throw new UnknownAccountException();
		}

		ByteSource credentialsSalt = ByteSource.Util.bytes(bean.getBaccount());

		ByteSource salt=ByteSource.Util.bytes(bean.getBaccount());
		Object md5pwd= new SimpleHash("MD5",bean.getBpassword(),salt,2);
		return new SimpleAuthenticationInfo(bean, md5pwd, credentialsSalt, getName());
	}
}
