package com.hospital.erp.equipment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EquipmentService {

	@Autowired 
	private EquipmentDAO equipmentDAO;

	public List<EquipmentVO> equipmentList() throws Exception {
		List<EquipmentVO> allEquipments = equipmentDAO.equipmentList();
		return allEquipments;
	}
	 
}
