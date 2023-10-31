package com.hospital.erp.schedule;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ScheduleDAO {

	List<ScheduleVO> scheduleList(ScheduleVO scheduleVO) throws Exception;

}
