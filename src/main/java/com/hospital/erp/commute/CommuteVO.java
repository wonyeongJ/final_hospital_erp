package com.hospital.erp.commute;

import java.security.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommuteVO {

	private Long comCd;
	private String memCd;
	private Timestamp comSdate;
	private Timestamp comEdate;
}
