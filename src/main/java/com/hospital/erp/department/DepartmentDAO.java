package com.hospital.erp.department;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

/*
 * From 서동휘
 * Department DAO
 */
@Mapper
public interface DepartmentDAO {

	//Department List 호출 메서드
	public List<DepartmentVO> departmentList() throws Exception;
	
	// Department DB Insert 메서드
	public int departmentInsert(DepartmentVO departmentVO) throws Exception;
	
	
}
