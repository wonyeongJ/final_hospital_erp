package com.hospital.erp.payment.reference;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReferenceVO {

	private Integer refCd;
	private Integer epCd;
	private String memCd;
	private String memName;
	private LocalDateTime refRDate;
}
