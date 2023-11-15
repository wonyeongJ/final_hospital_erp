package com.hospital.erp.payment.confirm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hospital.erp.department.DepartmentService;
import com.hospital.erp.department.DepartmentVO;
import com.hospital.erp.member.MemberService;
import com.hospital.erp.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/payment/confirm/*")
public class ConfirmController {

	@Autowired
	private ConfirmService confirmService;
	
	@Autowired
	private DepartmentService departmentService;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("insertForm")
	public String ConfirmInsert(Model model)throws Exception{
		
		List<DepartmentVO> departmentAr = departmentService.departmentList();
		model.addAttribute("departmentList", departmentAr);
		log.info("==============departmentAr={} ===========", departmentAr);
		
		List<MemberVO> memberAr = memberService.memberListChart();
		model.addAttribute("memberList", memberAr);
		
		return "ajax.payment/confirm";
	}
	
	/*
	 * @PostMapping("insert") public String ConfirmInsert()throws Exception{
	 * 
	 * return ""; }
	 */
}
