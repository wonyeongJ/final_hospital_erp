package com.hospital.erp.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.hospital.erp.commute.CommuteDAO;
import com.hospital.erp.member.MemberDAO;

@Component
public class Scheduler {
	
	@Autowired
	private CommuteDAO commuteDAO;
	
	@Autowired
	private MemberDAO memberDAO;
	
	// 매일 23시 59분 실행
	@Scheduled(cron = "0 59 23 * * *")
	public void Schedule() throws Exception{
		System.out.println("스케쥴 실행");
		// 퇴근 안찍은 직원 퇴근으로 입력되게끔 설정 메서드
		int commuteResult = commuteDAO.commuteUpdateScheduler();
		
		// 퇴사일 등록 이후 현재 날짜가 memQdate 날짜에 도달했을때 memDelete 값 수정 메서드
		int memberResult = memberDAO.memberUpdateMemDeleteScheduler();
	}

}
