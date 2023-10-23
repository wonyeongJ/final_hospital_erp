package com.hospital.erp.board.notice;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board/notice/*")
public class NoticeController {
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String getList(Model model)throws Exception{
	return "board/notice/list";
	}
}
