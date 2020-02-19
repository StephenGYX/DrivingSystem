package com.drivingsys.aspectJ;

import org.springframework.stereotype.Controller;

import java.util.Date;
//import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RequestMapping("userController")
public class UserController {

	//@RequestMapping("testAOP")
	@Log(operationType = "增加操作", operationName = "修改用户状态")
	public void testAOP(int userId){
		System.out.println("UserController被调用了~~~~~~~~~~~~~~~~···");
		System.out.println(userId);
	}
	
	@Log(operationType = "修改操作", operationName = "修改用户")
	public void testAOP2(String userName, String password){
		System.out.println("UserController被调用了~~~~~~~~~~~~~~~~···");
		String tmp = null;
		tmp.substring(1);
	}
	
}