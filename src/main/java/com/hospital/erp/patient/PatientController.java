package com.hospital.erp.patient;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hospital.erp.reservation.ReservationService;
import com.hospital.erp.reservation.ReservationVO;

import lombok.extern.slf4j.Slf4j;

/*
 * From 서동휘
 * 환자 관리 controller
 */
@Slf4j
@Controller
@RequestMapping("/patient/*")
public class PatientController {
	
	@Autowired
	private PatientService patientService;
	
	@Autowired
	private ReservationService reservationService;
	
	// 환자 목록 호출 메서드
	@GetMapping("list")
	public String patientList(Model model) throws Exception {
		List<PatientVO> patientAr = patientService.patientList();
		model.addAttribute("patientAr", patientAr);
		return "patient/list";
	}
	
	//환자 상세 및 예약 정보 페이지 호출 메서드
	@GetMapping("data")
	public String patientData(PatientVO patientVO,Model model) throws Exception {
		patientVO = patientService.patientData(patientVO);
		model.addAttribute("patientVO", patientVO);
		List<ReservationVO> reservationAr = reservationService.reservationListPatient(patientVO);
		model.addAttribute("reservationAr", reservationAr);
		// System.out.println(reservationAr);
		return "patient/data";
	}
	
	// 환자수정 폼 호출 메서드
	@GetMapping("update")
	public String patientUpdate(PatientVO patientVO, Model model) throws Exception {
		patientVO = patientService.patientData(patientVO);
		model.addAttribute("patientVO", patientVO);
		return "patient/update";
	}
	
	// 환자 수정 메서드
	@PostMapping("update")
	public String patientUpdate(PatientVO patientVO) throws Exception {
		int result = patientService.patientUpdate(patientVO);
		return "redirect:./list";
	}
	
	// 환자 등록 폼 호출 메서드
	@GetMapping("insert")
	public String patientInsert() throws Exception {
		return "patient/insert";
	}
	
	//환자 등록 메서드
	@PostMapping("insert")
	public String patientInsert(PatientVO patientVO) throws Exception {
		int result = patientService.patinetInsert(patientVO);
		return "redirect:./list";
	}	
	
}
