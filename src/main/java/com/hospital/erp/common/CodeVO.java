package com.hospital.erp.common;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CodeVO {
	
	private int codeCd;
	private String codeName;
	private int codeGid;
	private String codeGname;
	private int codeUse;
	private LocalDateTime codeUdate;
	private LocalDateTime codeRdate;

}
