package com.hospital.erp.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PaymentService {
	
	@Autowired
	private PaymentDAO paymentDAO;
	
	public int paymentInsert(PaymentVO paymentVO)throws Exception {
		
		return paymentDAO.paymentInsert(paymentVO);
	}

	
}
