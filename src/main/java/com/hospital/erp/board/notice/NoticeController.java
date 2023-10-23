package com.hospital.erp.board.notice;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board/notice/*")
public class NoticeController {
	
	@GetMapping("list")
	public String noticeList(Model model)throws Exception{
	return "board/notice/list";
	}
	
	@GetMapping("insert")
	public String noticeInsert() {
		return "board/notice/insert";

	}
	
	@GetMapping("detail")
	public String noticeDetail() {
		return "board/notice/detail";

	}
	@GetMapping("update")
	public String noticeUpdate() {
		return "board/notice/update";

	}
	
}
