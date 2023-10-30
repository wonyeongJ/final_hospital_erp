package com.hospital.erp.util;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class TimeSetter {

	// 시간 출력 패턴 변경 ( pattern example: "yyyy년 MM월 dd일 hh시 mm분 ss초" )
	public String localDateTimeToString(LocalDateTime localDateTime, String pattern) {
		String result = localDateTime.format(DateTimeFormatter.ofPattern(pattern));
		return result;
	}
	
	// Date를 LocalDateTime 형태로 변환 
	public LocalDateTime DateTolocalDateTime(Date date) {
		LocalDateTime result = Instant.ofEpochMilli(date.getTime())
				                .atZone(ZoneId.systemDefault())
				                .toLocalDateTime();
		return result;
	}
	
	// LocalDateTime를 Date 형태로 변환
	public Date LocalDateTimetoDate(LocalDateTime localDateTime) {
		return Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant());
	}
	
}
