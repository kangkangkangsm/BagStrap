package com.example.bagStrap;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.example.bagStrap.mapper") // ItemMapper가 위치한 패키지
public class BagStrapApplication {

	public static void main(String[] args) {
		SpringApplication.run(BagStrapApplication.class, args);
	}

}
