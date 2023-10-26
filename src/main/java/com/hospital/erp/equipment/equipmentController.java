package com.hospital.erp.equipment;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/equipment/*")
public class EquipmentController {
	
	@GetMapping("data") 
	public String equipmentData() throws Exception{ 
		   
		return "equipment/data"; 
	}
	
	@GetMapping("list") 
	public String equipmentList() throws Exception{ 
		   
		return "equipment/list"; 
	}
	
	@GetMapping("historyInsert") 
	public String equipmentHistoryInsert() throws Exception{ 
		   
		return "equipment/historyInsert"; 
	}
}
