package com.hospital.erp.schedule;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ScheduleDAO {

	List<ScheduleVO> scheduleList(ScheduleVO scheduleVO) throws Exception;

	List<ScheduleVO> myScheduleList(ScheduleVO scheduleVO) throws Exception;

	void surgeryScheduleDelete(ScheduleVO scheduleVO) throws Exception;

	ScheduleVO surgeryScheduleData(ScheduleVO scheduleVO) throws Exception;

}
