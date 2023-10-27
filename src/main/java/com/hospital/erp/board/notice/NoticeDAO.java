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
	public NoticeVO noticeData(int notCd) throws Exception;

	// 공지사항 등록
	public int noticeInsert(NoticeVO noticeVO) throws Exception;

	// 파일 등록
	public int fileInsert(FileVO fileVO) throws Exception;

}
