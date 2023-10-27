package com.hospital.erp.equipment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String equipmentList(Model model) throws Exception{ 
		List<EquipmentVO> allEquipments = equipmentService.equipmentList();
		System.out.println(allEquipments);
		model.addAttribute("allEquipments", allEquipments);
		
		return "equipment/list";
	}
	
	@GetMapping("historyInsert") 
	public String equipmentHistoryInsert() throws Exception{ 
		   
		return "equipment/historyInsert"; 
	}
	
}