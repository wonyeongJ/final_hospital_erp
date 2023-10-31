package com.hospital.erp.surgery;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SurgeryVO {
	
	private int surCd;
	private int surNum;
	private int surUse;
	private LocalDateTime surRdate;
}
