package com.hospital.erp.chat;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatMessageVO {
	public enum MessageType{
		ENTER, TALK, QUIT
	}
	
	// 메세지 타입 예)ENTER = 처음 들어왔을때, TALK = 이미 방에 속한사람의 메세지
	private MessageType type;
	
	// 채팅방의 번호
	private Long roomNum;
	
	// 메세지를 발신한 사람
	private String sender;
	
	// 메세지 수신자
	private String receiver;
	
	// 메세지 내용
	private String message;
	
	// 메세지 작성시간 (Date 타입이지만 시간을 생성해서 넣어주기때문에 VO는 String타입 사용)
	private String chatDate;
	

}