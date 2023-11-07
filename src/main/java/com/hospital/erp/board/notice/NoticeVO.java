package com.hospital.erp.board.notice;

import java.sql.Date;
import java.util.List;
import java.util.ArrayList;


import com.hospital.erp.file.FileVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeVO extends FileVO{
	
	// 공지사항 PK
	private int notCd;
	
	// 공지사항 제목
	private String notTitle;
	
	// 공지사항 내용
	private String notContents;
	
	// 공지사항 조회수
	private Long notHit;
	
	// 공지사항 중요여부
	private int notImportant;
	
	// 공지사항 생성날짜
	private Date notRdate;

	// 멤버 테이블PK를 참조(FK)
	private String memCd;
	
	// 공지사항 파일 리스트
	private List<NoticeFileVO> list = new ArrayList<>();

	// 멤버의 이름 (MEM_NAME 필드 추가)
    private String memName;
    
    // 부서 코드 (DEP_CD 필드 추가)
    private int depCd;
    
    private String depName;
	
	
	
}
