package com.hospital.erp.schedule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/schedule/*")
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	@GetMapping("insert") 
	public String scheduleInsert() throws Exception{ 
		   
		return "schedule/insert"; 
	}
	
	@GetMapping("data") 
	public String scheduleData() throws Exception{ 
		   
		return "schedule/data"; 
	}
	
	@GetMapping("personalList") 
	public String schedulePersonalList() throws Exception{ 
		   
		return "schedule/personalList"; 
	}
	
	@GetMapping("teamList") 
	public String scheduleTeamList() throws Exception{ 
		   
		return "schedule/teamList"; 
	}
	
}
