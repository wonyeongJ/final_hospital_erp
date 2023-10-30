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

import com.hospital.erp.file.FileVO;
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
	public String noticeInsert(NoticeVO noticeVO,MultipartFile[] files) throws Exception{
		
		 log.info("=------------noticeVO {}=============", noticeVO);
		
		 int result = noticeService.noticeInsert(noticeVO, files);
			
			return "redirect:./list";
    }
	
	// 공지사항 상세
	@GetMapping("data/{notCd}")
	public String noticeData(NoticeVO noticeVO, Model model) throws Exception {
		noticeVO = noticeService.noticeData(noticeVO);
		model.addAttribute("data", noticeVO);
		
		return "board/notice/data";

	}
	
	// FileDown
	@GetMapping("fileDown")
	public String getFileDown(NoticeFileVO noticeFileVO, Model model)throws Exception{
		noticeFileVO = (NoticeFileVO) noticeService.fileData(noticeFileVO);
		model.addAttribute("noticeFileVO", noticeFileVO);
		return "fileDownView";
	}
	
	
	//update	
	@GetMapping("update/{notCd}")
	public String getUpdate(NoticeVO noticeVO, Model model)throws Exception{
			
		noticeVO = noticeService.noticeData(noticeVO);
		
		model.addAttribute("data",noticeVO);
			
		return "board/notice/update";
	}
	//update
	@PostMapping("update")
	public String getUpdate(NoticeVO noticeVO,MultipartFile[] files,HttpSession session, Model model)throws Exception{
			 
		int result = noticeService.noticeUpdate(noticeVO, files);
			 
		String message = "등록 실패";

		if (result > 0) {
			message = "등록 성공";
			}
		model.addAttribute("message", message);
		model.addAttribute("url", "list");
		
		return "commons/result";
		}
	
}
