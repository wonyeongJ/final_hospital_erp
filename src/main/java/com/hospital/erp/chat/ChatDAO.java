package com.hospital.erp.chat;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hospital.erp.member.MemberVO;



@Mapper
public interface ChatDAO {
	
	// 채팅을 할 수 있는 사람들의 리스트
	public List<MemberVO> getChatList(String memCd)throws Exception;
	
	// 채팅 할 사람들을 검색
	public List<MemberVO> getSearch(String memName)throws Exception;
	
	// 방이있는지 확인 없다면 생성해주기위함
	public RoomVO roomCheck(RoomVO roomVO)throws Exception;
	
	// 방 생성
	public int createRoom(RoomVO roomVO)throws Exception;
	
	// 채팅 메세지 발신
	public int messageAdd(ChatMessageVO chatMessageVO)throws Exception;
	
	// 이전 채팅내역
	public List<ChatMessageVO> chatMessageList(RoomVO roomVO)throws Exception;
	
	// 검색한 후 그 사람의 데이터를 전부 조회
	public MemberVO getSomeone(MemberVO memberVO)throws Exception;
	
}