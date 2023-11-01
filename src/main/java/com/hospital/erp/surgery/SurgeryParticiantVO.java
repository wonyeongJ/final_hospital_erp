package com.hospital.erp.surgery;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SurgeryParticiantVO {
	
	private int spCd;
	private int surCd;
	private String memCd;
	private LocalDateTime spRdate;
	
	private String memName;
	private String depName;
}
