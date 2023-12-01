package com.hospital.erp.patient;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Getter
@Setter
@ToString
public class PatientVO {

	private Integer patCd;
	private Integer codeCd;
	private String patName;
	private String patRnum;
	private String patPnum;
	private Date patRdate;
	
	private Date resVdate; //Reservation 테이블 Join
	private String codeName; //Code 테이블 Join
}
