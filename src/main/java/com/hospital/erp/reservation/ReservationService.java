package com.hospital.erp.reservation;

import java.util.Date;
import java.util.List;
import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hospital.erp.patient.PatientVO;
import com.hospital.erp.schedule.ScheduleVO;
import com.hospital.erp.util.TimeSetter;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReservationService {
	
	@Autowired
	private ReservationDAO reservationDAO;
	
	@Autowired
	private TimeSetter timeSetter;
	
	// 진료 Insert 메서드
	public int reservationInsert(ReservationVO reservationVO) throws Exception {
		return reservationDAO.reservationInsert(reservationVO);
	}
	
	// 환자의 진료 목록 가져오기
	public List<ReservationVO> reservationListPatient(PatientVO patientVO) throws Exception {
		return reservationDAO.reservationListPatient(patientVO);
	}
	
	// 전체 진료 목록
	public List<ReservationVO> reservationList() throws Exception {
		return reservationDAO.reservationList();
	}
	
	// 진료 수정 data
	public ReservationVO reservationData(ReservationVO reservationVO) throws Exception {
		return reservationDAO.reservationData(reservationVO);
	}
	
	// 진료 수정 메서드
	public int reservationUpdate(ReservationVO reservationVO) throws Exception{
		return reservationDAO.reservationUpdate(reservationVO);
	}

	public void reservationDelete(ReservationVO reservationVO) throws Exception{
		reservationDAO.reservationDelete(reservationVO);
	}

	public void scheduleInsert(ReservationVO reservationVO) throws Exception{
		ScheduleVO scheduleVO = new ScheduleVO();
		String desc = reservationVO.getMemName() + ": " + reservationVO.getResReason();
		scheduleVO.setSchDesc(desc);
		scheduleVO.setMemCd(reservationVO.getResMemCd().toString());		
		String[] dateArray = reservationVO.getResVdate().split("T");
		String dateString = dateArray[0] + " " + dateArray[1];	
		Date date = timeSetter.stringToDate(dateString, "yyyy-MM-dd hh:mm");	
		scheduleVO.setSchSdate(timeSetter.dateTolocalDateTime(date));
		
		reservationDAO.scheduleInsert(scheduleVO);
		
	}
}
