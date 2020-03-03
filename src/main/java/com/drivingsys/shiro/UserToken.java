package com.drivingsys.shiro;

import org.apache.shiro.authc.UsernamePasswordToken;

public class UserToken extends UsernamePasswordToken
{
	private String loginType;

	public UserToken() {}

	public UserToken(final String username, final String password,
	                 final String loginType) {
		super(username, password);
		this.loginType = loginType;
	}

	public String getLoginType() {
		return loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}
}
