package com.hospital.erp.board.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.File;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hospital.erp.file.FileVO;
import com.hospital.erp.util.FileManager;
import com.hospital.erp.util.S3Uploader;

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
	
//	// 윈도우용 저장경로
//    @Value("${app.upload.nodeValue}")
//    private String uploadPath;
	
	@Value("${app2.board.notice}")
	private String boardName;

	@Autowired
	private S3Uploader s3Uploader;
	
	// 공지사항 리스트
	public List<NoticeVO> noticeList(NoticeVO noticeVO) throws Exception{
		return noticeDAO.noticeList(noticeVO);
	}
	
	// 공지사항 상세
	public NoticeVO noticeData(int notCd) throws Exception{
		
		NoticeVO noticeVO = noticeDAO.noticeData(notCd);
		if (noticeVO != null) {

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
	    return fileManger.fileDelete(noticeFileVO, uploadPath, session, null);
	}

	
	
	// 공지사항 등록
	public int noticeInsert(NoticeVO noticeVO, MultipartFile[] files1) throws Exception {
		
		
		int importantCount = noticeDAO.noticeImportantCount(1); // 중요 공지사항 개수 조회
        if (noticeVO.getNotImportant() == 1 && importantCount >= 3) {
            return -1; // 중요 공지사항 제한에 도달함
        }

        int result = noticeDAO.noticeInsert(noticeVO);
        int notCd = noticeVO.getNotCd();

        if (files1 != null) {
		// 파일 업로드 및 파일 정보 저장
        for (MultipartFile file : files1) {
            if (!file.isEmpty()) {
                NoticeFileVO noticeFileVO = new NoticeFileVO();
                noticeFileVO.setCodeCd(9); // 해당 공지사항 카테고리 코드
                noticeFileVO.setBfFk(notCd); // 공지사항 등록 후 생성된 PK
                noticeFileVO.setBfOname(file.getOriginalFilename());
                String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
                noticeFileVO.setBfExtension(extension);
                
                String fileName = s3Uploader.getUuid(file);
                noticeFileVO.setBfFname(fileName);
                
                String s3Url = s3Uploader.upload(file, boardName, fileName);
                noticeFileVO.setBfPath(s3Url);
               
                noticeDAO.fileInsert(noticeFileVO);
            }
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
	public ResponseEntity<byte[]> fileDown(FileVO fileVO) throws Exception{
		
		fileVO = noticeDAO.fileDown(fileVO);
		
		return s3Uploader.getObject(boardName+"/" + fileVO.getBfFname());
	}

	
	//fileDelete
	public int fileDelete(int bfCd)throws Exception{
		FileVO fileVO = new FileVO();
		
		fileVO.setBfCd(bfCd);
		
		fileVO = noticeDAO.fileDown(fileVO);
		
		
		int result = noticeDAO.fileDelete(bfCd);
		
		s3Uploader.deleteFile(boardName+"/" + fileVO.getBfFname());
	 
		
		return result;
		
	}
	
	// 공지사항 업데이트
	public int noticeUpdate (NoticeVO noticeVO,MultipartFile[] files1)throws Exception{
		
		int notCd = noticeVO.getNotCd();
		

		int result = noticeDAO.noticeUpdate(noticeVO);
       

		if (files1 != null) {
			// 파일 업로드 및 파일 정보 저장
			for (MultipartFile file : files1) {
				if (!file.isEmpty()) {
					NoticeFileVO noticeFileVO = new NoticeFileVO();
					noticeFileVO.setCodeCd(9); // 해당 공지사항 카테고리 코드
					noticeFileVO.setBfFk(notCd); // 공지사항 등록 후 생성된 PK
					noticeFileVO.setBfOname(file.getOriginalFilename());
					String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
					noticeFileVO.setBfExtension(extension);

					String fileName = s3Uploader.getUuid(file);
					noticeFileVO.setBfFname(fileName);

					String s3Url = s3Uploader.upload(file, boardName, fileName);
					noticeFileVO.setBfPath(s3Url);

					noticeDAO.fileInsert(noticeFileVO);
				}
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
	
	public int noticeChangeStatus(NoticeVO noticeVO) throws Exception {
		return noticeDAO.noticeChangeStatus(noticeVO.getNotCd(), noticeVO.getNotImportant());
    }
}
