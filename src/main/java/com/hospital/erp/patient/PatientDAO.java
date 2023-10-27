package com.hospital.erp.patient;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PatientDAO {

	public List<PatientVO> patientList() throws Exception;
	
	public int patientInsert(PatientVO patientVO) throws Exception;
}
