package com.hospital.erp.department;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * From 서동휘
 * 부서 Controller
 */
@Controller
@RequestMapping("/department/*")
public class departmentController {
	
	//부서 관리 목록 호출 메서드
	@GetMapping("list")
	public String departmentList() throws Exception {
		return "department/list";
	}
	
	//부서등록 폼 요청 메서드
	@GetMapping("insert")
	public String departmentInsert() throws Exception {
		return "department/insert";
	}
	
	//부서등록 요청 메서드
	@PostMapping("insert")
	public String departmentInsert(DepartmentVO departmentVO) throws Exception {
		return "department/insert";
	}
	
	//부서 업데이트 메서드
	@PostMapping("update")
	public String departmentUpdate(DepartmentVO departmentVO) throws Exception {
		return "department/update";
	}
	
	
}
