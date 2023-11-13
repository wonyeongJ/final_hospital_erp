package com.hospital.erp.drug;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DrugVO{
	
	private String usage;
	private String name;
	private String use;
	private String provide;
	private LocalDateTime rDate;

}
