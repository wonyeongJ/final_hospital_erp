package com.hospital.erp.board.complaints;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.hospital.erp.board.notice.NoticeController;
import com.hospital.erp.board.notice.NoticeFileVO;
import com.hospital.erp.board.notice.NoticeService;
import com.hospital.erp.board.notice.NoticeVO;

import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("board/complaints/*")
@Slf4j
@ToString
public class ComplaintsController {
	
	// ComplaintsService 의존성 주입
	@Autowired
	private ComplaintsService complaintsService;
	
	@GetMapping("list")
	public String complaintsList(ComplaintsVO complaintsVO,Model model)throws Exception{
		List<ComplaintsVO> data = complaintsService.complaintsList(complaintsVO);
        // DataTables에 데이터 전달
        model.addAttribute("data", data);


	return "board/complaints/list";
	}
	
	// 민원게시판 등록
	@GetMapping("insert")
	public String complainstInsert(){
		return "board/complaints/insert";
	}
	
	@PostMapping("insert")
	public String complaintsInsert(ComplaintsVO complaintsVO, MultipartFile[] files, HttpSession session, Model model)throws Exception{
		//MemberVO memberVO = (MemberVO)session.getAttribute("member");
		//complaintsVO.setMemCd(memberVO.getMemCd());
		
		int result = complaintsService.complaintsInsert(complaintsVO, files);
		
		String message = "등록 실패";

		if (result > 0) {
			message = "등록 성공";
		}
		model.addAttribute("message", message);
		model.addAttribute("url", "list");
		return "commons/result";
		
		
	}
	
	@GetMapping("data/{compCd}")
	public String noticeData(@PathVariable int compCd, Model model) throws Exception {
	    // 민원게시판 상세 정보를 가져옵니다.
	    ComplaintsVO complaintsVO = complaintsService.complaintsData(compCd);
	    
	    if (complaintsVO != null) {
	      

	        // 민원게시판에 속하는 파일 리스트를 가져옵니다.
	        List<ComplaintsFileVO> fileList =complaintsService.fileData(compCd);
	        complaintsVO.setList(fileList);

	        // 로그로 데이터 확인 (옵션)
	        log.info("List 데이터: {}", complaintsVO.getList());

	        // Model에 공지사항 정보를 담아서 View로 전달합니다.
	        model.addAttribute("data", complaintsVO);

	        return "board/complaints/data";
	    } else {
	        // 민원게시판이 존재하지 않을 때 예외 처리 (View에서 메시지 표시 등)
	        return "redirect:/board/complaints/list"; // 에러 페이지로 리다이렉트 또는 다른 처리
	    }
	}
	
	@GetMapping("update")
	public String complainstUpdate() {
		return "board/complaints/update";

	}
}
