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

	  // 마이페이지 요청 메서드
	  @GetMapping("mypage")
	  public String memberData() throws Exception {
		  
		  return "member/mypage";
	  }
	  
	  // 직원 리스트 요청 메서드
	  @GetMapping("list")
	  public String memberList() throws Exception {
		  return "member/list";
	  }
	  
	  // 직원 등록 폼 메서드
	  @GetMapping("insert")
	  public String memberInsert() throws Exception {
		  return "member/insert";
	  }
	  
	  // 직원 등록 요청 메서드
	  @PostMapping("insert")
	  public String memberInsert(MemberVO memberVO) throws Exception {
		  return "member/insert";
	  }
	 
	 
}
