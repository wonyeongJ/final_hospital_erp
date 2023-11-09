package com.hospital.erp.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hospital.erp.common.CodeVO;

@Mapper
public interface MemberDAO {

	 // 직원리스트 조회 메서드
	 public List<MemberVO> memberList() throws Exception;
	 
	 // 직원조회 메서드
	 public MemberVO memberData(MemberVO memberVO) throws Exception;
	 
	 // 직원등록전 사번 조회해오는 메서드
	 public MemberVO memberDataMaxMemCd(MemberVO memberVO) throws Exception;
	 
	 // 직원등록 메서드
	 public int memberInsert(MemberVO memberVO) throws Exception;
	 
	 // 시큐리티 로그인 조회 메서드
	 public MemberVO memberFindByData(String username);
	 
	 // 비밀번호 업데이트 메서드
	 public int memberUpdatePassword(MemberVO memberVO) throws Exception;
	 
	 // 조직도 member 조회 메서드
	 public List<MemberVO> memberListChart() throws Exception;
	 
	 // CODE 테이블 조회 메서드
	 public List<CodeVO> codeList() throws Exception;
	 
	 // update 메서드
	 public int memberUpdate(MemberVO memberVO) throws Exception;
	 
	 // 패스워드 재설정 전 입력한 값에 맞는 data 있는지 조회 해오는 메서드
	 public int memberUpdateForgotPassword(MemberVO memberVO) throws Exception;
}
