package com.hospital.erp.equipment;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/equipment/*")
public class equipmentController {
	
	@GetMapping("add") 
	public String equipmentAdd() throws Exception{ 
		   
		return "equipment/equipment_add"; 
	}
	
	@GetMapping("categories") 
	public String equipmentCategories() throws Exception{ 
		   
		return "equipment/equipment_categories"; 
	}
	
	@GetMapping("detail") 
	public String equipmentDetail() throws Exception{ 
		   
		return "equipment/equipment_detail"; 
	}
	
	@GetMapping("list") 
	public String equipmentList() throws Exception{ 
		   
		return "equipment/equipment_list"; 
	}
	
	@GetMapping("reservation") 
	public String equipmentReservation() throws Exception{ 
		   
		return "equipment/equipment_reservation"; 
	}
}
