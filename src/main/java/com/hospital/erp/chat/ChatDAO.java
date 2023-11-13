package com.hospital.erp.chat;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hospital.erp.member.MemberVO;



@Mapper
public interface ChatDAO {
	
	public List<MemberVO> getChatList(String memCd)throws Exception;
	
	public List<MemberVO> getSearch(String memName)throws Exception;
	
	public RoomVO roomCheck(RoomVO roomVO)throws Exception;
	
	public int createRoom(RoomVO roomVO)throws Exception;
	
	public int messageAdd(ChatMessageVO chatMessageVO)throws Exception;
	
	public List<ChatMessageVO> chatMessageList(RoomVO roomVO)throws Exception;
	
	public MemberVO getSomeone(MemberVO memberVO)throws Exception;
	
}