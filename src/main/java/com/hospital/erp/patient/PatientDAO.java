package com.hospital.erp.patient;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PatientDAO {

	public List<PatientVO> patientList() throws Exception;
	
	public int patientInsert(PatientVO patientVO) throws Exception;
	
	public PatientVO patientData(PatientVO patientVO) throws Exception;
	
	public int patientUpdate(PatientVO patientVO) throws Exception;
}
