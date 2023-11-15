package com.hospital.erp.board.complaints;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hospital.erp.board.notice.NoticeDAO;
import com.hospital.erp.board.notice.NoticeFileVO;
import com.hospital.erp.board.notice.NoticeService;
import com.hospital.erp.board.notice.NoticeVO;
import com.hospital.erp.file.FileVO;
import com.hospital.erp.util.FileManager;
import com.hospital.erp.util.S3Uploader;

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

	@Autowired
	private S3Uploader s3Uploader;


	// 민원게시판 리스트
	public List<ComplaintsVO> complaintsList(ComplaintsVO complaintsVO) throws Exception{
		return complaintsDAO.complaintsList(complaintsVO);
	}
	
	// 민원게시판 상세
	public ComplaintsVO complaintsData(int compCd) throws Exception{
			
		ComplaintsVO complaintsVO = complaintsDAO.complaintsData(compCd);
		
		if (complaintsVO != null) {
		}
		return complaintsVO;
	}
	
	// 민원게시판 등록
	public int complaintsInsert(ComplaintsVO complaintsVO, MultipartFile[] files1) throws Exception {

		int result = complaintsDAO.complaintsInsert(complaintsVO);
		int compCd = complaintsVO.getCompCd();

		if (files1 != null) {
			// 파일 업로드 및 파일 정보 저장
			for (MultipartFile file : files1) {
				if (!file.isEmpty()) {

					ComplaintsFileVO complaintsFileVO = new ComplaintsFileVO();
					complaintsFileVO.setCodeCd(10); // 해당 민원게시판 카테고리 코드
					complaintsFileVO.setBfFk(compCd); // 민원게시판 등록 후 생성된 PK
					complaintsFileVO.setBfOname(file.getOriginalFilename());
					String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
					complaintsFileVO.setBfExtension(extension);
	                
	                String fileName = s3Uploader.getUuid(file);
	                complaintsFileVO.setBfFname(fileName);
	                
	                String s3Url = s3Uploader.upload(file, boardName, fileName);
	                complaintsFileVO.setBfPath(s3Url);
	               
					complaintsDAO.fileInsert(complaintsFileVO);
				}
			}
		}

		return result;
	}
		
		
	// 썸머노트 사진 등록
	public String contentsImgInsert(MultipartFile files, HttpSession session) throws Exception{


		String FileName = fileManger.save(this.uploadPath+this.boardName, files);

		return this.uploadPath+this.boardName+FileName;
	}




	// 파일상세
	public List<ComplaintsFileVO> fileData(int compCd)throws Exception{
		
		List<ComplaintsFileVO> fileList = complaintsDAO.fileData(compCd);
		
		return fileList;
	}


	// 민원게시판 업데이트
	public int complaintsUpdate(ComplaintsVO complaintsVO,MultipartFile[] files1)throws Exception{
		
		int result = complaintsDAO.complaintsUpdate(complaintsVO);
		int compCd = complaintsVO.getCompCd();

		if (files1 != null) {
			// 파일 업로드 및 파일 정보 저장
			for (MultipartFile file : files1) {
				if (!file.isEmpty()) {

					ComplaintsFileVO complaintsFileVO = new ComplaintsFileVO();
					complaintsFileVO.setCodeCd(10); // 해당 민원게시판 카테고리 코드
					complaintsFileVO.setBfFk(compCd); // 민원게시판 등록 후 생성된 PK
					complaintsFileVO.setBfOname(file.getOriginalFilename());
					String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
					complaintsFileVO.setBfExtension(extension);

					String fileName = s3Uploader.getUuid(file);
					complaintsFileVO.setBfFname(fileName);

					String s3Url = s3Uploader.upload(file, boardName, fileName);
					complaintsFileVO.setBfPath(s3Url);

					complaintsDAO.fileInsert(complaintsFileVO);
				}
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
	public ResponseEntity<byte[]> fileDown(FileVO fileVO) throws Exception{
		
		fileVO = complaintsDAO.fileDown(fileVO);

		return s3Uploader.getObject(boardName+"/" + fileVO.getBfFname());
	}


	//fileDelete
	public int fileDelete(int bfCd)throws Exception{
		
		FileVO fileVO = new FileVO();
		
		fileVO.setBfCd(bfCd);
		
		// 파일의 정보를 가져오기위해 fileDown 메서드를 이용해 하나의 사진 정보를 가져옴
		fileVO = complaintsDAO.fileDown(fileVO);
		
		int result = complaintsDAO.fileDelete(bfCd);
		
		s3Uploader.deleteFile(boardName+"/" + fileVO.getBfFname());

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
