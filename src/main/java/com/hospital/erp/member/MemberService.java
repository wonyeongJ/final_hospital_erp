package com.hospital.erp.member;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberService {

	
	 @Autowired 
	 private MemberDAO memberDAO;
	  
	public int memberLogin(MemberVO memberVO) throws Exception {
		return memberDAO.memberLogin(memberVO);
	}
	
	//직원 등록 메서드
	public int memberInsert(MemberVO memberVO) throws Exception {
		
		// 사번 생성을 위한 코드
		// 사번조회를 위한 메서드
		MemberVO maxMemberVO = memberDAO.memberDataMaxMemCd(memberVO);
		// 조회해온 사번이 NULL경우 실행 메서드
		if(maxMemberVO.getMemCd()==null) {
			
		}
		String memberVOmemCd = "";
		//현재 시간 timzone Asia/Seoul 기준으로 구하기
		LocalDate now = LocalDate.now(ZoneId.of("Asia/Seoul")); //2023-10-25 format
		//now 객체 String 타입 변환 후 뒤에 연도 두자리 잘라내기 
		String year = now.toString().substring(2, 4);   // 23
		
		
		
		return memberDAO.memberInsert(memberVO);
	}
	 
}
