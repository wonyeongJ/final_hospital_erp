package com.hospital.erp.payment.confirm;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Getter
@Setter
@ToString
@Slf4j
public class ConfirmVO {
	private Integer conCd;
	private Integer epCd;
	private String memCd;
	private String memName;
	private Integer conStep;
	private Date conRDate;
	private String conPStatus;
	private String conComment;
}
