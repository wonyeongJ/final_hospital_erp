package com.hospital.erp.board.club;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ClubMemberVO {
	
	// 모임의 PK
	private int cmCd;
	
	// 멤버테이블의 PK
	private String memCd;
	
	// 사내동호회 테이블의 PK
	private int clubCd;
	
	// 모임 생성날짜
	private Date cmRdate;
	
	

}
