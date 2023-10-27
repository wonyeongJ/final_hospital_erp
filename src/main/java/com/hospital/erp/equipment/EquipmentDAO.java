package com.hospital.erp.equipment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EquipmentDAO {

	 public List<EquipmentVO> equipmentList() throws Exception; 
	 
}
