package com.hospital.erp.board.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface NoticeDAO {
	
	public List<NoticeVO> noticeList(NoticeVO noticeVO);

}
