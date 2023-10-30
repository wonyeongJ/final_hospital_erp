package com.hospital.erp.board.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.hospital.erp.file.FileVO;

@Repository
@Mapper
public interface NoticeDAO {
	
	// 공지사항 리스트
	public List<NoticeVO> noticeList(NoticeVO noticeVO) throws Exception;
	
	// 공지사항 상세
	public NoticeVO noticeData(NoticeVO noticeVO) throws Exception;

	// 공지사항 등록
	public int noticeInsert(NoticeVO noticeVO) throws Exception;

	// 파일 등록
	public int fileInsert(NoticeFileVO noticeFileVO) throws Exception;
	
	// 파일다운로드
	public NoticeFileVO fileData(NoticeFileVO noticeFileVO)throws Exception;
	
	// 파일 삭제
	public int fileDelete(NoticeFileVO noticeFileVO) throws Exception;		

	// 공지사항 업데이트
	public int noticeUpdate (NoticeVO notceVO)throws Exception;
	
	// 공지사항 조회수 업데이트
	public int noticeHitCount(int notCd)throws Exception;
		
	// 중요 공지사항 카운트
	public int noticeImportantCount(int notImportant) throws Exception;
	
}
