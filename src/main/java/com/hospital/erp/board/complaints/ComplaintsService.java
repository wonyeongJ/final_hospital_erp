package com.hospital.erp.board.complaints;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.hospital.erp.board.notice.NoticeDAO;
import com.hospital.erp.board.notice.NoticeService;
import com.hospital.erp.board.notice.NoticeVO;
import com.hospital.erp.util.FileManager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ComplaintsService {

	
	@Autowired
	private ComplaintsDAO complaintsDAO;
	
	@Autowired
	private FileManager fileManger;
	
	@Value("${app2.upload.nodeValue2}")
	private String uploadPath;
	
	@Value("${app2.board.complaints}")
	private String boardName;



	// 공지사항 리스트
	public List<ComplaintsVO> complaintsList(ComplaintsVO complaintsVO) throws Exception{
		return complaintsDAO.complaintsList(complaintsVO);
	}
}
