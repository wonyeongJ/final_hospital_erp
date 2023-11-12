package com.hospital.erp.commute;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/*
 * From 서동휘
 * Commute 컨트롤러
 * 근태 관련
 */
@Controller
@RequestMapping("/commute/*")
@Slf4j
public class CommuteController {
	
	@Autowired
	private CommuteService commuteService;
	
	@PostMapping("insert")
	public String commuteInsert(CommuteVO commuteVO) throws Exception {
		int result = commuteService.commuteInsert(commuteVO);
		return "redirect:/member/mypage";
	}

	@PostMapping("update")
	public String commuteUpdate(CommuteVO commuteVO) throws Exception {
		log.info("=====commute VO {} ========",commuteVO);
		int result = commuteService.commuteUpdate(commuteVO);
		return "redirect:/member/mypage";
	}
}
