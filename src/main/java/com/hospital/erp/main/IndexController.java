package com.hospital.erp.main;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.hospital.erp.member.MemberService;
import com.hospital.erp.member.MemberVO;
import com.hospital.erp.util.EmailService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class IndexController {


	
	@Autowired
	private MemberService memberService;
	
	
	@GetMapping("/")
	public String getIndex(HttpSession session)throws Exception{

		
		return "login";
	}
	
	@GetMapping("/forgotPassword")
	public String forgotPassword() throws Exception {
		return "forgotPassword";
	}
	
	@PostMapping("/forgotPassword")
	public String forgotPassword(MemberVO memberVO) throws Exception {
		log.info("=======forgotPassword 실행=========== {}", memberVO);
		int result = memberService.memberUpdateForgotPassword(memberVO);
		log.info("==========컨트롤러에서 result 값 확인 {}========", result);
		// 비밀번호 업데이트 성공
		if(result > 0 ) {
			return "/login";
		}
		return "forgotPassword";
	}
	

	
}
