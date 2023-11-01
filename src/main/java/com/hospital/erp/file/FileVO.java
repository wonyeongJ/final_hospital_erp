package com.hospital.erp.file;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
public class FileVO {
	
	// 파일테이블의 PK
	private int bfCd;
	
	// 게시판 항목을 구분하기위한 공통테이블의 FK
	private int codeCd;
	
	// 공지사항, 민원게시판, 사내동호회게시판의 PK
	private int bfFk;
	
	// 파일의 OriginalName
	private String bfOname;
	
	// 파일의 현재이름
	private String bfFname;
	
	// 파일의 경로
	private String bfPath;
	
	// 파일의 확장자
	private String bfExtension;
	
	// 파일의 등록날짜
	private Date bfRdata;
}
