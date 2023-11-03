package com.hospital.erp.board.complaints;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hospital.erp.board.notice.NoticeFileVO;
import com.hospital.erp.file.FileVO;

@Repository
@Mapper
public interface ComplaintsDAO {
	
	// 민원게시판 리스트
	public List<ComplaintsVO> complaintsList(ComplaintsVO complaintsVO) throws Exception;

	// 민원게시판 등록
	public int complaintsInsert(ComplaintsVO complaintsVO) throws Exception;

	// 파일 등록
	public int fileInsert(ComplaintsFileVO complaintsFileVO) throws Exception;
		
	// 민원게시판 상세
	public ComplaintsVO complaintsData(int compCd) throws Exception;
	
	// 파일 상세
	public List<ComplaintsFileVO> fileData(int compCd)throws Exception;
	
	// 민원게시판 업데이트
	public int complaintsUpdate(ComplaintsVO complaintsVO)throws Exception;
	
	// 조치상태 업데이트 DAO
	public int actionUpdate(ComplaintsVO complaintsVO)throws Exception;
	
	// 파일 다운로드
	public FileVO fileDown(FileVO fileVO) throws Exception;
	
	// 파일 삭제
	public int fileDelete(int bfCd) throws Exception;
	
	// 민원게시판 삭제 (논리삭제)
	public int complaintsDelete(ComplaintsVO complaintsVO)throws Exception;
	

		
}
