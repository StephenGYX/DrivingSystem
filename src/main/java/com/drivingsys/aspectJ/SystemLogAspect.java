package com.drivingsys.aspectJ;

import com.drivingsys.bean.*;
import com.drivingsys.service.LogService;
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
import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

@Aspect
@Component
public class SystemLogAspect
{

	@Autowired
	private LogService logService;

	@Autowired
	private HttpServletRequest request;

	@Pointcut("execution(* *..BackStageController.backLogin(..))")
	public void backStagePointcut()
	{
	}

	/**
	 * 自定义注解的处理
	 *
	 * @param joinPoint
	 * @throws Exception
	 */
	@After(value = "backStagePointcut()")
	public void after(JoinPoint joinPoint) throws Exception
	{
		System.out.println("backStagePointcut方法进来了！");

		//获取目标对象的类名
		String targetClassName = joinPoint.getTarget().getClass().getName();
		System.out.println("类名：" + targetClassName);

		//获取方法名称
		String methodName = joinPoint.getSignature().getName();
		System.out.println("方法名：" + methodName);

		//获取参数值
		Object[] args = joinPoint.getArgs();
		System.out.println("参数：" + args);

		//获取访问id
		String s = InetAddress.getLocalHost().toString().substring(InetAddress.getLocalHost().toString().lastIndexOf("/") + 1);
		System.out.println("登录ip：" + s);

		//判断调用的角色
		int role = -1;
		Backstage backstage = (Backstage) request.getSession().getAttribute("backstage");
		Drivingschool drivingschool = (Drivingschool) request.getSession().getAttribute("drivingschool");
		Consumer consumer = (Consumer) request.getSession().getAttribute("consumer");
		Practise practise = (Practise) request.getSession().getAttribute("practise");

		//判断是哪个
		if (backstage != null)
		{
			//管理员
			role = 0;
		} else if (drivingschool != null)
		{
			//驾校
			role = 1;
		} else if (consumer != null)
		{
			//教练
			role = 2;
		} else if (practise != null)
		{
			//学员
			role = 3;
		}

		//日志对象
		com.drivingsys.bean.Log log = new com.drivingsys.bean.Log();
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

					System.out.println("操作类型：" + operationType);
					System.out.println("操作名称：" + operationName);

					//操作时间
					Date date = new Date();
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");

					//判断是哪个角色
					switch (role)
					{
						//管理员角色
						case 0:
							log.setLoperatorid(backstage.getBid());
							log.setLrole(backstage.getRid());
							break;

						//驾校角色
						case 1:
							log.setLoperatorid((int) drivingschool.getDid());
							log.setLrole((int) drivingschool.getRid());
							break;

						//教练
						case 2:
							log.setLoperatorid((int) practise.getPid());
							log.setLrole((int) practise.getRid());
							break;

						//学员
						case 3:
							log.setLoperatorid((int) consumer.getCid());
							log.setLrole((int) consumer.getRid());
							break;

						//异常情况（无用户登录）
						default:
							log.setLoperatorid(-1);
							log.setLrole(-1);
							break;
					}

					//要存入的log对象
					log.setLip(s);
					log.setLtime(dateFormat.format(date));
					log.setLtype(operationType);
					log.setLbehavior(operationName);
					log.setLmethod(targetClassName + "." + methodName);

					int i = logService.insertNewLog(log);
					System.out.println("插入成功：" + i);
				}
			}
		}
	}
}