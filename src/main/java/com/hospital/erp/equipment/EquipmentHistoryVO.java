package com.hospital.erp.equipment;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EquipmentHistoryVO {
	
	private int ehCd;
	private int memCd;
	private int equCd;
	private LocalDateTime ehSdate;
	private LocalDateTime ehRedate;
	private int ehReturn;
	private LocalDateTime ehRdate;
	
	private String memName;
}
