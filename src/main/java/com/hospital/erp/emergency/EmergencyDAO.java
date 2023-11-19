package com.hospital.erp.emergency;

import com.hospital.erp.member.MemberVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EmergencyDAO {

	 //직원리스트 조회 메서드
	 public List<MemberVO> memberList() throws Exception;
	 
	 //직원조회 메서드
	 public MemberVO memberData(MemberVO memberVO) throws Exception;

}
