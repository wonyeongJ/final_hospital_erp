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
	
	
	// 썸머노트 사진 등록
	public String contentsImgInsert(MultipartFile files, HttpSession session) throws Exception{
		
		
		 String FileName = fileManger.save(this.uploadPath+this.boardName, files);
         
         return this.uploadPath+this.boardName+FileName;
	}
	
	
	// 썸머노트 사진 삭제
	public boolean contentsImgDelete(NoticeFileVO noticeFileVO, HttpSession session) throws Exception {
	   
		noticeFileVO.setBfFname(this.boardName.substring(this.boardName.lastIndexOf("/") + 1));
	    return fileManger.fileDelete(noticeFileVO, uploadPath, session);
	}

	
	
	// 공지사항 등록
	public int noticeInsert(NoticeVO noticeVO, MultipartFile[] files) throws Exception {
		
		
		int importantCount = noticeImportantCount(1); // 중요 공지사항 개수 조회
        if (noticeVO.getNotImportant() == 1 && importantCount >= 3) {
            return -1; // 중요 공지사항 제한에 도달함
        }

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
	public NoticeFileVO fileData(NoticeFileVO noticeFileVO)throws Exception{
		return noticeDAO.fileData(noticeFileVO);
	}
	
	//fileDelete
	public int fileDelete(NoticeFileVO noticeFileVO,HttpSession session)throws Exception{
			
			noticeFileVO = (NoticeFileVO) noticeDAO.fileData(noticeFileVO);
			boolean flag = fileManger.fileDelete(noticeFileVO, uploadPath, session);
			
			if(flag) {
				//db삭제
				return noticeDAO.fileDelete(noticeFileVO);
			}
			
			return 0;
	}
	
	// 공지사항 업데이트
	public int noticeUpdate (NoticeVO noticeVO,MultipartFile[] files)throws Exception{
		
		int importantCount = noticeImportantCount(1); // 중요 공지사항 개수 조회
        if (noticeVO.getNotImportant() == 1 && importantCount >= 3) {
            return -1; // 중요 공지사항 제한에 도달함
        }

       int result = noticeDAO.noticeUpdate(noticeVO);
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
	
	
	// 공지사항 조회수 업데이트
	public int noticeHitCount(int notCd)throws Exception{
		return noticeDAO.noticeHitCount(notCd);
	}
	
	// 중요 공지사항 카운트
	public int noticeImportantCount(int notImportant) throws Exception{
		return noticeDAO.noticeImportantCount(notImportant);
	}

}
