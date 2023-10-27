package com.hospital.erp.equipment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hospital.erp.util.TimeSetter;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/equipment/*")
public class EquipmentController {
	
	@Autowired
	private EquipmentService equipmentService;
	
	@GetMapping("data") 
	public String equipmentData() throws Exception{ 
		
		return "equipment/data"; 
	}
	
	@GetMapping("list") 
	public void equipmentList() throws Exception{ 
		EquipmentVO ev = equipmentService.equipmentList();
		System.out.println(ev);
        
		TimeSetter timeSetter = new TimeSetter();
		String st = timeSetter.localDateTimeToString(ev.getEquPdate(), "yyyy년 MM월 dd일 hh시 mm분 ss초");
		
		System.out.println(st);
		
	}
	
	@GetMapping("historyInsert") 
	public String equipmentHistoryInsert() throws Exception{ 
		   
		return "equipment/historyInsert"; 
	}
	
}