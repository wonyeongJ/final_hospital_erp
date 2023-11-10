package com.hospital.erp.member;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
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

import com.hospital.erp.common.CodeVO;
import com.hospital.erp.department.DepartmentService;
import com.hospital.erp.department.DepartmentVO;

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
	  
	  @Autowired
	  private DepartmentService departmentService;
	    
	  
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
		  List<DepartmentVO> departmentAr = departmentService.departmentList();
		  List<CodeVO> codeAr = memberService.codeList();
		  model.addAttribute("memberVO", memberVO);
		  model.addAttribute("departmentAr", departmentAr);
		  model.addAttribute("codeAr",codeAr);
		  return "member/data";
	  }
	  
	  // 직원 등록 폼 메서드
	  @GetMapping("insert")
	  public String memberInsert(@ModelAttribute MemberVO memberVO) throws Exception {
		  return "member/insert";
	  }
	  
	  // 직원 등록 요청 메서드
	  @PostMapping("insert")
	  public String memberInsert(@Valid MemberVO memberVO, BindingResult bindingResult) throws Exception {
		  if(bindingResult.hasErrors()) {
			  log.info("=========memberVO {}=========",memberVO);
			  log.info("==========binding result 에러 {}=========", bindingResult);
			  return "member/insert";
		  }else {
			  int result = memberService.memberInsert(memberVO);
			  return "member/insert";
		  }
		  
	  }
	  
	 
	  // 업데이트 요청 메서드
	  @PostMapping("update")
	  public String memberUpdate(MemberVO memberVO) throws Exception {
		  log.info("=======memberVO update {}=======",memberVO);
		  int result = memberService.memberUpdate(memberVO);
		  return "redirect:./data?memCd="+memberVO.getMemCd();
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
				  log.info("===Password 변경 실행 {} ======= ", passwordVO);
				  memberService.memberUpdatePassword(passwordVO);
				  return "redirect:/logout";
			  }
		  }
	  }
	  
	  @ResponseBody
	  @GetMapping("memberListChart")
	  public List<MemberVO> memberListChart() throws Exception {
		  List<MemberVO> memberVO = memberService.memberListChart();
		  log.info("=============memberChart 실행");
		  return memberVO;
	  }
	  
	 
}
