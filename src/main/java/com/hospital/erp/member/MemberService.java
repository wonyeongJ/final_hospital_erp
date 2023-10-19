package com.hospital.erp.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	
	 @Autowired private MemberDAO memberDAO;
	  
	 public MemberVO memberList(MemberVO memberVO) throws Exception {
		 MemberVO mem = memberDAO.memberList(memberVO); 
		 return mem; 
		 }
	 
}
