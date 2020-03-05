package com.drivingsys.shiro;

import com.drivingsys.bean.Practise;
import org.apache.shiro.authz.Authorizer;
import org.apache.shiro.authz.ModularRealmAuthorizer;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.subject.PrincipalCollection;

public class CustomerAuthrizer extends ModularRealmAuthorizer
{
	@Override
	public boolean isPermitted(PrincipalCollection principals, String permission) {
		assertRealmsConfigured();
		Object primaryPrincipal = principals.getPrimaryPrincipal();

		for (Realm realm : getRealms()) {
			System.out.println("jin");
			if (primaryPrincipal instanceof Practise) {
				if (realm instanceof PractiseRealm) {
					return ((PractiseRealm) realm).isPermitted(principals, permission);
				}
			}


		}
		return false;
	}
}