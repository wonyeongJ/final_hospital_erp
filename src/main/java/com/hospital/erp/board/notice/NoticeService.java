package com.hospital.erp.board.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hospital.erp.file.FileVO;
import com.hospital.erp.util.FileManager;

@Service
public class NoticeService {
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private FileManager fileManger;
	
	@Value("${app.upload.nodeValue2}")
	private String uploadPath;
	
	
	// 공지사항 리스트
	public List<NoticeVO> noticeList(NoticeVO noticeVO) throws Exception{
		return noticeDAO.noticeList(noticeVO);
	}
	
	// 공지사항 상세
	public NoticeVO noticeData(int notCd) throws Exception{
		return noticeDAO.noticeData(notCd);
	}
	
	// 공지사항 등록
	public int noticeInsert(NoticeVO noticeVO, MultipartFile[] files) throws Exception {
		
		
		int result = noticeDAO.noticeInsert(noticeVO, files);
		
		
		for(MultipartFile multipartFile:files) {
		
		if(multipartFile.isEmpty()) {
			continue;
		}
		
		FileVO fileVO = new FileVO();
		String fileName=fileManger.save(this.uploadPath+"notice", multipartFile);
		fileVO.setBfFk(noticeVO.getNotCd());
		fileVO.setCodeCd(9);
		fileVO.setBfPath(uploadPath); // 실제경로
		
		// 파일 이름에서 확장자 추출
		String originalFilename = multipartFile.getOriginalFilename();
		int lastIndex = originalFilename.lastIndexOf('.');
		if (lastIndex > 0) {
		    String extension = originalFilename.substring(lastIndex + 1); // 확장자 추출
		    fileVO.setBfExtension(extension);
		} else {
		    // 확장자를 추출하지 못한 경우 예외 처리 또는 기본값 설정
		    fileVO.setBfExtension("확장자 없음"); // 예외 처리나 기본값을 설정해 주세요.
		}
		
		fileVO.setBfFname(fileName);
		fileVO.setBfOname(multipartFile.getOriginalFilename());
		result = noticeDAO.fileInsert(fileVO);
	}
		return result;
	}
   

}
