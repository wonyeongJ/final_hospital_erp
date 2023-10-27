package com.hospital.erp.util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class TimeSetter {

	// 시간 출력 패턴 변경 ( pattern example: "yyyy년 MM월 dd일 hh시 mm분 ss초" )
	public String localDateTimeToString(LocalDateTime localDateTime, String pattern) {
		String result = localDateTime.format(DateTimeFormatter.ofPattern(pattern));
		return result;
	}
	
}
