package com.hospital.erp.commute;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommuteDAO {

	public int commuteInsert(CommuteVO commuteVO) throws Exception;
	
	public CommuteVO commuteData(CommuteVO commuteVO) throws Exception;
	
	public int commuteUpdate(CommuteVO commuteVO) throws Exception;
	
}
