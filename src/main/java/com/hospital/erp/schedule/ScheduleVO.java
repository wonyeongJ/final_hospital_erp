package com.hospital.erp.schedule;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScheduleVO {
	
	private int schCd;
	private String memCd;
	private int codeCd;
	private int schFk;
	private LocalDateTime schSdate;
	private LocalDateTime schEdate;
	private String schDesc;
	private LocalDateTime schRdate;
	
	private String memName;
	
	private int startNum;
	private int endNum;
	
	private String startNumString;
	private String endNumString;
	private String dateString;
	
	private int surNum;
}
