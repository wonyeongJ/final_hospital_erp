package com.hospital.erp.board.club;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.hospital.erp.board.complaints.ComplaintsFileVO;
import com.hospital.erp.board.complaints.ComplaintsVO;
import com.hospital.erp.board.notice.NoticeService;
import com.hospital.erp.board.notice.NoticeVO;
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
	
	
}
