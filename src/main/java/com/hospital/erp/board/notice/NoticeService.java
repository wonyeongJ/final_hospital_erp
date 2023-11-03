package com.hospital.erp.board.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.File;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hospital.erp.file.FileVO;
import com.hospital.erp.util.FileManager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NoticeService {
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private FileManager fileManger;
	
	@Value("${app2.upload.nodeValue2}")
	private String uploadPath;
	
	@Value("${app2.board.notice}")
	private String boardName;

	
	
	// 공지사항 리스트
	public List<NoticeVO> noticeList(NoticeVO noticeVO) throws Exception{
		return noticeDAO.noticeList(noticeVO);
	}
	
	// 공지사항 상세
	public NoticeVO noticeData(int notCd) throws Exception{
		
	        //log.info("notCd {}번 공지사항 데이터 조회 시도 중", notCd);
	        NoticeVO noticeVO = noticeDAO.noticeData(notCd);
	        if (noticeVO != null) {
	         //   log.info("notCd {}번 공지사항 데이터를 성공적으로 조회했습니다: {}", notCd, noticeVO.toString());
	        }
	        return noticeVO;
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
   
	
	// 파일상세
	public List<NoticeFileVO> fileData(int notCd)throws Exception{
		 List<NoticeFileVO> fileList = noticeDAO.fileData(notCd);
		    return fileList;
		}
	
	
	
	// 파일 다운로드
	public FileVO fileDown(FileVO fileVO) throws Exception{
		return noticeDAO.fileDown(fileVO);
	}

	
	//fileDelete
	public int fileDelete(int bfCd)throws Exception{
	
		int result = noticeDAO.fileDelete(bfCd);
        
		return result;
		
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
	
	// 공지사항 삭제
	public int noticeDelete(int notCd) throws Exception{
		return noticeDAO.noticeDelete(notCd);
	}

}
