package com.hospital.erp.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board/notice/*")
public class NoticeController {
	
	@Autowired
    private NoticeService noticeService;

    @GetMapping("/board/notice/list")
    public String noticeList(NoticeVO noticeVO, Model model) throws Exception {
    	
    	List<NoticeVO> noticeList = noticeService.noticeList(noticeVO);

        // DataTables에 데이터 전달
        model.addAttribute("noticeList", noticeList);


        return "board/notice/list"; // list.jsp로 이동
    }
	
	@GetMapping("insert")
	public String noticeInsert() {
		return "board/notice/insert";

	}
	
	@GetMapping("data")
	public String noticeData() {
		return "board/notice/data";

	}
	@GetMapping("update")
	public String noticeUpdate() {
		return "board/notice/update";

	}
	
}
