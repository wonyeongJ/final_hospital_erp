package com.hospital.erp.board.club;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.hospital.erp.file.FileVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ClubVO extends FileVO{

	// 사내동호회 PK
	private int clubCd;
	
	// 멤버테이블의 PK
	private String memCd;
	
	// 사내동호회 제목
	private String clubTitle;
	
	// 사내동호회 내용
	private String clubContents;
	
	// 사내동호회 모집인원
	private int clubPersonnel;
	
	// 사내동호회 모집상태
	private int clubStatus;
	
	// 사내동호회 조회수
	private int clubHit;
	
	// 사내동호회 작성날짜
	private Date clubRdate;
	
	// 사내동호회 파일 리스트
	List<ClubFileVO> list = new ArrayList<>();
	
	// 사내동호회 멤버 리스트
	List<ClubMemberVO> memberList = new ArrayList<>();
	
	// 멤버의 이름 (MEM_NAME 필드 추가)
    private String memName;
    
    // 부서 코드 (DEP_CD 필드 추가)
    private int depCd;
    
    // 부서 이름
    private String depName;
    
    // 현재인원
    private int currentMembers;
    
}
