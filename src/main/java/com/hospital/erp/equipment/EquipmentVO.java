package com.hospital.erp.equipment;

import java.sql.Date;
import java.time.LocalDateTime;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EquipmentVO {
	
	private int equCd;
	private int codeCd;
	private String equSnum;
	private String equDelete;
	private LocalDateTime equPdate;
	private LocalDateTime equRdate;
		
}
