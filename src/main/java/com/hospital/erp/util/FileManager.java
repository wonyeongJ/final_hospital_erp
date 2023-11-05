package com.hospital.erp.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.AbstractView;

import com.hospital.erp.board.notice.NoticeDAO;
import com.hospital.erp.board.notice.NoticeFileVO;
import com.hospital.erp.file.FileVO;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class FileManager extends AbstractView {
	 	
		// 맥용 저장경로
	    @Value("${app2.upload.nodeValue2}")
	    private String uploadPath;
	    
	    // 윈도우용 저장경로
//	    @Value("${app.upload.nodeValue}")
//	    privte Strinf uploadPath;
	    
	    @Autowired
	    private NoticeDAO noticeDAO;

	    
		//file 저장 후 파일명 리턴
		public String save(String path, MultipartFile multipartFile)throws Exception{
			//어디에?, 어떤파일을?
			//1. 파일 객체 생성
			File file = new File(path);
			
			if(!file.exists()) {
				file.mkdirs();
			}
			
			//2. 저장할 파일명 생성
			String fileName = UUID.randomUUID().toString()+"_"+multipartFile.getOriginalFilename();
			
			//3. 파일을 저장
			file = new File(file, fileName);
			//FileCopyUtils.copy
			//FileCopyUtils.copy(multipartFile.getBytes(), file);
			//transferTo
			multipartFile.transferTo(file);
			
			return fileName;
		}

		@Override
		protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			// TODO Auto-generated method stub
			
		}
		

	

		public boolean fileDelete(FileVO fileVO, String path, HttpSession session,Map<String, Object> model) throws Exception {
	       
			String board = (String) model.get("board");
			
			path = fileVO.getBfPath()+board;

	        log.info("경로: " + path);

	        if (fileVO != null && fileVO.getBfFname() != null) {
	            // 2. 삭제할 파일의 경로 구성
	            File file = new File(path, fileVO.getBfFname());

	            log.info("삭제할 파일: " + file.getAbsolutePath());

	            if (file.exists()) {
	                if (file.delete()) {
	                    // 3. 파일 삭제 성공
	                    log.info("파일을 성공적으로 삭제했습니다");

	                    // 4. 데이터베이스에서도 삭제
	                    noticeDAO.fileDelete(fileVO.getBfCd());

	                    return true;
	                } else {
	                    log.error("파일을 삭제하지 못했습니다");
	                }
	            } else {
	                log.error("파일이 존재하지 않습니다");
	            }
	        } else {
	            log.error("올바르지 않은 파일 정보(fileVO) 또는 파일 이름입니다");
	        }

	        return false;
	    }
	    
}


