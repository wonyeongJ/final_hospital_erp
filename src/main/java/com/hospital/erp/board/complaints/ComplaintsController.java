package com.hospital.erp.board.complaints;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board/complaints/*")
public class ComplaintsController {
	
	@GetMapping("list")
	public String complaintsList(Model model)throws Exception{
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
