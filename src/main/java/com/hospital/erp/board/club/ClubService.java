package com.hospital.erp.board.club;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hospital.erp.board.notice.NoticeDAO;
import com.hospital.erp.board.notice.NoticeFileVO;
import com.hospital.erp.util.FileManager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ClubService {
	
	@Autowired
	private ClubDAO clubDAO;
	
	@Autowired
	private FileManager fileManger;
	
	@Value("${app2.upload.nodeValue2}")
	private String uploadPath;
	
	@Value("${app2.board.club}")
	private String boardName;
	
	// 사내동호회 리스트
	public List<ClubVO> clubList(ClubVO clubVO) throws Exception{
		return clubDAO.clubList(clubVO);
	} 
	
	// 사내동호회 등록
	public int clubInsert(ClubVO clubVO,MultipartFile[] files)throws Exception{
		
		// 클럽 등록
        int result = clubDAO.clubInsert(clubVO);

        // 클럽 등록 후 반환된 CLUB_CD 가져오기
        int clubCd = clubDAO.lastInsertedClubCd();

        // CLUB_MEMBER 테이블에 회원 추가
        ClubMemberVO clubMemberVO = new ClubMemberVO();
        clubMemberVO.setMemCd(clubVO.getMemCd());
        clubMemberVO.setClubCd(clubCd);
        clubDAO.clubMemberInsert(clubMemberVO);
        
        

		
		// 파일 업로드 및 파일 정보 저장
        for (MultipartFile file : files) {
            if (!file.isEmpty()) {
                ClubFileVO clubFileVO = new ClubFileVO();
                clubFileVO.setCodeCd(11); // 해당 공지사항 카테고리 코드
                clubFileVO.setBfFk(clubCd); // 사내동호회 등록 후 생성된 PK
                clubFileVO.setBfOname(file.getOriginalFilename());
                String FileName = fileManger.save(this.uploadPath+this.boardName, file);
                clubFileVO.setBfFname(FileName);
                clubFileVO.setBfPath(uploadPath);
                String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
                clubFileVO.setBfExtension(extension);
                clubDAO.fileInsert(clubFileVO);
            }
        }

		return result;
	}
	

	public int clubMemberInsert(ClubMemberVO clubMemberVO)throws Exception{
		return 0;
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

		// 사내동호회 조회수 업데이트
		public int clubHitCount(int clubCd)throws Exception{
			return clubDAO.clubHitCount(clubCd);
		}
		


}
