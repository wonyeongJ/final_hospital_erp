package com.hospital.erp.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * From 서동휘
 * 진료 예약 controller
 */
@Controller
@RequestMapping("/reservation/*")
public class ReservationController {
	
	//진료 예약 추가 폼 요청 메서드
	@GetMapping("insert")
	public String reservationInsert() throws Exception {
		return "reservation/insert";
	}
	
	//진료 예약 추가 요청 메서드
	@PostMapping("insert")
	public String reservationInsert(ReservationVO reservationVO) throws Exception {
		return "reservation/insert";
	}
	
}
