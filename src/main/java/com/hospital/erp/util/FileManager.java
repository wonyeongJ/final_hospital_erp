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

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.AbstractView;

import com.hospital.erp.board.notice.NoticeFileVO;
import com.hospital.erp.file.FileVO;

@Component
public class FileManager extends AbstractView {
	 	
	    @Value("${app2.upload.nodeValue2}")
	    private String uploadPath;

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
		

	

    // 파일 삭제
    public boolean fileDelete(NoticeFileVO noticeFileVO, String path, HttpSession session) {
        // 1. 삭제할 폴더의 실제 경로
        path = session.getServletContext().getRealPath(path);

        File file = new File(path, noticeFileVO.getBfFname());

        // 로그 추가
        System.out.println("Deleting file: " + file.getAbsolutePath());

        return file.delete();
    }
}

//    // fileSave
//    public String fileSave(String path, HttpSession session, MultipartFile multipartFile) throws Exception {
//        // 파일의 정보를 이용해서 HDD에 파일을 저장
//
//        // 2. 실제 경로 알아오기
//        // jsp: application
//        // java: ServletContext
//        String realPath = session.getServletContext().getRealPath(path);
//        System.out.println(realPath);
//
//        File file = new File(realPath);
//
//        if (!file.exists()) {
//            file.mkdirs();
//        }
//
//        // 3. 어떤 이름으로 저장??
//        // 2. API 사용
//        String uId = UUID.randomUUID().toString();
//        uId = uId + "_" + multipartFile.getOriginalFilename();
//        System.out.println(uId);
//        file = new File(file, uId);
//
//        // 4. 파일을 저장
//        // B. MultipartFile의 transferTo 메서드
//        multipartFile.transferTo(file);
//
//        return uId;
//    }
//}
