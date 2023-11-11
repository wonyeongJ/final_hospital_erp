package com.hospital.erp.commute;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

/*
 * From 서동휘
 * Commute 컨트롤러
 * 근태 관련
 */
@Controller
public class CommuteController {
	
	@Autowired
	private CommuteService commuteService;
	
	@PostMapping("commuteInsert")
	public void commuteInsert(CommuteVO commuteVO) throws Exception {
		int result = commuteService.commuteInsert(commuteVO);
	}

}
