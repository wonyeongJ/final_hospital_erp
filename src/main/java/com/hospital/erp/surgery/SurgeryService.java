package com.hospital.erp.surgery;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SurgeryService {
	
	@Autowired
	private SurgeryDAO surgeryDAO;

	public List<SurgeryVO> surgeryList() throws Exception {
		List<SurgeryVO> allSurgeries =  surgeryDAO.surgeryList();
		return allSurgeries;
	}

	public void surgeryUpdate(SurgeryVO surgeryVO) throws Exception {
		surgeryDAO.surgeryUpdate(surgeryVO);
	}

	public void surgeryDelete(SurgeryVO surgeryVO) throws Exception {
		surgeryDAO.surgeryDelete(surgeryVO);
	}

	public void surgeryInsert(SurgeryVO surgeryVO) throws Exception {
		surgeryDAO.surgeryInsert(surgeryVO);
	}

	public SurgeryVO surgeryData(SurgeryVO surgeryVO) throws Exception {
		surgeryVO = surgeryDAO.surgeryData(surgeryVO);
		return surgeryVO;
	}
	
}
