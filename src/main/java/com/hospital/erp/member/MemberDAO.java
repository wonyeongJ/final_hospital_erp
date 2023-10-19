package com.hospital.erp.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {

	 public MemberVO memberList(MemberVO memberVO) throws Exception; 
		
}
