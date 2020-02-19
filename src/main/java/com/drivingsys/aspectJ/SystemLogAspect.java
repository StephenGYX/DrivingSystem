package com.drivingsys.aspectJ;

import com.drivingsys.bean.LogInfo;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.HashMap;

@Aspect
@Component
public class SystemLogAspect
{

//	@Autowired
//	private LogService logService;

	@Pointcut("execution(* *..UserController.testAOP(..))")
	//    @Pointcut("execution(public * *.*(..))")
	public void logPointcut() {
	}

	//自定义注解的处理
	@After(value = "logPointcut()")
	public void after(JoinPoint joinPoint) throws Exception
	{
		System.out.println("方法进来了！");

		//获取目标对象的类名
		String targetClassName = joinPoint.getTarget().getClass().getName();
		//获取方法名称
		String methodName = joinPoint.getSignature().getName();
		//获取参数值
		Object[] args = joinPoint.getArgs();

		//日志对象
		LogInfo logInfo = new LogInfo();
		int j = 0;

		Class targetClass = Class.forName(targetClassName);
		Method[] methods = targetClass.getMethods();
		boolean isMatch = true;
		String operationType = null;
		String operationName = null;
		for (Method method : methods)
		{
			if (method.getName().equals(methodName))
			{
				Class[] argCls = method.getParameterTypes();
				if (argCls.length == args.length)
				{
					for (int i = 0; i < args.length; i++)
					{
						if (args[i] instanceof HttpServletRequest && argCls[i] == HttpServletRequest.class)
						{
							continue;
						}
						if (args[i] instanceof HttpServletResponse && argCls[i] == HttpServletResponse.class)
						{
							continue;
						}
						if (argCls[i] == args[i].getClass())
						{
							continue;
						}

						isMatch = false;
						break;
					}

//					System.out.println(method.getAnnotation(Log.class).operationType());

//					if (!isMatch)
//					{
//						continue;
//					}

					operationType = method.getAnnotation(Log.class).operationType();
					operationName = method.getAnnotation(Log.class).operationName();

					System.out.println(operationType);
					System.out.println(operationName);

					int userId = (int) args[0];
					logInfo.setUser_Id(userId);
					logInfo.setLog_Type(operationName);
					logInfo.setLog_Time(new Date().toLocaleString());

					ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
//					LogService logServiceImpl = ac.getBean("logServiceImpl", LogService.class);
//					int i1 = logServiceImpl.insertNewLog(logInfo);
//					System.out.println("插入成功："+i1);

				}
			}
		}
	}
}