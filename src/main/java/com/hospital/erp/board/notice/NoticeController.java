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
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String noticeInsert(NoticeVO noticeVO,MultipartFile[] files, Model model) throws Exception{
		

		
		 int result = noticeService.noticeInsert(noticeVO, files);
		 
		 if (result == -1) {
	            // 중요 공지사항 제한에 도달했을 때 메시지 표시
	            String message = "중요 공지사항은 3개까지 등록 가능합니다. 등록되어 있는 중요 공지사항을 일반 공지사항으로 수정 후 다시 등록해주세요.";
	            model.addAttribute("message", message);
	            model.addAttribute("url", "insert");
	        } else {
	            String message = "등록 실패";
	            if (result > 0) {
	                message = "등록 성공";
	            }
	            model.addAttribute("message", message);
	            model.addAttribute("url", "list");
	        }
			
			
			return "commons/result";
    }
	
	@GetMapping("data/{notCd}")
	public String noticeData(@PathVariable int notCd, Model model) throws Exception {
	    // 공지사항 상세 정보를 가져옵니다.
	    NoticeVO noticeVO = noticeService.noticeData(notCd);
	    
	    if (noticeVO != null) {
	        // 공지사항 조회수 증가
	        noticeService.noticeHitCount(notCd);

	        // 공지사항에 속하는 파일 리스트를 가져옵니다.
	        List<NoticeFileVO> fileList =noticeService.fileData(notCd);
	        noticeVO.setList(fileList);

	        // 로그로 데이터 확인 (옵션)
	        log.info("List 데이터: {}", noticeVO.getList());

	        // Model에 공지사항 정보를 담아서 View로 전달합니다.
	        model.addAttribute("data", noticeVO);

	        return "board/notice/data";
	    } else {
	        // 공지사항이 존재하지 않을 때 예외 처리 (View에서 메시지 표시 등)
	        return "redirect:/board/notice/list"; // 에러 페이지로 리다이렉트 또는 다른 처리
	    }
	}
	
	@GetMapping("fileDown/{bfCd}")
	public String fileDown(int bfCd,NoticeFileVO noticeFileVO, Model model)throws Exception{
		List<NoticeFileVO> fileList = noticeService.fileData(bfCd);
		model.addAttribute("list", fileList);
		return "fileDownView";
	}
	
	// FileDelete
	@GetMapping("fileDelete")
	public String fileDelete(int notCd,NoticeFileVO noticeFileVO,Model model,HttpSession session) throws Exception{
		
		int result = noticeService.fileDelete(notCd, noticeFileVO, session);
		model.addAttribute("result",result);
		
		return "commons/ajaxResult";
	}
	
	
	//update	
	@GetMapping("update/{notCd}")
	public String noticeUpdate(@PathVariable int notCd,NoticeVO noticeVO, Model model)throws Exception{
			
		noticeVO = noticeService.noticeData(notCd);
		
		 // 공지사항에 속하는 파일 리스트를 가져옵니다.
        List<NoticeFileVO> fileList =noticeService.fileData(notCd);
        noticeVO.setList(fileList);

        log.info("=======notice {}=========", fileList);
        
		
		model.addAttribute("data",noticeVO);
			
		return "board/notice/update";
	}
	
	//update
	@PostMapping("update")
	public String noticeUpdate(NoticeVO noticeVO,MultipartFile[] files,HttpSession session, Model model)throws Exception{
			 
		int result = noticeService.noticeUpdate(noticeVO, files);
		
		if (result == -1) {
            // 중요 공지사항 제한에 도달했을 때 메시지 표시
            String message = "중요 공지사항은 3개까지 등록 가능합니다. 등록되어 있는 중요 공지사항을 일반 공지사항으로 수정 후 다시 등록해주세요.";
            model.addAttribute("message", message);
            model.addAttribute("url", "list");
        } else {
            String message = "등록 실패";
            if (result > 0) {
                message = "등록 성공";
            }
            model.addAttribute("message", message);
            model.addAttribute("url", "list");
        }
		return "commons/result";
		}
	
	
	/// Delete
	@RequestMapping(value = "delete/{notCd}", method = RequestMethod.POST)
	@ResponseBody
	public String noticeDelete(@PathVariable int notCd) throws Exception {
	    int result = noticeService.noticeDelete(notCd);

	    if (result > 0) {
	        return "success";
	    } else {
	        return "failure";
	    }
	}
		
}
	

