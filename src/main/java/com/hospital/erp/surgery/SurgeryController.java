package com.hospital.erp.surgery;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/surgery/*")
public class SurgeryController {
	
	@GetMapping("list") 
	public String surgeryList() throws Exception{ 
		   
		return "surgery/surgery_list"; 
	}
	
	@GetMapping("addRoom") 
	public String surgeryAddRoom() throws Exception{ 
		   
		return "surgery/surgery_addRoom"; 
	}
	
	@GetMapping("reservation") 
	public String surgeryReservation() throws Exception{ 
		   
		return "surgery/surgery_reservation"; 
	}
	
	@GetMapping("roomList") 
	public String surgeryRoomList() throws Exception{ 
		   
		return "surgery/surgery_roomList"; 
	}
	
}
