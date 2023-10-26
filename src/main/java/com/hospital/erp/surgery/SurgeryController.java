package com.hospital.erp.surgery;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/surgery/*")
public class SurgeryController {
	
	@GetMapping("list") 
	public String surgeryList() throws Exception{ 
		   
		return "surgery/list"; 
	}
	
	@GetMapping("scheduleData") 
	public String surgeryScheduleData() throws Exception{ 
		   
		return "surgery/scheduleData"; 
	}
	
	@GetMapping("scheduleInsert") 
	public String surgeryScheduleInsert() throws Exception{ 
		   
		return "surgery/scheduleInsert"; 
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
