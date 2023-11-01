package com.hospital.erp.main;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class IndexController {

	@GetMapping("/")
	public String getIndex(HttpSession session)throws Exception{

		
		return "login";
	}
	
}
