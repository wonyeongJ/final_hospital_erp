package com.hospital.erp.board.complaints;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hospital.erp.board.notice.NoticeDAO;
import com.hospital.erp.board.notice.NoticeFileVO;
import com.hospital.erp.board.notice.NoticeService;
import com.hospital.erp.board.notice.NoticeVO;
import com.hospital.erp.file.FileVO;
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



	// 민원게시판 리스트
	public List<ComplaintsVO> complaintsList(ComplaintsVO complaintsVO) throws Exception{
		return complaintsDAO.complaintsList(complaintsVO);
	}
	
	// 민원게시판 상세
		public ComplaintsVO complaintsData(int compCd) throws Exception{
			
		        log.info("compCd {}번 민원게시판 데이터 조회 시도 중", compCd);
		        ComplaintsVO complaintsVO = complaintsDAO.complaintsData(compCd);
		        if (complaintsVO != null) {
		            log.info("compCd {}번 민원게시판 데이터를 성공적으로 조회했습니다: {}", compCd, complaintsVO.toString());
		        }
		        return complaintsVO;
		    }
	
	// 민원게시판 등록
		public int complaintsInsert(ComplaintsVO complaintsVO, MultipartFile[] files) throws Exception {

	        int result = complaintsDAO.complaintsInsert(complaintsVO);
	        int compCd = complaintsVO.getCompCd();

			
			// 파일 업로드 및 파일 정보 저장
	        for (MultipartFile file : files) {
	            if (!file.isEmpty()) {
	                ComplaintsFileVO complaintsFileVO = new ComplaintsFileVO();
	                complaintsFileVO.setCodeCd(10); // 해당 민원게시판 카테고리 코드
	                complaintsFileVO.setBfFk(compCd); // 민원게시판 등록 후 생성된 PK
	                complaintsFileVO.setBfOname(file.getOriginalFilename());
	                String FileName = fileManger.save(this.uploadPath+this.boardName, file);
	                complaintsFileVO.setBfFname(FileName);
	                complaintsFileVO.setBfPath(uploadPath);
	                String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
	                complaintsFileVO.setBfExtension(extension);
	                complaintsDAO.fileInsert(complaintsFileVO);
	            }
	        }

			return result;
		}
		
		
		// 썸머노트 사진 등록
		public String contentsImgInsert(MultipartFile files, HttpSession session) throws Exception{
			
			
			 String FileName = fileManger.save(this.uploadPath+this.boardName, files);
	         
	         return this.uploadPath+this.boardName+FileName;
		}
		
		
		// 썸머노트 사진 삭제
//		public boolean contentsImgDelete(ComplaintsFileVO complaintsFileVO, HttpSession session) throws Exception {
//		   
//			complaintsFileVO.setBfFname(this.boardName.substring(this.boardName.lastIndexOf("/") + 1));
//		    return fileManger.fileDelete(complaintsFileVO, uploadPath, session);
//		}
		
		// 파일상세
		public List<ComplaintsFileVO> fileData(int compCd)throws Exception{
			 List<ComplaintsFileVO> fileList = complaintsDAO.fileData(compCd);
			    return fileList;
			}
		
		
		// 민원게시판 업데이트
		public int complaintsUpdate(ComplaintsVO complaintsVO,MultipartFile[] files)throws Exception{
			   int result = complaintsDAO.complaintsUpdate(complaintsVO);
		       int compCd = complaintsVO.getCompCd();

				
				// 파일 업로드 및 파일 정보 저장
		        for (MultipartFile file : files) {
		            if (!file.isEmpty()) {
		                ComplaintsFileVO complaintsFileVO = new ComplaintsFileVO();
		                complaintsFileVO.setCodeCd(10); // 해당 민원게시판 카테고리 코드
		                complaintsFileVO.setBfFk(compCd); // 민원게시판 등록 후 생성된 PK
		                complaintsFileVO.setBfOname(file.getOriginalFilename());
		                String FileName = fileManger.save(this.uploadPath+this.boardName, file);
		                complaintsFileVO.setBfFname(FileName);
		                complaintsFileVO.setBfPath(uploadPath);
		                String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
		                complaintsFileVO.setBfExtension(extension);
		                complaintsDAO.fileInsert(complaintsFileVO);
		            }
		        }

				return result;
			}
		

		// 조치상태 업데이트
		public int actionUpdate(ComplaintsVO complaintsVO)throws Exception{
			int result = complaintsDAO.actionUpdate(complaintsVO);
			
			return result;
		}
		
		// 파일 다운로드
		public FileVO fileDown(FileVO fileVO) throws Exception{
			return complaintsDAO.fileDown(fileVO);
		}

		
		//fileDelete
		public int fileDelete(int bfCd)throws Exception{
		
			int result = complaintsDAO.fileDelete(bfCd);
	        
			return result;
			
		}
		
		// 민원게시판 삭제 (논리삭제)
		public int complaintsDelete(int compCd) throws Exception {
		    ComplaintsVO complaintsVO = new ComplaintsVO();
		    complaintsVO.setCompCd(compCd);
		    complaintsVO.setCompDelete(1); // 1은 삭제 플래그

		    int result = complaintsDAO.complaintsDelete(complaintsVO);

		    return result;
		}
		


}
