package com.drivingsys.drivingsystem;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DrivingsystemApplication
{
	public static void main(String[] args)
	{
		SpringApplication.run(DrivingsystemApplication.class, args);
		System.out.println("服务器启动了！");
	}

}
