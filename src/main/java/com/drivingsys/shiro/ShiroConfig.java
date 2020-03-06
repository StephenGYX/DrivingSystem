package com.drivingsys.shiro;

import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authc.pam.FirstSuccessfulStrategy;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Shiro配置类
 */
@Configuration
public class ShiroConfig {

	@Bean("hashedCredentialsMatcher")
	public HashedCredentialsMatcher hashedCredentialsMatcher() {
		HashedCredentialsMatcher credentialsMatcher =
				new HashedCredentialsMatcher();
		//指定加密方式为MD5
		credentialsMatcher.setHashAlgorithmName("MD5");
		//加密次数
		credentialsMatcher.setHashIterations(2);
		credentialsMatcher.setStoredCredentialsHexEncoded(true);
		return credentialsMatcher;
	}

	@Bean("userRealm")
	public UserRealm userRealm(@Qualifier("hashedCredentialsMatcher") HashedCredentialsMatcher matcher) {

		UserRealm userRealm = new UserRealm();
		userRealm.setCredentialsMatcher(matcher);
		return userRealm;
	}
	@Bean("practiseRealm")
	public PractiseRealm practiseRealm(@Qualifier("hashedCredentialsMatcher") HashedCredentialsMatcher matcher) {

		PractiseRealm practiseRealm = new PractiseRealm();
		practiseRealm.setCredentialsMatcher(matcher);
		return practiseRealm;
	}

	@Bean("drivingschoolRealm")
	public DrivingschoolRealm drivingschoolRealm(@Qualifier("hashedCredentialsMatcher") HashedCredentialsMatcher matcher) {

		DrivingschoolRealm drivingschoolRealm = new DrivingschoolRealm();
		drivingschoolRealm.setCredentialsMatcher(matcher);
		return drivingschoolRealm;
	}
	@Bean("backstageRealm")
	public BackstageRealm backstageRealm(@Qualifier("hashedCredentialsMatcher") HashedCredentialsMatcher matcher) {

		BackstageRealm backstageRealm = new BackstageRealm();
		backstageRealm.setCredentialsMatcher(matcher);
		return backstageRealm;
	}


	@Bean
	public ShiroFilterFactoryBean shirFilter(@Qualifier("securityManager") DefaultWebSecurityManager securityManager) {

		ShiroFilterFactoryBean bean = new ShiroFilterFactoryBean();
		// 设置 SecurityManager
		bean.setSecurityManager(securityManager);
		// 设置登录成功跳转Url
		bean.setSuccessUrl("/");
		// 设置登录跳转Url
		bean.setLoginUrl("/toLogin");
		// 设置未授权提示Url
		bean.setUnauthorizedUrl("/nonerole");


		/**
		 * anon：匿名用户可访问
		 * authc：认证用户可访问
		 * user：使用rememberMe可访问
		 * perms：对应权限可访问
		 * role：对应角色权限可访问
		 **/
		Map<String, String> filterMap = new LinkedHashMap<>();
		filterMap.put("/jsp/frontlogin3.jsp","anon");
		filterMap.put("/jsp/area.jsp","anon");
		filterMap.put("/js/**","anon");
		filterMap.put("/css/**","anon");
		filterMap.put("/lib/**","anon");
		filterMap.put("/fact/getyzm","anon");
//		filterMap.put("/jsp/**","anon");
		filterMap.put("/jsp/*reg.jsp","anon");
		filterMap.put("/images/**","anon");
		filterMap.put("/*reg","anon");
		filterMap.put("/**/*Login","anon");
		filterMap.put("/backPractise/**","roles[practise]");
		filterMap.put("/jsp/**","anon");
		filterMap.put("/druid/**", "anon");
		filterMap.put("/static/**","anon");

		filterMap.put("/**","anon");
		filterMap.put("/logout", "logout");

		bean.setFilterChainDefinitionMap(filterMap);
		return bean;
	}

	/**
	 * 注入 securityManager
	 * 用来链接realms和subject(用户)
	 */
	@Bean(name="securityManager")
	public DefaultWebSecurityManager getDefaultWebSecurityManager(
			HashedCredentialsMatcher hashedCredentialsMatcher) {

		DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
		securityManager.setAuthenticator(myModularRealmAuthenticator());
		List<Realm> realms = new ArrayList<>();
		//设置多Realm
		realms.add(drivingschoolRealm(hashedCredentialsMatcher));
		realms.add(practiseRealm(hashedCredentialsMatcher));
		realms.add(userRealm(hashedCredentialsMatcher));
		realms.add(backstageRealm(hashedCredentialsMatcher));
		securityManager.setRealms(realms);

		return securityManager;
	}
	@Bean
	public MyModularRealmAuthenticator myModularRealmAuthenticator(){
		MyModularRealmAuthenticator authenticator = new MyModularRealmAuthenticator();
		FirstSuccessfulStrategy strategy = new FirstSuccessfulStrategy();
		authenticator.setAuthenticationStrategy(strategy);
		return authenticator;
	}
}
