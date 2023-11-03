package com.hospital.erp.payment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentDAO {
	
	//결재추가(기안상신)
	public int paymentInsert(PaymentVO paymentVO)throws Exception;
	
	//문서전체보기
	public List<PaymentVO> paymentAllList() throws Exception;
	
	//로그인 한 사람의 문서 리스트
	public List<PaymentVO> paymentList() throws Exception;
}
