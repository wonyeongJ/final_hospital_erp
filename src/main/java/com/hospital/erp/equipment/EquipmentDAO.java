package com.hospital.erp.equipment;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EquipmentDAO {

	 public EquipmentVO equipmentList() throws Exception; 
	 
}
