package com.hospital.erp.department;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

/*
 * From 서동휘
 * 부서 Controller
 */
@Controller
@RequestMapping("/department/*")
@Slf4j
public class DepartmentController {
	
	@Autowired
	private DepartmentService departmentService;
	
	//부서 관리 목록 호출 메서드
	@GetMapping("list")
	public String departmentList(Model model) throws Exception {
		//DepartmentList 메서드를 이용해 DB 에서 department데이터들 List 타입의 departmentList 변수에 저장
		List<DepartmentVO> departmentAr = departmentService.departmentList();
		model.addAttribute("departmentList", departmentAr);
		log.info("==============departmentAr={} ===========", departmentAr);
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
		int result = departmentService.departmentInsert(departmentVO);
		return "redirect:./list";
	}
	
	//부서 업데이트 메서드
	@PostMapping("update")
	public String departmentUpdate(DepartmentVO departmentVO) throws Exception {
		log.info("=============dpeartment update 실행 =================");
		int result = departmentService.departmentUpdate(departmentVO);
		return "redirect:./";
	}
	
	//조직도 호출 메서드
	@GetMapping("chart")
	public String departmentListChart() throws Exception {
		return "department/chart";
	}
	
	
}
