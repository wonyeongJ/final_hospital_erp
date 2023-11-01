package com.hospital.erp.surgery;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SurgeryScheduleVO {
	
	private int ssCd;
	private int surCd;
	private LocalDateTime ssRdate;
}
