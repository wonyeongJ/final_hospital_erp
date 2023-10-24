package com.hospital.erp.board.club;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board/club/*")
public class ClubController {
	
	@GetMapping("list")
	public String clubList(Model model)throws Exception{
	return "board/club/list";
	}
	
	@GetMapping("insert")
	public String clubInsert(){
		return "board/club/insert";
	}
	
	@GetMapping("data")
	public String clubData() {
		return "board/complaints/data";

	}
	@GetMapping("update")
	public String clubUpdate() {
		return "board/club/update";

	}
	
}
