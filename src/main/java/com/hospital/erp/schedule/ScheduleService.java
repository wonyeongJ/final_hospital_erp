package com.hospital.erp.schedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScheduleService {
	
	@Autowired
	private ScheduleDAO surgeryDAO;

	public List<ScheduleVO> scheduleList(ScheduleVO scheduleVO) throws Exception {
		List<ScheduleVO> list = surgeryDAO.scheduleList(scheduleVO);
		return list;
	}
	
}
