package com.hospital.erp.member;

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
	  
	  
	  @PostMapping("list") 
	  public MemberVO memberList(MemberVO memberVO) throws Exception{ 
		  MemberVO mem = memberService.memberList(memberVO); 
		  return mem; 
		  }
	  
	  
	
	  // 로그인 메서드
	  @GetMapping("login")
	  public void memberLogin(@ModelAttribute MemberVO memberVO) throws Exception{
		  
		  
	  }
	 
}
