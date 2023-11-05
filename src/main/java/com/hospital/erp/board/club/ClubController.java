package com.hospital.erp.board.club;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
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

import com.hospital.erp.board.complaints.ComplaintsFileVO;
import com.hospital.erp.board.complaints.ComplaintsVO;
import com.hospital.erp.board.notice.NoticeService;
import com.hospital.erp.board.notice.NoticeVO;
import com.hospital.erp.file.FileVO;
import com.hospital.erp.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("board/club/*")
@Slf4j
public class ClubController {
	
	
	@Autowired
    private ClubService clubService;
	
	@ModelAttribute("board")
	public String getBoard() {
		return "club";
	}
	
	@GetMapping("list")
    public String clubList (@AuthenticationPrincipal MemberVO memberVO,ClubVO clubVO, Model model) throws Exception {
    	
    	
    	model.addAttribute("member", memberVO.getDepCd());
    	
    	
    
    	List<ClubVO> data = clubService.clubList(clubVO);
    	
    	
        // DataTables에 데이터 전달
        model.addAttribute("data", data);


        return "board/club/list"; // list.jsp로 이동
    }
	
	// 사내동호회 등록
	@GetMapping("insert")
	public String clubInsert(@AuthenticationPrincipal MemberVO memberVO, Model model) {
		
		model.addAttribute("memCd", memberVO.getMemCd());
		model.addAttribute("memName", memberVO.getMemName());
		model.addAttribute("depCd", memberVO.getDepCd());
		model.addAttribute("depName", memberVO.getDepName());
		
		
		return "board/club/insert";
	}
	
	
	@PostMapping("insert")
	public String clubInsert(@AuthenticationPrincipal MemberVO memberVO,ClubVO clubVO, MultipartFile[] files, Model model) throws Exception {
		
		clubVO.setMemName(memberVO.getMemName());
		clubVO.setDepCd(memberVO.getDepCd());
		clubVO.setDepName(memberVO.getDepName());
		
		int result = clubService.clubInsert(clubVO, files);
        if (result > 0) {
            model.addAttribute("message", "사내동호회 등록이 완료되었습니다.");
            model.addAttribute("url", "list");
        } else {
            model.addAttribute("message", "사내동호회 등록에 실패했습니다.");
            model.addAttribute("url", "insert");
        }

		return "commons/result";
	}
	
	
	@PostMapping("clubMemberInsert/{clubCd}")
	public ResponseEntity<String> clubMemberInsert(@AuthenticationPrincipal MemberVO memberVO, @PathVariable int clubCd, ClubMemberVO clubMemberVO) throws Exception {

	    clubMemberVO.setMemName(memberVO.getMemName());
	    clubMemberVO.setClubCd(clubCd);
	    clubMemberVO.setMemCd(memberVO.getMemCd());
	    clubMemberVO.setDepCd(memberVO.getDepCd());
	    clubMemberVO.setDepName(memberVO.getDepName());

	    int result = clubService.clubMemberInsert(clubMemberVO);

	    if (result > 0) {
	        return new ResponseEntity<>("success", HttpStatus.OK);
	    } else {
	        return new ResponseEntity<>("failure", HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}
	// 사내동호회 상세
	@GetMapping("data/{clubCd}")
    public String clubData(@AuthenticationPrincipal MemberVO memberVO,@PathVariable int clubCd, Model model) throws Exception {
    	model.addAttribute("memCd",memberVO.getMemCd());
    	model.addAttribute("memName",memberVO.getMemName());
        model.addAttribute("depCd",memberVO.getDepCd());
        model.addAttribute("depName", memberVO.getDepName());
    	
    	// 사내동호회 상세 정보를 가져옵니다.
        ClubVO clubVO = clubService.clubData(clubCd);
       
        // 사내동호회 멤버의 리스트를 가져옵니다.
        List<ClubMemberVO> memberList = clubService.clubMemberList(clubCd);
        clubVO.setMemberList(memberList);
        
        // 가입 여부 확인
        boolean userIsParticipant = clubService.clubMemberCk(clubCd, memberVO.getMemCd());

        // 가입 여부를 모델에 추가
        model.addAttribute("userIsParticipant", userIsParticipant);
       
        
        // 공지사항 조회수 증가
        clubService.clubHitCount(clubCd);

        // 사내동호회에 속하는 파일 리스트를 가져옵니다.
		List<ClubFileVO> fileList = clubService.fileData(clubCd);
		clubVO.setList(fileList);

		// 로그로 데이터 확인 (옵션)
		log.info("List 데이터: {}", clubVO.getList());

		// Model에 공지사항 정보를 담아서 View로 전달합니다.
		model.addAttribute("data", clubVO);

		return "board/club/data";
    }
	
	@GetMapping("update/{clubCd}")
	public String clubUpdate(@PathVariable int clubCd,Model model) throws Exception {
		
		 ClubVO clubVO = clubService.clubData(clubCd);
	     
		 // 사내동호회의 속하는 파일리스트를 가져온다
	     List<ClubFileVO> fileList = clubService.fileData(clubCd);
	     clubVO.setList(fileList);
	     
	     model.addAttribute("data",clubVO);
		
		return "board/club/update";

	}
	
	@PostMapping("update")
	public String clubUpdata(ClubVO clubVO,MultipartFile[] files,HttpSession session,Model model)throws Exception{
		
		 int result = clubService.clubUpdate(clubVO, files);

	        String message = "등록 실패";

	        if (result > 0) {
	            message = "등록 성공";
	        }
	        model.addAttribute("message", message);
	        model.addAttribute("url", "list");
	        return "commons/result";
	}
	
	
	/// Delete
	@RequestMapping(value = "delete/{clubCd}", method = RequestMethod.POST)
	@ResponseBody
	public String clubDelete(@PathVariable int clubCd) throws Exception {
	    int result = clubService.clubDelete(clubCd);
	    if (result > 0) {
	        return "success";
	    } else {
	        return "failure";
	    }
	}
	
	@PostMapping("clubMemberDrop")
	public String clubMemberDrop(@RequestParam("clubCd") int clubCd, @AuthenticationPrincipal MemberVO memberVO) throws Exception {
	    String memCd = memberVO.getMemCd();
	    
	    ClubMemberVO clubMemberVO = new ClubMemberVO();
	    clubMemberVO.setClubCd(clubCd);
	    clubMemberVO.setMemCd(memCd);
	    
	    int result = clubService.clubMemberDrop(clubMemberVO);
	    
	    if (result > 0) {
	        // 탈퇴 성공
	        // 여기에서 원하는 작업 수행, 예: 메시지 표시 또는 페이지 리다이렉션
	        return "redirect:/board/club/data/" + clubCd; // 탈퇴 후 클럽 상세 페이지로 리다이렉션
	    } else {
	        // 탈퇴 실패
	        // 여기에서 원하는 작업 수행, 예: 에러 메시지 표시 또는 페이지 리다이렉션
	        return "redirect:/board/club/data/" + clubCd; // 실패 시 해당 클럽 상세 페이지로 리다이렉션
	    }
	}
	
	@GetMapping("fileDown")
	public String fileDown(@RequestParam int bfCd,FileVO fileVO, Model model) throws Exception {
	    System.out.println("Controller fileDown bfCd : " + bfCd);
	 
	    // 파일 상세조회
	    fileVO = clubService.fileDown(fileVO);
		
	    // 모델에 파일 정보를 추가
	    model.addAttribute("fileVO", fileVO);

	    // 다운로드 뷰로 이동
	    return "fileDownView";
	}
	
	
	// FileDelete
	@GetMapping("fileDelete")
	public String fileDelete(int bfCd,Model model,HttpSession session) throws Exception{
		
		int result = clubService.fileDelete(bfCd);
		//System.out.println("이건 컨트롤"+bfCd);
		model.addAttribute("result",result);
		//System.out.println("컨트롤러 리절" + result);
		
		return "commons/ajaxResult";
	}

			
}
