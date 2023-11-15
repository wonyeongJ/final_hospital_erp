package com.hospital.erp.board.club;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hospital.erp.board.CommentVO;
import com.hospital.erp.board.notice.NoticeFileVO;
import com.hospital.erp.board.notice.NoticeVO;
import com.hospital.erp.file.FileVO;

@Repository
@Mapper
public interface ClubDAO {
	
	
	// 사내동호회 리스트
	public List<ClubVO> clubList(ClubVO clubVO) throws Exception; 
	
	// 사내동호회 등록
	public int clubInsert(ClubVO clubVO)throws Exception;
	
	// 사내동호회 상세
	public ClubVO clubData(int clubCd)throws Exception;
	
	// 사내동호회 멤버 리스트	
	public List<ClubMemberVO> clubMemberList(int clubCd)throws Exception;
	
	// 사내모임 테이블의 멤버등록
	public int clubMemberInsert(ClubMemberVO clubMemberVO)throws Exception;
	
	// 사내동호회 업데이트
	public int clubUpdate(ClubVO clubVO)throws Exception;
	
	// 사내동호회 모집상태 업데이트
	public int clubStatusUpdate(ClubVO clubVO)throws Exception;
	
	// 파일 등록
	public int fileInsert(ClubFileVO clubFileVO) throws Exception;
	
	// 파일 상세
	public List<ClubFileVO> fileData(int clubCd)throws Exception;
	
	// 파일 다운로드
	public FileVO fileDown(FileVO fileVO) throws Exception;	
		
	// 파일 삭제
	public int fileDelete(int bfCd) throws Exception;		

	// 사내동호회 조회수 업데이트
	public int clubHitCount(int clubCd)throws Exception;
	
	// 사내동호회 삭제
	public int clubDelete(int clubCd) throws Exception;
	
	// 가입여부 확인
	public int clubMemberCk(ClubMemberVO clubMemberVO)throws Exception;
	
	// 모임 탈퇴
	public int clubMemberDrop(ClubMemberVO clubMemberVO)throws Exception;
	
	// 댓글
	
	// 댓글 리스트
	public List<CommentVO> commentList(int clubCd)throws Exception;
	
	// 댓글 부모글 조회
	public CommentVO commentData(CommentVO commentVO)throws Exception;
	
	// 댓글 등록
	public int commentInsert(CommentVO commentVO)throws Exception;
	
	// 댓글 수정
	public int commentUpdate(CommentVO commentVO)throws Exception;
	
	// 댓글 삭제
	public int commentDelete(int commCd) throws Exception;

}
