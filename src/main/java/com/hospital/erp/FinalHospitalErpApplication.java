package com.hospital.erp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class FinalHospitalErpApplication {

	public static void main(String[] args) {
		SpringApplication.run(FinalHospitalErpApplication.class, args);
	}

}
