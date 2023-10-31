package com.hospital.erp.surgery;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SurgeryDAO {

	public List<SurgeryVO> surgeryList() throws Exception;

	public void surgeryUpdate(SurgeryVO surgeryVO) throws Exception;

	public void surgeryDelete(SurgeryVO surgeryVO) throws Exception;

	public void surgeryInsert(SurgeryVO surgeryVO) throws Exception;

	public SurgeryVO surgeryData(SurgeryVO surgeryVO) throws Exception;

}
