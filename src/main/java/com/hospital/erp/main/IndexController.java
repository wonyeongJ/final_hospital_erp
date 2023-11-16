package com.hospital.erp.main;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hospital.erp.board.notice.NoticeService;
import com.hospital.erp.board.notice.NoticeVO;
import com.hospital.erp.member.MemberService;
import com.hospital.erp.member.MemberVO;
import com.hospital.erp.util.EmailService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class IndexController {


	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private NoticeService noticeService;
	
	
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
			return "redirect:/";
		}else {
			
			return "forgotPassword";
		}
	}
	

	// 중요공지 리스트 TopBar
	@GetMapping("/noticeImportantList")
	@ResponseBody
	public List<NoticeVO> noticeImportantList (NoticeVO noticeVO, Model model) throws Exception{

		 return noticeService.noticeImportantList(noticeVO);
	}
	
}
