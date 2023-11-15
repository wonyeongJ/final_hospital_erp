package com.hospital.erp.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hospital.erp.patient.PatientVO;

@Mapper
public interface ReservationDAO {
	
	public int reservationInsert(ReservationVO reservationVO) throws Exception;
	
	public List<ReservationVO> reservationListPatient(PatientVO patientVO) throws Exception;
	
	public List<ReservationVO> reservationList() throws Exception;
	
	public ReservationVO reservationData(ReservationVO reservationVO) throws Exception;
	
	public int reservationUpdate(ReservationVO reservationVO) throws Exception;

}
