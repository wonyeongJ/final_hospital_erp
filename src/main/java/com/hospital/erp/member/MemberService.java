package com.hospital.erp.member;

import java.security.spec.EncodedKeySpec;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hospital.erp.common.CodeVO;
import com.hospital.erp.util.EmailService;
import com.hospital.erp.util.FileManager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberService implements UserDetailsService {

	
	 @Autowired 
	 private MemberDAO memberDAO;
	 
	 @Autowired
	 private PasswordEncoder passwordEncoder;
 
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private FileManager fileManager;
	
    private String uploadPath = "/static/upload/";
	
	@Value("${app.member.profile}")
    private String profile;
	 
	//로그인처리 하는 메서드
	 @Override
	public UserDetails loadUserByUsername(String memCd) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		 log.info("=================== 테스트 =================== {}", memCd);
		MemberVO memberVO = memberDAO.memberFindByData(memCd);
		System.out.println("loaad depName : " + memberVO.getDepName());
		
		return memberVO;
	}
	 
	
	//직원 리스트 조회 메서드
	public List<MemberVO> memberList() throws Exception {
		return memberDAO.memberList();
	}
	
	//직원 조회 메서드
	public MemberVO memberData(MemberVO memberVO) throws Exception {
		return memberDAO.memberData(memberVO);
	}
	
	//직원 등록 메서드
	public int memberInsert(MemberVO memberVO) throws Exception {
		
		log.info("===========MemberVO {}", memberVO);
		// memberVO 값에서 일부분만 수정할거기때문에 바꿀 내용을 임시 객체 maxMemberVO를 통해 저장한다.
		MemberVO maxMemberVO = new MemberVO(); 
		maxMemberVO.setMemHdate(memberVO.getMemHdate());
		maxMemberVO.setJobCd(memberVO.getJobCd());
		
		// ex) 2303 LIKE에 들어갈 연도 + 직무코드 만들기
		String yearStart = maxMemberVO.getMemHdate().toString().substring(2, 4); //23
		String selectjobCode = "";
		if (maxMemberVO.getJobCd() < 10) {
			String addZero = "0";
			selectjobCode = addZero.concat(memberVO.getJobCd().toString());
		}
		// 조회용으로쓰는 maxMemberVO에 위에서만든 ex) 2303% 값 넣기
		maxMemberVO.setMemCd(yearStart.concat(selectjobCode.concat("%")));
		log.info("========maxMemberVO memCd 설정값===={}=========",maxMemberVO);
		
		// 자신의 직무코드에 맞는 사번중 가장 높은 사번 조회 메서드
		maxMemberVO = memberDAO.memberDataMaxMemCd(maxMemberVO);
		log.info("========maxMemberVO  조회해온값===={}=========",maxMemberVO);
		// 위의 메서드를 통해 조회해온 사번이 NULL일 경우 실행 메서드
		if (maxMemberVO == null) {
			
			String startMemCd = "001";
			String jobCode = "";
			//now 객체 String 타입 변환 후 뒤에 연도 두자리 잘라내기 
			String year = memberVO.getMemHdate().toString().substring(2, 4);   // 23
			
			// 직무코드 3 0 -> 03, 4 -> 04 로만들기
			if (memberVO.getJobCd() < 10) {
				String addZero = "0";
				jobCode = addZero.concat(memberVO.getJobCd().toString());
			}
			// 사번 연도2자리+직무코드+순서 결합 
			startMemCd = year.concat(jobCode.concat(startMemCd));
			//memberVO에 사번 대입
			memberVO.setMemCd(startMemCd);
			log.info("===============MemberVO 쿼리NULL실행 {} =========", memberVO);
			
		}else { // 조회해온 사번이 NULL 이 아닐 경우 실행
			log.info("======maxMemberVO 쿼리 NULL아닐때 {} ", maxMemberVO);
			memberVO.setMemCd(maxMemberVO.getMemCd()); 
		}
		
		//비밀번호 생성 "-" 으로 앞 6자리 분리
		String [] juminAr = memberVO.getMemRnum().split("-");
		memberVO.setMemPw(passwordEncoder.encode(juminAr[0]));
	
		return memberDAO.memberInsert(memberVO);
	}
	
	// passwordUpdate
	public int memberUpdatePassword(PasswordVO passwordVO) throws Exception{
		// 시큐리티에서 유저정보 꺼내기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal;
		MemberVO memberVO = (MemberVO)userDetails;
		
		log.info("=========service passwordVOconfirm ====  {}",passwordVO);
		memberVO.setMemPw(passwordEncoder.encode(passwordVO.getNewPasswordConfirm()));
		log.info("=========service passwordVOconfirm ====  {}",memberVO.getMemPw());
		return memberDAO.memberUpdatePassword(memberVO);
	}
	
	// chartList
	public List<MemberVO> memberListChart() throws Exception {
		return memberDAO.memberListChart();
	}
	
	// codeList
	public List<CodeVO> codeList() throws Exception {
		return memberDAO.codeList();
	}
	
	// member 업데이트
	public int memberUpdate(MemberVO memberVO) throws Exception {
		return memberDAO.memberUpdate(memberVO);
	}
	
	// forgotPassword 로 사번 이메일 받아서 해당하는 
	public int memberUpdateForgotPassword(MemberVO memberVO) throws Exception {
		// 이메일로 임시비밀번호 보내기
		String temporaryPassword = emailService.sendEmail(memberVO.getMemEmail());
		log.info("=========서비스단에서 임시번호 인코딩전 ==========={}",temporaryPassword);
		memberVO.setMemPw(passwordEncoder.encode(temporaryPassword));
		// update 쿼리이기때문에 성공시 1 실패시 0 성공인 경우 해당하는 사번과 email이 있다는 것 
		int result = memberDAO.memberUpdateForgotPassword(memberVO); 
		return result;
	}
	
	// memberProfile Insert 메서드
	public int memberProfileInsert(MemberVO memberVO,MultipartFile multipartFile) throws Exception {
		log.info("서비스 진입 memberVO {} ==============",memberVO);
		int result = 0;
		
		
		
		// file이 없지 않다면
//		if(!multipartFile.isEmpty()) {
//			MemberFileVO memberFIleVO = new MemberFileVO();
//			// 파일 저장하는 사람 사번 넣기
//			memberFIleVO.setMemCd(memberVO.getMemCd());
//			log.info("사번 넣기 부분 memberVO {} ==============",memberVO);
//			// 파일의 원본이름 가져와서 MemberFileVO 에 넣기
//			memberFIleVO.setMfOname(multipartFile.getOriginalFilename());
//			// UUID 넣어서 filename 만들기
//			String FileName = fileManager.save(this.uploadPath+this.profile, multipartFile);
//			// 만든 fileName을 MemeberFileVO 에 넣기
//			memberFIleVO.setMfFname(FileName);
//			// 업로드 경로 넣어주기
//			memberFIleVO.setMfPath(uploadPath+this.profile);
//            // 확장자명 추출해서 넣기 
//			String extension = multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf(".") + 1);
//			memberFIleVO.setMfExtention(extension);
//			log.info("끝나고나서 memberFileVO {} ==============",memberFIleVO);
//			// DAO에 넣기
//			result = memberDAO.memberProfileInsert(memberFIleVO);
//		}
		
		return result;
	}
	
}
