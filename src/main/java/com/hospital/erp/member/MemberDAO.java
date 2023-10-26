package com.hospital.erp.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {

	 public int memberLogin(MemberVO memberVO) throws Exception; 
	 
	 //직원등록전 사번 조회해오는 메서드
	 public MemberVO memberDataMaxMemCd(MemberVO memberVO) throws Exception;
	 
	 //직원등록 메서드
	 public int memberInsert(MemberVO memberVO) throws Exception;
	 
	 //직원조회 메서드
	 public MemberVO memberData(MemberVO memberVO) throws Exception;
	 
	 
}
