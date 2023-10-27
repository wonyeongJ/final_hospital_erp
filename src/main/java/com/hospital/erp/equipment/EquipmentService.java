package com.hospital.erp.equipment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EquipmentService {

	@Autowired 
	private EquipmentDAO equipmentDAO;

	public EquipmentVO equipmentList() throws Exception {
		EquipmentVO ev = equipmentDAO.equipmentList();
		return ev;
	}
	 
}
