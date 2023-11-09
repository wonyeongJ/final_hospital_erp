package com.hospital.erp.chat;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChatDAO {
	
	public int createRoom(ChatMemberVO chatMemberVO) throws Exception;

	public ChatMemberVO getRoom(ChatMemberVO chatMemberVO) throws Exception;
}