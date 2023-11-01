package com.hospital.erp.board.complaints;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hospital.erp.board.notice.NoticeFileVO;

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
	
	//public int comUpdate(int compCd)throws Exception;
		
}
