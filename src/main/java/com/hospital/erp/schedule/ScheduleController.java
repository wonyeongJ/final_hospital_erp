package com.hospital.erp.schedule;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/schedule/*")
public class ScheduleController {
	
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
