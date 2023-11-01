package com.hospital.erp.board.complaints;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.hospital.erp.board.notice.NoticeFileVO;
import com.hospital.erp.file.FileVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ComplaintsVO extends FileVO{

	// 민원게시판의 PK
	private int compCd;
	
	// MEMBER 테이블의 PK
	private String memCd;
	
	// 민원종류
	private int codeCd;
	
	// 조치여부
	private int codeCdAction;
	
	// 제목
	private String compTitle;
	
	// 내용
	private String compContents;
	
	// 비밀글 공개글 여부
	private int compSecret;
	
	// 삭제여부
	private int compDelete;	
	
	// 작성날짜 
	private Date compRdate;
	
	// 민원게시판 파일 리스트
	private List<ComplaintsFileVO> list = new ArrayList<>();
	
	private String codeTypeName; // 코드테이블의 CODE_NAME을 저장하는 필드
    private String actionTypeName; // 코드테이블의 CODE_NAME을 저장하는 필드

	
}
