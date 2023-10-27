package com.hospital.erp.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {

	 //직원리스트 조회 메서드
	 public List<MemberVO> memberList() throws Exception;
	 
	 //직원조회 메서드
	 public MemberVO memberData(MemberVO memberVO) throws Exception;
	 
	 //직원등록전 사번 조회해오는 메서드
	 public MemberVO memberDataMaxMemCd(MemberVO memberVO) throws Exception;
	 
	 //직원등록 메서드
	 public int memberInsert(MemberVO memberVO) throws Exception;
	 
		 

	 
	 
}
