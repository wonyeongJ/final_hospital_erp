package com.hospital.erp.main;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.hospital.erp.util.EmailService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class IndexController {

	@Autowired
	private EmailService emailService;
	
	
	@GetMapping("/")
	public String getIndex(HttpSession session)throws Exception{

		
		return "login";
	}
	
	@GetMapping("/forgotPassword")
	public String forgotPassword() throws Exception {
		return "forgotPassword";
	}
	
	@PostMapping("/forgotPassword")
	public String forgotPassword(String email) throws Exception {
		log.info("=======forgotPassword 실행===========", email);
		emailService.sendEmail(email);
		return "forgotPassword";
	}
	

	
}
