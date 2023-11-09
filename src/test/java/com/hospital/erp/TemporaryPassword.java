package com.hospital.erp;

import java.util.Random;

import org.junit.jupiter.api.Test;
import org.junit.platform.commons.annotation.Testable;


public class TemporaryPassword {

	@Test
	public void passwordCreate() {
		
		 String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	        int length = 8;
	        StringBuilder password = new StringBuilder();
	        Random random = new Random();

	        for (int i = 0; i < length; i++) {
	            password.append(chars.charAt(random.nextInt(chars.length())));
	        }

	        System.out.println(password.toString());
	
	}

}
