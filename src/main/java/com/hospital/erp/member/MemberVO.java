package com.hospital.erp.member;

import java.sql.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {
	
	private String memCd;
	private Integer jobCd;
	private Integer depCd;
	private Integer posCd;
	private Integer codeCd;
	private String memName;
	private String memRnum;
	private String memPw;
	private String memPnum;
	private String memAddress;
	private String memEmail;
	private Date memHdate;
	private Integer memSalary;
	private Integer memAnnual;
	private Date memQdate;
	private Integer memDelete;
	private Date memRdate;
		
}
