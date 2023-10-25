package com.hospital.erp.department;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*
 * From 서동휘
 * Department 부서 서비스 클래스
 */
@Service
public class DepartmentService {

	@Autowired
	private DepartmentDAO departmentDAO;
	
	//Department 테이블 List 호출 메서
	public List<DepartmentVO> departmentList() throws Exception {
		return departmentDAO.departmentList();
	}
	
	//Department 테이블 Insert 메서드
	public int departmentInsert(DepartmentVO departmentVO) throws Exception {
		
		return departmentDAO.departmentInsert(departmentVO);
	}
	
}
