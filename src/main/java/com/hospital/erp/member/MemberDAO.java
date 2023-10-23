package com.hospital.erp.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {

	 public int memberLogin(MemberVO memberVO) throws Exception; 
		
}
