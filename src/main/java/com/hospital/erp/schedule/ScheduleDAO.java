package com.hospital.erp.schedule;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hospital.erp.common.CodeVO;
import com.hospital.erp.commute.CommuteVO;
import com.hospital.erp.department.DepartmentVO;
import com.hospital.erp.member.MemberVO;

@Mapper
public interface ScheduleDAO {

	List<ScheduleVO> scheduleList(ScheduleVO scheduleVO) throws Exception;

	List<ScheduleVO> myScheduleList(ScheduleVO scheduleVO) throws Exception;

	void surgeryScheduleDelete(ScheduleVO scheduleVO) throws Exception;

	ScheduleVO surgeryScheduleData(ScheduleVO scheduleVO) throws Exception;

	List<ScheduleVO> personalScheduleList(MemberVO memberVO) throws Exception;

	CodeVO codeData(int codeCd) throws Exception;

	ScheduleVO scheduleData(ScheduleVO scheduleVO) throws Exception;

	void personalScheduleInsert(ScheduleVO scheduleVO) throws Exception;

	void personalScheduleDelete(ScheduleVO scheduleVO) throws Exception;

	List<DepartmentVO> departmentList() throws Exception;

	List<MemberVO> memberList(int depCd) throws Exception;

	List<MemberVO> memberList2() throws Exception;

	List<ScheduleVO> teamScheduleList(ScheduleVO scheduleVO) throws Exception;

	DepartmentVO departmentData(int depCd) throws Exception;

	List<ScheduleVO> personalScheduleCheck(ScheduleVO scheduleVO) throws Exception;

	void commuteInsert(ScheduleVO scheduleVO) throws Exception;

}
