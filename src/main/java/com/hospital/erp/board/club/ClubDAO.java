package com.hospital.erp.board.club;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hospital.erp.board.notice.NoticeFileVO;
import com.hospital.erp.board.notice.NoticeVO;

@Repository
@Mapper
public interface ClubDAO {
	
	
	// 사내동호회 리스트
	public List<ClubVO> clubList(ClubVO clubVO) throws Exception; 
	
	// 사내동호회 등록
	public int clubInsert(ClubVO clubVO)throws Exception;
	
	// 사내모임 테이블의 방금 등록한 테이블 등록
	public int lastInsertedClubCd()throws Exception;
	public int clubMemberInsert(ClubMemberVO clubMemberVO)throws Exception;
	
	// 파일 등록
	public int fileInsert(ClubFileVO clubFileVO) throws Exception;
	
	// 파일 상세
	public List<ClubFileVO> fileData(int clubCd)throws Exception;
		
	// 파일 삭제
	public int fileDelete(int bfCd) throws Exception;		

	// 사내동호회 조회수 업데이트
	public int clubHitCount(int clubCd)throws Exception;
	

}
