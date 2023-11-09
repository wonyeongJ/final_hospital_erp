package com.hospital.erp.schedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hospital.erp.common.CodeVO;
import com.hospital.erp.department.DepartmentVO;
import com.hospital.erp.member.MemberVO;

@Service
public class ScheduleService {
	
	@Autowired
	private ScheduleDAO scheduleDAO;


	public List<ScheduleVO> scheduleList(ScheduleVO scheduleVO) throws Exception {
		List<ScheduleVO> list = scheduleDAO.scheduleList(scheduleVO);
		return list;
	}

	public List<ScheduleVO> myScheduleList(ScheduleVO scheduleVO) throws Exception {
		List<ScheduleVO> list = scheduleDAO.myScheduleList(scheduleVO);
		return list;
	}

	public void surgeryScheduleDelete(ScheduleVO scheduleVO) throws Exception {
		scheduleDAO.surgeryScheduleDelete(scheduleVO);
	}

	public ScheduleVO surgeryScheduleData(ScheduleVO scheduleVO) throws Exception {
		scheduleVO = scheduleDAO.surgeryScheduleData(scheduleVO);
		return scheduleVO;
	}

	public List<ScheduleVO> personalScheduleList(MemberVO memberVO) throws Exception {
		List<ScheduleVO> list = scheduleDAO.personalScheduleList(memberVO);
		return list;
	}

	public CodeVO codeData(int codeCd) throws Exception {
		CodeVO codeVO = scheduleDAO.codeData(codeCd);
		return codeVO;
	}

	public ScheduleVO scheduleData(ScheduleVO scheduleVO) throws Exception {
		scheduleVO = scheduleDAO.scheduleData(scheduleVO);
		return scheduleVO;
	}

	public void personalScheduleInsert(ScheduleVO scheduleVO) throws Exception {
		scheduleDAO.personalScheduleInsert(scheduleVO);
	}

	public void personalScheduleDelete(ScheduleVO scheduleVO) throws Exception {
		scheduleDAO.personalScheduleDelete(scheduleVO);
		
	}

	public List<DepartmentVO> departmentList() throws Exception {
		List<DepartmentVO> departmentVOList = scheduleDAO.departmentList();
		return departmentVOList;
	}

	public List<MemberVO> memberList(int depCd) throws Exception {
		List<MemberVO> memberVOList = scheduleDAO.memberList(depCd);
		return memberVOList;
	}

	public List<MemberVO> memberList2() throws Exception {
		List<MemberVO> memberVOList = scheduleDAO.memberList2();
		return memberVOList;
	}

	public List<ScheduleVO> teamScheduleList(ScheduleVO scheduleVO) throws Exception {
		List<ScheduleVO> scheduleVOList = scheduleDAO.teamScheduleList(scheduleVO);
		return scheduleVOList;
	}

	public DepartmentVO departmentData(int depCd) throws Exception {
		DepartmentVO departmentVO = scheduleDAO.departmentData(depCd);
		return departmentVO;
	}
	
}
