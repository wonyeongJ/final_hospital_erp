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
	
	@Value("${app2.upload.nodeValue2}")
	private String uploadPath;
	
	@Value("${app.board.notice}")
	private String boardName;

	
	
	// 공지사항 리스트
	public List<NoticeVO> noticeList(NoticeVO noticeVO) throws Exception{
		return noticeDAO.noticeList(noticeVO);
	}
	
	// 공지사항 상세
	public NoticeVO noticeData(NoticeVO noticeVO) throws Exception{
		return noticeDAO.noticeData(noticeVO);
	}
	
	// 공지사항 등록
	public int noticeInsert(NoticeVO noticeVO, MultipartFile[] files) throws Exception {
		
		
		int result = noticeDAO.noticeInsert(noticeVO);
		int notCd = noticeVO.getNotCd();
		
		// 파일 업로드 및 파일 정보 저장
        for (MultipartFile file : files) {
            if (!file.isEmpty()) {
                NoticeFileVO noticeFileVO = new NoticeFileVO();
                noticeFileVO.setCodeCd(9); // 해당 공지사항 카테고리 코드
                noticeFileVO.setBfFk(notCd); // 공지사항 등록 후 생성된 PK
                noticeFileVO.setBfOname(file.getOriginalFilename());
                String FileName = fileManger.save(this.uploadPath+this.boardName, file);
                noticeFileVO.setBfFname(FileName);
                noticeFileVO.setBfPath(uploadPath);
                String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
                noticeFileVO.setBfExtension(extension);
                noticeDAO.fileInsert(noticeFileVO);
            }
        }

		return result;
	}
   
	
	// 파일다운로드
	public FileVO fileData(NoticeFileVO noticeFileVO)throws Exception{
		return noticeDAO.fileData(noticeFileVO);
	}
	
	// 공지사항 업데이트
	public int noticeUpdate (NoticeVO notceVO,MultipartFile[] files)throws Exception{
		
		int result = noticeDAO.noticeUpdate(notceVO);
		int notCd = notceVO.getNotCd();
		
		// 파일 업로드 및 파일 정보 저장
        for (MultipartFile file : files) {
            if (!file.isEmpty()) {
                NoticeFileVO noticeFileVO = new NoticeFileVO();
                noticeFileVO.setCodeCd(9); // 해당 공지사항 카테고리 코드
                noticeFileVO.setBfFk(notCd); // 공지사항 등록 후 생성된 PK
                noticeFileVO.setBfOname(file.getOriginalFilename());
                String FileName = fileManger.save(this.uploadPath+this.boardName, file);
                noticeFileVO.setBfFname(FileName);
                noticeFileVO.setBfPath(uploadPath);
                String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
                noticeFileVO.setBfExtension(extension);
                noticeDAO.fileInsert(noticeFileVO);
            }
        }

		return result;
	}

}
