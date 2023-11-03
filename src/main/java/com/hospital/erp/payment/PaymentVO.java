package com.hospital.erp.payment;

import java.sql.Date;
import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Getter
@Setter
@ToString
@Slf4j
public class PaymentVO {
	
	private Integer codeCd;
	private String memCd;
	private Integer dfCd;
	private String epTitle;
	private String epVType;
	private String epOType;
	private Date epSDate;
	private Date epEDate;
	private Integer epPrice;
	private String epLocation;
	private String epInput1;
	private String epInput2;
	private String epInput3;
	private String epReason;
	private String epDStatus;
	private LocalDateTime epFDate;
	private LocalDateTime epRDate;
	

}
