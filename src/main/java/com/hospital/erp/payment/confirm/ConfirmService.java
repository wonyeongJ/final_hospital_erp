package com.hospital.erp.payment.confirm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ConfirmService {

	@Autowired
	private ConfirmDAO confirmDAO;
	
	public int confirmInsert(ConfirmVO confirmVO)throws Exception{
		
		return confirmDAO.confirmInsert(confirmVO);
	}
}
