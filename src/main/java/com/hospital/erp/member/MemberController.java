package com.hospital.erp.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;


/*
 * From 서동휘
 * Member 컨트롤러
 */

@Controller
@RequestMapping("/member/*")
@Slf4j
public class MemberController {

	
	  @Autowired private MemberService memberService;
	    
	
//	  // 로그인 Form 요청 메서드
//	  @GetMapping("login")
//	  public String memberLogin() throws Exception {
//		  
//		  return "root.index";
//	  }

	  @GetMapping("mypage")
	  public String memberData() throws Exception {
		  
		  return "member/mypage";
	  }
	 
	 
}
