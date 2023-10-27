package com.hospital.erp.equipment;

import java.time.LocalDateTime;
import java.util.List;

import com.hospital.erp.common.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EquipmentVO{
	
	private int equCd;
	private int codeCd;
	private String codeName;
	private String equSnum;
	private String equDelete;
	private LocalDateTime equPdate;
	private LocalDateTime equRdate;
	
	private EquipmentHistoryVO equipmentHistoryVO;
}
