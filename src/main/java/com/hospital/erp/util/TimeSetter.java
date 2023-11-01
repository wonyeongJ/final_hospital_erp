package com.hospital.erp.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
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
	public LocalDateTime dateTolocalDateTime(Date date) {
		LocalDateTime result = Instant.ofEpochMilli(date.getTime())
				                .atZone(ZoneId.systemDefault())
				                .toLocalDateTime();
		return result;
	}
	
	// LocalDateTime를 Date 형태로 변환
	public Date localDateTimetoDate(LocalDateTime localDateTime) {
		return Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant());
	}
	
	// 현재 시간을 가지는 LocalDateTime 객체 생성
	public LocalDateTime currentLocalDateTime() {
		return LocalDateTime.now();
	}
	
	// 현재 시간을 날짜만 가져오기(DateTime 객체)
	public LocalDate currentLocalDate() {
		LocalDate date = LocalDate.now();
		return date;
	}
	
	// String을 localDateTime으로 변형 (patter 예시 : "yyyy-MM-dd HH:mm:ss.SSS")
	public LocalDateTime stringToLocalDateTime(String str, String pattern) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
		LocalDateTime localDateTime = LocalDateTime.parse(str, formatter);
		return localDateTime;
	}
	
	// Date를 LocalDate 형태로 변환
	public LocalDate dateToLocalDate(Date date) {
        LocalDate localDate = date.toInstant()   // Date -> Instant
                .atZone(ZoneId.systemDefault())  // Instant -> ZonedDateTime
                .toLocalDate(); // ZonedDateTime -> LocalDate
        return localDate;
	}
	
	// string을 date 타입으로 변경
	public Date stringToDate(String str, String format) throws ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat(format);
        Date date = formatter.parse(str);
        return date;
	}
	
	public String stringDateChanger(String date) {
		String[] dateArray = date.split(" ");
		switch(dateArray[1]) {
        case "January":
        	dateArray[1] = "01";
            break;
        case "February":
        	dateArray[1] = "02";
            break;
        case "March":
        	dateArray[1] = "03";
            break;
        case "April":
        	dateArray[1] = "04";
            break;
        case "May":
        	dateArray[1] = "05";
            break;
        case "June":
        	dateArray[1] = "06";
            break;
        case "July":
        	dateArray[1] = "07";
            break;
        case "August":
        	dateArray[1] = "08";
            break;
        case "September":
        	dateArray[1] = "09";
            break;
        case "October":
        	dateArray[1] = "10";
            break;
        case "November":
        	dateArray[1] = "11";
            break;
        case "December":
        	dateArray[1] = "12";
            break;
	}
		String result = dateArray[0]+" "+dateArray[1]+" "+dateArray[2];
		return result;
	}
}
