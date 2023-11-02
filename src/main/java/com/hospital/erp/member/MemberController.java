package com.hospital.erp.member;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
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

	
	  @Autowired 
	  private MemberService memberService;
	    
	
	  // 로그인 요청 메서드
	  @GetMapping("login")
	  public String getLogin() throws Exception {
		  return "member/login";
	  }
	  
	  // 직원 리스트 요청 메서드
	  @GetMapping("list")
	  public String memberList(Model model) throws Exception {
		  List<MemberVO> memberAr = memberService.memberList();
		  model.addAttribute("memberAr", memberAr);
		  return "member/list";
	  }
	  
	  // 직원 상세 detail 요청 메서드 detail 동시에 수정할 수 있는 udpate form 요청
	  @GetMapping("data")
	  public String memberData(MemberVO memberVO, Model model) throws Exception {
		  memberVO = memberService.memberData(memberVO);
		  model.addAttribute("memberVO", memberVO);
		  return "member/data";
	  }
	  
	  // 직원 등록 폼 메서드
	  @GetMapping("insert")
	  public String memberInsert() throws Exception {
		  return "member/insert";
	  }
	  
	  // 직원 등록 요청 메서드
	  @PostMapping("insert")
	  public String memberInsert(MemberVO memberVO) throws Exception {
		  int result = memberService.memberInsert(memberVO);
		  return "member/insert";
	  }
	  
	 
	  // 업데이트 요청 메서드
	  @PostMapping("update")
	  public String memberUpdate(MemberVO memberVO) throws Exception {
		  return "redirect:./data";
	  }
	 
	  // 마이페이지 요청 메서드
	  @GetMapping("mypage")
	  public String memberData() throws Exception {
		  
		  return "member/mypage";
	  }
	  
	  // 패스워드 업데이트 요청 메서드
	  @PostMapping("updatePassword")
	  public String memberUpdatePassword(@ModelAttribute @Valid PasswordVO passwordVO, BindingResult bindingResult) throws Exception {
		  
		  // 비밀번호 정규식패턴이 아닐경우
		  if(bindingResult.hasErrors()) {
			  return "member/mypage";
		  }else {
			  // newPassword와 newPasswordConfirm 불일치시
			  if(!passwordVO.getNewPassword().equals(passwordVO.getNewPasswordConfirm())) {
				  bindingResult.rejectValue("newPasswordConfirm","newPasswordConfirm");
				  return "member/mypage";
			  }else{
				  //패스워드 리셋 수행 메서드 호출
				  memberService.memberUpdatePassword(passwordVO);
				  return "redirect:./mypage";
			  }
		  }
	  }
	 
}
