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
	    
	
	  // 로그인 Form 요청 메서드
	  @GetMapping("login")
	  public String memberLogin() throws Exception {
		  
		  return "member/login";
	  }
	  
	  // 로그인 메서드
	  @PostMapping("login")
	  public String memberLogin(MemberVO memberVO) throws Exception {
		  // 로그인 ID PASSWORD 일치 조회 일치하면 1 불일치시 0
		  int result = memberService.memberLogin(memberVO);
		  
		  return "/";
	  }
	  
	  // 로그아웃 메서드
	  @GetMapping("logout")
	  public String memberLogout(HttpSession session) throws Exception {
		  
		  // 세션 시간값 종료 시키는 메서드
		  session.invalidate();
			
		  return "redirect:../";
		}
	 
}
