package com.hospital.erp.member;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;


import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberService implements UserDetailsService {

	
	 @Autowired 
	 private MemberDAO memberDAO;
	 
	 @Autowired
	 private PasswordEncoder passwordEncoder;
	 
	//로그인처리 하는 메서드
	 @Override
	public UserDetails loadUserByUsername(String memCd) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		 log.info("=================== 테스트 =================== {}", memCd);
		MemberVO memberVO = memberDAO.memberFindByData(memCd);
		return memberVO;
	}
	 
	
	  
	//직원 리스트 조회 메서드
	public List<MemberVO> memberList() throws Exception {
		return memberDAO.memberList();
	}
	
	//직원 조회 메서드
	public MemberVO memberData(MemberVO memberVO) throws Exception {
		return memberDAO.memberData(memberVO);
	}
	
	//직원 등록 메서드
	public int memberInsert(MemberVO memberVO) throws Exception {
		
		log.info("===========MemberVO {}", memberVO);
		// memberVO 값에서 일부분만 수정할거기때문에 바꿀 내용을 임시 객체 maxMemberVO를 통해 저장한다.
		MemberVO maxMemberVO = new MemberVO(); 
		maxMemberVO.setMemHdate(memberVO.getMemHdate());
		maxMemberVO.setJobCd(memberVO.getJobCd());
		
		// 등록 당시 연도에 입사자가 없을경우를 대비해 해당연도 XXXX-01-01 로 비교해 값을 가져온다.
		// 현재 시간 timzone Asia/Seoul 기준으로 구하기
		LocalDate now = LocalDate.now(ZoneId.of("Asia/Seoul")); //2023-10-25 format
		
		// 입사년도 기준으로 1월1일 이후의 데이터를 찾기위해 입사년도-01-01 date format 만들기
		String yearStart = maxMemberVO.getMemHdate().toString().substring(0, 5); //2023-
		yearStart = yearStart.concat("01-01"); //2023-01-01
		log.info("===========MemberVO 0101로 변환 후 {}", memberVO);
		// 형변환을 위해 java.sql.Date 타입 으로 변환
		java.sql.Date firstDate = java.sql.Date.valueOf(yearStart);
		maxMemberVO.setMemHdate(firstDate);
		log.info("===========MemberVO 조회메서드실행 전 {}", memberVO);
		// 자신의 직무코드에 맞는 사번중 가장 높은 사번 조회 메서드
		maxMemberVO = memberDAO.memberDataMaxMemCd(maxMemberVO);
		log.info("===========MemberVO 조회메서드실행 후 {}", memberVO);
		log.info("===========MaxMemberVO 조회메서드실행 후 {}", maxMemberVO);
		// 위의 메서드를 통해 조회해온 사번이 NULL일 경우 실행 메서드
		if(maxMemberVO==null) {
			
			String startMemCd = "001";
			String jobCode = "";
			//now 객체 String 타입 변환 후 뒤에 연도 두자리 잘라내기 
			String year = memberVO.getMemHdate().toString().substring(2, 4);   // 23
			
			// 직무코드 3 0 -> 03, 4 -> 04 로만들기
			if(memberVO.getJobCd() < 10) {
				String addZero = "0";
				jobCode = addZero.concat(memberVO.getJobCd().toString());
			}
			// 사번 연도2자리+직무코드+순서 결합 
			startMemCd = year.concat(jobCode.concat(startMemCd));
			//memberVO에 사번 대입
			memberVO.setMemCd(startMemCd);
			log.info("===============MemberVO {} =========", memberVO);
			
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
		memberVO.setMemPw(passwordEncoder.encode(juminAr[0]));
	
		return memberDAO.memberInsert(memberVO);
	}
	
	// passwordUpdate
	public int memberUpdatePassword(PasswordVO passwordVO) throws Exception{
		// 시큐리티에서 유저정보 꺼내기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal;
		MemberVO memberVO = (MemberVO)userDetails;
		
		memberVO.setMemPw(passwordEncoder.encode(memberVO.getMemPw()));
		return memberDAO.memberUpdatePassword(memberVO);
	}
	 
}
