package com.hospital.erp.surgery;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hospital.erp.common.CodeVO;
import com.hospital.erp.schedule.ScheduleService;
import com.hospital.erp.schedule.ScheduleVO;
import com.hospital.erp.util.TimeSetter;

@Controller
@RequestMapping("/surgery/*")
public class SurgeryController {
	
	@Autowired
	private SurgeryService surgeryService;
	
	@Autowired
	private ScheduleService scheduleService;
	
	@Autowired
	private TimeSetter timeSetter;
	
	@GetMapping("list") 
	public String surgeryList(Model model) throws Exception{ 

		List<SurgeryVO> allSurgeries = surgeryService.surgeryList();
		model.addAttribute("allSurgeries", allSurgeries);
		return "surgery/list";
		
	}
	
	@ResponseBody
	@PostMapping("update")
	public String surgeryUpdate(SurgeryVO surgeryVO)throws Exception{
		
		surgeryService.surgeryUpdate(surgeryVO);
		
		String st = "list";
		return st;
		
	}
	
	@ResponseBody
	@PostMapping("delete")
	public String surgeryDelete(SurgeryVO surgeryVO)throws Exception{
		
		surgeryService.surgeryDelete(surgeryVO);
		
		String st = "list";
		return st;
		
	}
	
	@ResponseBody
	@PostMapping("insert")
	public String surgeryInsert(SurgeryVO surgeryVO)throws Exception{
		
		surgeryService.surgeryInsert(surgeryVO);
		
		String st = "list";
		return st;
		
	}
	
	@GetMapping("scheduleInsert") 
	public String surgeryScheduleInsert(SurgeryVO surgeryVO, Model model, ScheduleVO scheduleVO) throws Exception{ 
		
		surgeryVO = surgeryService.surgeryData(surgeryVO);
		model.addAttribute("surgeryVO", surgeryVO);
		
		// view에 보여주기용 데이터 생성
		LocalDate localDate = timeSetter.currentLocalDate();
		LocalDateTime localDateTime = localDate.atStartOfDay();
		String ldt = timeSetter.localDateTimeToString(localDateTime, "yyyy년 MM월 dd일");
		model.addAttribute("ldt", ldt);
		
		LocalDateTime localDateTimeL = localDate.atTime(LocalTime.MAX);//(날짜 + 23:59:59:9999999)
			
		scheduleVO.setSchSdate(localDateTime);
		scheduleVO.setSchEdate(localDateTimeL);
		scheduleVO.setCodeCd(15);
		scheduleVO.setSchFk(surgeryVO.getSurCd());	

		// 해당 날짜에 해당하는 (surgery) schedule을 조회
		List<ScheduleVO> list = scheduleService.scheduleList(scheduleVO);
		
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setStartNum(Integer.parseInt(timeSetter.localDateTimeToString(list.get(i).getSchSdate(), "HHmm"))); 
			list.get(i).setEndNum(Integer.parseInt(timeSetter.localDateTimeToString(list.get(i).getSchEdate(), "HHmm")));	
		};
		
		model.addAttribute("list", list);
		
		return "surgery/scheduleInsert"; 	
	}
	
	@GetMapping("scheduleData") 
	public String surgeryScheduleData() throws Exception{ 
		   
		return "surgery/scheduleData"; 
		
	}
	
	@GetMapping("update") 
	public String surgeryRoomList() throws Exception{ 
		   
		return "surgery/update"; 
		
	}
	
	@GetMapping("scheduleList") 
	public String surgeryScheduleList() throws Exception{ 
		   
		return "surgery/scheduleList"; 
		
	}
	
	@GetMapping("scheduleUpdate") 
	public String surgeryscheduleUpdate() throws Exception{ 
		   
		return "surgery/scheduleUpdate"; 
		
	}
}
