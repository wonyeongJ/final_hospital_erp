package com.hospital.erp.board;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommentVO {

	// 댓글의 PK
	private int commCd;
	
	// 사내동호회 PK
    private int clubCd;
    
    // 댓글작성자의 멤버테이블 PK
    private String memCd;
    
    // 댓글 내용
    private String commContents;
    
    // 댓글 작성 날짜
    private Date commRdate;
    
    // 멤버의 이름 (MEM_NAME 필드 추가)
    private String memName;
    
    // 부서 코드 (DEP_CD 필드 추가)
    private int depCd;
    
    private String depName;
    
  
}
