package com.hospital.erp.payment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PaymentService {
	
	@Autowired
	private PaymentDAO paymentDAO;
	
	//결재추가(기안상신)
	public int paymentInsert(PaymentVO paymentVO)throws Exception {
		
		return paymentDAO.paymentInsert(paymentVO);
	}
	
	//문서전체보기
	public List<PaymentVO> paymentAllList() throws Exception{
		
		return paymentDAO.paymentAllList();
	}
	
	//로그인 한 사람의 문서 리스트
	public List<PaymentVO> paymentList() throws Exception{
		
		return paymentDAO.paymentList();
	}

	
}
