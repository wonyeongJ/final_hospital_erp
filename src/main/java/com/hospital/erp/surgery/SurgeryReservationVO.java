package com.hospital.erp.surgery;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SurgeryReservationVO {
	
	private String paramDate; 
	private int sTime; 
	private int eTime; 
	private int surCd;
	private int schCd;
}
