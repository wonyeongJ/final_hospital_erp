package com.hospital.erp.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	
	  @Autowired private MemberService memberService;
	  
	  @ResponseBody
	  
	  @PostMapping("list") 
	  public MemberVO memberList(MemberVO memberVO) throws Exception{ 
		  MemberVO mem = memberService.memberList(memberVO); 
		  return mem; 
		  }
	  
	  
	  /*
	   * From 서동휘
	   * 멤버 로그인 메서드
	   */
	  @GetMapping("login")
	  public void memberLogin(MemberVO memberVO) throws Exception{
		  
		  
	  }
	 
}
