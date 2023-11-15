package com.hospital.erp.board.club;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ClubMemberVO {
	
	// 모임의 PK
	private int cmCd;
	
	// 멤버테이블의 PK
	private String memCd;
	
	// 사내동호회 테이블의 PK
	private int clubCd;
	
	// 모임 생성날짜
	private Date cmRdate;
	
	// 모임의 가입한 사람의 이름
	private String memName;
	
	// 모입의 가입한 사람의 부서코드
	private int depCd;
	
	// 모임의 가입한 사람의 부서이름
	private String depName;
	
	

}
