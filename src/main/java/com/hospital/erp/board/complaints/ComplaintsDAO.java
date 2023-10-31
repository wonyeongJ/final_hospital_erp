package com.hospital.erp.board.complaints;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ComplaintsDAO {
	
	// 민원게시판 리스트
	public List<ComplaintsVO> complaintsList(ComplaintsVO complaintsVO) throws Exception;


}
