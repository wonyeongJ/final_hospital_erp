package com.hospital.erp.board.complaints;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hospital.erp.board.notice.NoticeController;
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
	
	@GetMapping("insert")
	public String complainstInsert(){
		return "board/complaints/insert";
	}
	
	@GetMapping("data")
	public String complainstData() {
		return "board/complaints/data";

	}
	@GetMapping("update")
	public String complainstUpdate() {
		return "board/complaints/update";

	}
}
