package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan(basePackages= {"controller","model"})
@EntityScan("controller")
@EnableJpaRepositories("controller")
public class Demo1Application {

	public static void main(String[] args) {
		
		ConfigurableApplicationContext cfg=SpringApplication.run(Demo1Application.class, args);
		System.out.println(cfg);
	}

}
