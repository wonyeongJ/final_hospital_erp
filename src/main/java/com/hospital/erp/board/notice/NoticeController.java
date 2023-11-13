package com.hospital.erp.board.notice;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hospital.erp.file.FileVO;
import com.hospital.erp.member.MemberVO;
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
	
	@ModelAttribute("board")
	public String getBoard() {
		return "notice";
	}
	

	// 공지사항 리스트 출력
    @GetMapping("/board/notice/list")
    public String noticeList (@AuthenticationPrincipal MemberVO memberVO,NoticeVO noticeVO, Model model) throws Exception {
    	
    	
    	model.addAttribute("member", memberVO.getDepCd());

    
    	List<NoticeVO> data = noticeService.noticeList(noticeVO);
    	
    	
        // DataTables에 데이터 전달
        model.addAttribute("data", data);


        return "board/notice/list"; // list.jsp로 이동
    }
	
 // 공지사항 등록 페이지로 이동
    @GetMapping("insert")
    public String noticeInsert(@AuthenticationPrincipal MemberVO memberVO, Model model) {
       
        model.addAttribute("memCd", memberVO.getMemCd());
        model.addAttribute("memName", memberVO.getMemName());
        model.addAttribute("depCd", memberVO.getDepCd());
        model.addAttribute("depName", memberVO.getDepName());
        
        return "board/notice/insert";
    }

    // 공지사항 등록 처리
    @PostMapping("insert")
    public String noticeInsert(@AuthenticationPrincipal MemberVO memberVO,NoticeVO noticeVO, MultipartFile[] files1, Model model) throws Exception {
       
    	
    	
    	
        noticeVO.setMemName(memberVO.getMemName());
        noticeVO.setDepCd(memberVO.getDepCd());
        noticeVO.setDepName(memberVO.getDepName());
        
        
        System.out.println(noticeVO.toString());

        int result = noticeService.noticeInsert(noticeVO, files1);

        String message = "등록 실패";

        if (result > 0) {
            message = "등록 성공";
        }
        model.addAttribute("message", message);
        model.addAttribute("url", "list");
        return "commons/result";
    }
	
	@GetMapping("data/{notCd}")
	public String noticeData(@AuthenticationPrincipal MemberVO memberVO, @PathVariable int notCd, Model model) throws Exception {
	    // 버튼 유무를 위해 세션에서 해당 계정 정보를 받아온다
		model.addAttribute("member", memberVO.getDepCd());
		
		// 공지사항 조회수 증가
        noticeService.noticeHitCount(notCd);
	     
		
		// 공지사항 상세 정보를 가져옵니다.
	    NoticeVO noticeVO = noticeService.noticeData(notCd);
	  
	  
	    
	    if (noticeVO != null) {
	       

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
	
	@GetMapping("fileDown")
	public String fileDown(@RequestParam int bfCd,FileVO fileVO, Model model) throws Exception {
	    System.out.println("Controller fileDown bfCd : " + bfCd);
	 
	    // 파일 상세조회
	    fileVO = noticeService.fileDown(fileVO);
		
	    // 모델에 파일 정보를 추가
	    model.addAttribute("fileVO", fileVO);

	    // 다운로드 뷰로 이동
	    return "fileDownView";
	}
	
	
	// FileDelete
	@GetMapping("fileDelete")
	public String fileDelete(int bfCd,Model model,HttpSession session) throws Exception{
		
		int result = noticeService.fileDelete(bfCd);
		//System.out.println("이건 컨트롤"+bfCd);
		model.addAttribute("result",result);
		System.out.println("컨트롤러 리절" + result);
		
		return "commons/ajaxResult";
	}
	
	
	//update	
	@GetMapping("update/{notCd}")
	public String noticeUpdate(@PathVariable int notCd,NoticeVO noticeVO, Model model)throws Exception{
			
		noticeVO = noticeService.noticeData(notCd);
		
		 // 공지사항에 속하는 파일 리스트를 가져옵니다.
        List<NoticeFileVO> fileList =noticeService.fileData(notCd);
        noticeVO.setList(fileList);

       // log.info("=======notice {}=========", fileList);
        
		
		model.addAttribute("data",noticeVO);
			
		return "board/notice/update";
	}
	
	//update
	@PostMapping("update")
	public String noticeUpdate(NoticeVO noticeVO,MultipartFile[] files1,HttpSession session, Model model)throws Exception{
			 
		int result = noticeService.noticeUpdate(noticeVO, files1);
		
		String message = "등록 실패";

        if (result > 0) {
            message = "등록 성공";
        }
        model.addAttribute("message", message);
        model.addAttribute("url", "list");
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
	
	// 중요공지사항 글 조회
	@PostMapping("noticeImportantCount")
	@ResponseBody
	public String noticeImportantCount(@RequestParam int notImportant, Model model) throws Exception {
	    // 여기서 중요 공지사항이 3개 이상 등록되었는지 확인하는 로직을 작성
	    int importantCount = noticeService.noticeImportantCount(notImportant);

	    if (importantCount >= 3) {
	        // 중요 공지사항이 3개 이상인 경우
	        return "failure";
	    } else {
	        // 중요 공지사항 등록 가능한 경우
	        return "success";
	    }
	}
	
	// 중요여부 업데이트
	@PostMapping("noticeChangeStatus")
	@ResponseBody
	public String changeStatus(@RequestParam("notCd") int notCd, @RequestParam("notImportant") int notImportant) throws Exception {
	    NoticeVO noticeVO = new NoticeVO();
	    noticeVO.setNotCd(notCd);
	    noticeVO.setNotImportant(notImportant);

	    // 중요 공지사항 카운트
	    int importantCount = noticeService.noticeImportantCount(notImportant);

	    // notImportant = 1일 때 중요 공지사항이 3개 이상이면 업데이트 실패
	    if (notImportant == 1 && importantCount >= 3) {
	        return "failure";
	    }

	    int result = noticeService.noticeChangeStatus(noticeVO);

	    System.err.println(result);
	    if (result > 0) {
	        return "success";
	    } else {
	        // 업데이트 실패 시 처리
	        return "failure";
	    }
	}
}
	

