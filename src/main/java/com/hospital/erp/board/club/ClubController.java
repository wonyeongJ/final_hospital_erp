package com.hospital.erp.board.club;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.hospital.erp.board.notice.NoticeService;
import com.hospital.erp.board.notice.NoticeVO;
import com.hospital.erp.member.MemberVO;

@Controller
@RequestMapping("board/club/*")
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
	
	@GetMapping("data")
	public String clubData() {
		return "board/club/data";

	}
	@GetMapping("update")
	public String clubUpdate() {
		return "board/club/update";

	}
	
}
