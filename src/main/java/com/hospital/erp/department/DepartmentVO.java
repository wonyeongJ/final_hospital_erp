package com.hospital.erp.department;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Getter
@Setter
@ToString
public class DepartmentVO {
	
	private Integer depCd;
	private String depName;
	private String depTnum;
	private Integer depDelete;
	private Date depRdate;
	
}
