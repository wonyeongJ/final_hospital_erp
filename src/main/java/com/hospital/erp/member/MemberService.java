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
		
		// memberVO 값에서 일부분만 수정할거기때문에 바꿀 내용을 임시 객체 maxMemberVO를 통해 저장한다.
		MemberVO maxMemberVO = memberVO;
		
		// 등록 당시 연도에 입사자가 없을경우를 대비해 해당연도 XXXX-01-01 로 비교해 값을 가져온다.
		// 현재 시간 timzone Asia/Seoul 기준으로 구하기
		LocalDate now = LocalDate.now(ZoneId.of("Asia/Seoul")); //2023-10-25 format
		String yearStart = now.toString().substring(0, 5); //2023-
		yearStart = yearStart.concat("01-01"); //2023-01-01
		
		// 형변환을 위해 java.sql.Date 타입 으로 변환
		java.sql.Date firstDate = java.sql.Date.valueOf(yearStart);
		maxMemberVO.setMemRdate(firstDate);
		
		// 자신의 직무코드에 맞는 사번중 가장 높은 사번 조회 메서드
		maxMemberVO = memberDAO.memberDataMaxMemCd(maxMemberVO);
		
		// 위의 메서드를 통해 조회해온 사번이 NULL일 경우 실행 메서드
		if(maxMemberVO==null) {
			
			String startMemCd = "001";
			String jobCode = "";
			//now 객체 String 타입 변환 후 뒤에 연도 두자리 잘라내기 
			String year = now.toString().substring(2, 4);   // 23
			
			// 직무코드 3 0 -> 03, 4 -> 04 로만들기
			if(memberVO.getJobCd() < 10) {
				String addZero = "0";
				jobCode = addZero.concat(memberVO.getJobCd().toString());
			}
			// 사번 연도2자리+직무코드+순서 결합 
			startMemCd = year.concat(jobCode.concat(startMemCd));
			//memberVO에 사번 대입
			memberVO.setMemCd(startMemCd);
			
		}else { // 조회해온 사번이 NULL 이 아닐 경우 실행
			// 사번중 가장 마지막 자리 3자리 202303001 일 경우 001 가져오기 00년도의 입사의경우 데이터가 달라질수있기때문에 뒤에 3자리만조회
			String endThreeValue = maxMemberVO.getMemCd().substring(4);
			log.info("===========endT {}===========", endThreeValue);
			String startFourValue = maxMemberVO.getMemCd().substring(0,4);
			int memThreeValue = Integer.parseInt(endThreeValue);
			memThreeValue++;
			log.info("===========memThreeValue {}===========", memThreeValue);
			//10 이하일때 00 100이하일때 00 붙이기
			if(memThreeValue < 10) {
				String addZero = "00";
				endThreeValue = addZero.concat(Integer.toString(memThreeValue));
				log.info("===========startFourValue {}===========", endThreeValue);
				startFourValue = startFourValue.concat(endThreeValue);
				log.info("===========startFourValue {}===========", startFourValue);
			}else if(memThreeValue < 100) {
				String addZero = "0";
				endThreeValue = endThreeValue.concat(addZero.concat(Integer.toString(memThreeValue)));
				startFourValue.concat(endThreeValue);
				log.info("===========startFourValue {}===========", startFourValue);
			}
			memberVO.setMemCd(startFourValue);
		}
		
		//비밀번호 생성 "-" 으로 앞 6자리 분리
		String [] juminAr = memberVO.getMemRnum().split("-");
		memberVO.setMemPw(juminAr[0]);
	
		return memberDAO.memberInsert(memberVO);
	}
	 
}
