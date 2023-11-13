package com.hospital.erp.commute;


import java.sql.Date;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommuteVO {

	private Long comCd;
	private String memCd;
	private Timestamp comSdate;
	private Timestamp comEdate;
	private int comWork;
}
