package com.drivingsys.aspectJ;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

/**
 * 切面
 */
@Aspect
@Component
public class myAspectJ
{

	/**
	 * 切点
	 * 修饰符，返回类型，对象路径，参数
	 */
	@Pointcut("execution(* *..UserService.login(..))")
	public void pointCut(){
	}

//		@Pointcut("within(com.drivingsys.controller..*)")
//		public void pointCut(){
//		}


	//通知
	@Before("pointCut()")
	public void before(JoinPoint joinPoint){
		System.out.println("先执行了！");
		System.out.println(joinPoint);
	}

	@AfterReturning(value = "pointCut()",returning = "result")
	public void afterReturning(Object result){
		System.out.println(result);
	}

	@Around("pointCut()")
	public Object around(ProceedingJoinPoint pjp) throws Throwable{
		System.out.println("环绕前通知");
		Object result = pjp.proceed();
		System.out.println("环绕后通知");
		return result;
	}

	@AfterThrowing(value = "pointCut()",throwing = "e")
	public void afterThrowing(Exception e){
		System.out.println(e);
	}

	@After("pointCut()")
	public void after(){
		System.out.println("最终通知");
	}


}
