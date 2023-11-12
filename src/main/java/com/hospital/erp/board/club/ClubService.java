package com.hospital.erp.board.club;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hospital.erp.board.CommentVO;
import com.hospital.erp.board.complaints.ComplaintsFileVO;
import com.hospital.erp.board.complaints.ComplaintsVO;
import com.hospital.erp.board.notice.NoticeDAO;
import com.hospital.erp.board.notice.NoticeFileVO;
import com.hospital.erp.file.FileVO;
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
	
	 // 윈도우용 저장경로
//    @Value("${app.upload.nodeValue}")
//    privte Strinf uploadPath;
	
	@Value("${app2.board.club}")
	private String boardName;
	
	// 사내동호회 리스트
	public List<ClubVO> clubList(ClubVO clubVO) throws Exception{
		return clubDAO.clubList(clubVO);
	} 
	
	// 사내동호회 등록
	public int clubInsert(ClubVO clubVO,MultipartFile[] files1)throws Exception{
		
		// 클럽 등록
		int result = clubDAO.clubInsert(clubVO);
	
		// 클럽 등록 후 반환된 CLUB_CD 가져오기
	    int clubCd = clubVO.getClubCd();
		
	    if (result > 0) {  
		    // CLUB_MEMBER 테이블에 회원 추가
		    ClubMemberVO clubMemberVO = new ClubMemberVO();
		    clubMemberVO.setMemCd(clubVO.getMemCd());
		    clubMemberVO.setClubCd(clubCd);
		    clubDAO.clubMemberInsert(clubMemberVO);
		}
        
        
	    if (files1 != null) {
		
		// 파일 업로드 및 파일 정보 저장
        for (MultipartFile file : files1) {
            if (!file.isEmpty()) {
                ClubFileVO clubFileVO = new ClubFileVO();
                clubFileVO.setCodeCd(11); // 해당 게시판 카테고리 코드
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
	    }

		return result;
	}
	
	
	// 사내동호회 상세
		public ClubVO clubData(int clubCd) throws Exception{
				
		        log.info("clubCd {}번 사내동호회 데이터 조회 시도 중", clubCd);
		        ClubVO clubVO = clubDAO.clubData(clubCd);
			      if (clubVO != null) {
			          log.info("clubCd {}번 사내동호회 데이터를 성공적으로 조회했습니다: {}",clubCd, clubVO.toString());
			      }
			        return clubVO;
	    }
		
	// 사내동호회 멤버 리스트	
	public List<ClubMemberVO> clubMemberList(int clubCd)throws Exception{
		List<ClubMemberVO> memberList = clubDAO.clubMemberList(clubCd);
		return memberList;
	}	
		
	// 파일상세
	public List<ClubFileVO> fileData(int clubCd)throws Exception{
		
		List<ClubFileVO> fileList = clubDAO.fileData(clubCd);
		
		return fileList;
	}
	
	// 사내동호회 업데이트
	public int clubUpdate(ClubVO clubVO,MultipartFile[] files1)throws Exception{
		
		int result = clubDAO.clubUpdate(clubVO);
	    int clubCd = clubVO.getClubCd();
	    
	    if (files1 != null) {
	 // 파일 업로드 및 파일 정보 저장
        for (MultipartFile file : files1) {
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
	    }
		return result;
	}
	
		
	// 사내동호회 모집상태 업데이트
	public int clubStatusUpdate(ClubVO clubVO)throws Exception{
		int result = clubDAO.clubStatusUpdate(clubVO);
		
		return result;
	}
	
		
	
	// 클럽 멤버 등록
	public int clubMemberInsert(ClubMemberVO clubMemberVO)throws Exception{
		int result = clubDAO.clubMemberInsert(clubMemberVO);
		
		return result;
	}
	// 가입여부 확인
	public boolean clubMemberCk(int clubCd, String memCd) throws Exception {
	     ClubMemberVO clubMemberVO = new ClubMemberVO();
	     clubMemberVO.setClubCd(clubCd);
	     clubMemberVO.setMemCd(memCd);

	     int count = clubDAO.clubMemberCk(clubMemberVO);
	     return count > 0;
	}
	
	// 모임 탈퇴
	public int clubMemberDrop(ClubMemberVO clubMemberVO)throws Exception{
		
		return clubDAO.clubMemberDrop(clubMemberVO);
		
	}
		
	
	// 파일 다운로드
	public FileVO fileDown(FileVO fileVO) throws Exception{
		return clubDAO.fileDown(fileVO);
	}

			
	//fileDelete
	public int fileDelete(int bfCd)throws Exception{
			
		int result = clubDAO.fileDelete(bfCd);
		        
		return result;
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

		// 사내동호회 조회수 업데이트
		public int clubHitCount(int clubCd)throws Exception{
			return clubDAO.clubHitCount(clubCd);
		}
		
	//사내동호회 삭제 
	public int clubDelete(int clubCd) throws Exception{
		return clubDAO.clubDelete(clubCd);
	}	

	
	
	// 댓글
	
	// 댓글 리스트 조회
	public List<CommentVO> commentList(int clubCd) throws Exception {
	    return clubDAO.commentList(clubCd);
	}
	
	
	
	// 댓글 등록
	public int commentInsert(CommentVO commentVO) throws Exception {
	    return clubDAO.commentInsert(commentVO);
	}
	
	// 댓글 수정
	public int commentUpdate(CommentVO commentVO)throws Exception{
		
		int result = clubDAO.commentUpdate(commentVO);
		
		return result;
	}

}
