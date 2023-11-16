package com.hospital.erp.commute;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hospital.erp.schedule.ScheduleService;
import com.hospital.erp.schedule.ScheduleVO;

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
	
	@Autowired
	private ScheduleService scheduleService;
	
	@PostMapping("insert")
	public String commuteInsert(CommuteVO commuteVO) throws Exception {
		int result = commuteService.commuteInsert(commuteVO);
		ScheduleVO scheduleVO = new ScheduleVO();
		scheduleVO.setMemCd(commuteVO.getMemCd());
		scheduleService.commuteInsert(scheduleVO);
		
		return "redirect:/member/mypage";
	}

	@PostMapping("update")
	public String commuteUpdate(CommuteVO commuteVO) throws Exception {
		log.info("=====commute VO {} ========",commuteVO);
		int result = commuteService.commuteUpdate(commuteVO);
		return "redirect:/member/mypage";
	}
}
