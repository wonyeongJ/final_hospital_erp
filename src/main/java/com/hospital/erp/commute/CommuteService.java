package com.hospital.erp.commute;

import java.sql.Timestamp;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Service;

import com.hospital.erp.member.MemberVO;
import com.hospital.erp.util.TimeSetter;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CommuteService {
	
	@Autowired
	private CommuteDAO commuteDAO;
	
	@Autowired
	private TimeSetter timeSetter;
	
	// 출근버튼 클릭시 동작
	public int commuteInsert(CommuteVO commuteVO) throws Exception {
		int result = commuteDAO.commuteInsert(commuteVO);
		return result;
	}
	
	// mypage 에서 출근, 퇴근, 버튼숨기기 위한 값 조회
	public CommuteVO commuteData(MemberVO memberVO) throws Exception {
		CommuteVO commuteVO = new CommuteVO();
		commuteVO.setMemCd(memberVO.getMemCd());
		// 현재날짜 구하기
		// LocalDate 객체 생성
        LocalDate localDate = LocalDate.now();
        commuteVO.setComSdate(Timestamp.valueOf(localDate.atStartOfDay())); 
		
		return commuteVO = commuteDAO.commuteData(commuteVO);
	}
	
	//퇴근 버튼 누르면 동작
	public int commuteUpdate(CommuteVO commuteVO) throws Exception {
		return commuteDAO.commuteUpdate(commuteVO);
	}
}
