package com.hospital.erp.patient;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * From 서동휘
 * 환자 관리 controller
 */
@Controller
@RequestMapping("/patient/*")
public class PatientController {
	
	// 환자 목록 호출 메서드
	@GetMapping("list")
	public String patientList() throws Exception {
		return "patient/list";
	}
	
	// 환자 등록 폼 호출 메서드
	@GetMapping("insert")
	public String patientInsert() throws Exception {
		return "patient/insert";
	}
	
	//환자 등록 메서드
	@PostMapping("insert")
	public String patientInsert(PatientVO patientVO) throws Exception {
		return "patinet/isnert";
	}
	
	//환자 상세 및 예약 정보 페이지 호출 메서드
	@GetMapping("data")
	public String patientData(PatientVO patientVO) throws Exception {
		return "patient/data";
	}
	
	//환자 정보 수정 폼 요청 메서드
	@GetMapping("update")
	public String patientUpdate(PatientVO patientVO) throws Exception {
		return "patient/update";
	}
	
	
}
