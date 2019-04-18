package com.ibm.fixmyship;

import java.util.TimeZone;

import javax.annotation.PostConstruct;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.convert.threeten.Jsr310JpaConverters;

@SpringBootApplication
@EntityScan(basePackageClasses = { FixmyshipApplication.class, Jsr310JpaConverters.class })
public class FixmyshipApplication {

	@PostConstruct
	void init() {
		TimeZone.setDefault(TimeZone.getTimeZone("Asia/Kolkata"));
		String name = TimeZone.getDefault().getDisplayName();         
		System.out.println("Display name for default time zone: "+ name);  
	}

	public static void main(String[] args) {
		SpringApplication.run(FixmyshipApplication.class, args);
	}

}
