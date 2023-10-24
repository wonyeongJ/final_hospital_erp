package com.hospital.erp.schedule;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/schedule/*")
public class ScheduleController {
	
	@GetMapping("add") 
	public String scheduleAdd() throws Exception{ 
		   
		return "schedule/schedule_add"; 
	}
	
	@GetMapping("detail") 
	public String scheduleDetail() throws Exception{ 
		   
		return "schedule/schedule_detail"; 
	}
	
	@GetMapping("personal") 
	public String schedulePersonal() throws Exception{ 
		   
		return "schedule/schedule_personal"; 
	}
	
	@GetMapping("team") 
	public String scheduleTeal() throws Exception{ 
		   
		return "schedule/schedule_team"; 
	}
	
	@GetMapping("update") 
	public String scheduleUpdate() throws Exception{ 
		   
		return "schedule/schedule_update"; 
	}
	
}
