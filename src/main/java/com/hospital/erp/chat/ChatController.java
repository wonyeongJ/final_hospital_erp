package com.hospital.erp.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hospital.erp.board.notice.NoticeController;

import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/chat/*")
@Slf4j
@ToString
public class ChatController {

	@RequestMapping("chating")
	public String chat() {
		
		return "chat/chating";
	}
}
