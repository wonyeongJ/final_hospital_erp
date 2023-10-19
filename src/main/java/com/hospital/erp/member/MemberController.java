package com.hospital.erp.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	 
}
