package com.hospital.erp.board.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hospital.erp.util.FileManager;

import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board/notice/*")
@Slf4j
@ToString
public class NoticeController {
	
	// NoticeService 의존성 주입
	@Autowired
    private NoticeService noticeService;
	

	// 공지사항 리스트 출력
    @GetMapping("/board/notice/list")
    public String noticeList(NoticeVO noticeVO, Model model) throws Exception {
    	
    	List<NoticeVO> data = noticeService.noticeList(noticeVO);
        // DataTables에 데이터 전달
        model.addAttribute("data", data);


        return "board/notice/list"; // list.jsp로 이동
    }
	
    // 공지사항 등록
	@GetMapping("insert")
	public String noticeInsert(Model model) {
		return "board/notice/insert";

	}
	
	@PostMapping("insert")
	public String noticeInsert(NoticeVO noticeVO) throws Exception{
		
		 log.info("=------------noticeVO {}=============", noticeVO);
		
		 int result = noticeService.noticeInsert(noticeVO);
			
			return "redirect:./list";
    }
	
	// 공지사항 상세
	@GetMapping("data/{notCd}")
	public String noticeData(@PathVariable int notCd, Model model) throws Exception {
		NoticeVO noticeVO = noticeService.noticeData(notCd);
		model.addAttribute("data", noticeVO);
		return "board/notice/data";

	}
	@GetMapping("update")
	public String noticeUpdate() {
		return "board/notice/update";

	}
	
}
