package com.hospital.erp.commute;

import org.apache.ibatis.annotations.Mapper;

/*
 * CommuteDAO
 * From 서동휘
 * 
 */

@Mapper
public interface CommuteDAO {

	//출근 인서트 
	public int commuteInsert(CommuteVO commuteVO) throws Exception;
	
	public CommuteVO commuteData(CommuteVO commuteVO) throws Exception;
	
	public int commuteUpdate(CommuteVO commuteVO) throws Exception;
	
	// 스케쥴러 자동실행 메서드 퇴근 안찍은 직원들 수정 메서드
	public int commuteUpdateScheduler() throws Exception;
	
}
