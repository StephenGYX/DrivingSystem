package com.drivingsys;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

//@SpringBootApplication
@EnableAutoConfiguration
@ComponentScan(basePackages={"com.drivingsys"})
public class DrivingsystemApplication
{
	public static void main(String[] args)
	{
		SpringApplication.run(DrivingsystemApplication.class, args);
		System.out.println("服务器启动了！");
	}

}
