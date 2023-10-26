package com.hospital.erp;

import java.time.LocalDate;
import java.time.ZoneId;

import org.junit.jupiter.api.Test;

public class MemberServiceTest {

	@Test
	public void test() {
		
		String memberVOmemCd = "";
		//현재 시간 timzone Asia/Seoul 기준으로 구하기
		LocalDate now = LocalDate.now(ZoneId.of("Asia/Seoul"));
		System.out.println(now);
		//now 객체 String 타입 변환 후 뒤에 연도 두자리 잘라내기
		String year = now.toString().substring(2, 4);
		System.out.println(year);
		Integer doctorCode = 3;
		//직무코드 2자리가 10보다 이하일경우 앞에 0붙이는 메서드
		if(10>doctorCode) {
			String addZero = "0";
			memberVOmemCd = addZero.concat(doctorCode.toString());
		}
		System.out.println(memberVOmemCd);
		
	}
}
