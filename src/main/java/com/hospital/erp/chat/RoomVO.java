package com.hospital.erp.chat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@ToString
public class RoomVO {

	// 채팅방 번호
	private Long roomNum;
    
	// 채팅방의 멤버
	private Long user1;
    
	// 채팅방의 멤버
	private Long user2;
    
}