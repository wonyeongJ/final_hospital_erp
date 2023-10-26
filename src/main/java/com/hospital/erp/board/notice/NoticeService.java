package com.hospital.erp.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService {
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	public List<NoticeVO> noticeList(NoticeVO noticeVO) throws Exception{
		return noticeDAO.noticeList(noticeVO);
	}

}
