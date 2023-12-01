package com.hospital.erp.member;

import java.security.Timestamp;
import java.sql.Time;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberFileVO {

	private Integer mfCd;
	private Integer codeCd;
	private String memCd;
	private String mfOname;
	private String mfFname;
	private String mfPath;
	private String mfExtention;
	private Timestamp mfRdate;
	
}
