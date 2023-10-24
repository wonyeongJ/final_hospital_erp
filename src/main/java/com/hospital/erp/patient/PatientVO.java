package com.hospital.erp.patient;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Getter
@Setter
@Slf4j
@ToString
public class PatientVO {

	private Integer patCd;
	private Integer codeCd;
	private String patName;
	private String patRnum;
	private String patPnum;
	private Date patRdate;
}
