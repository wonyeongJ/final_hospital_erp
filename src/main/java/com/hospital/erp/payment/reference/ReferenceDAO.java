package com.hospital.erp.payment.reference;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hospital.erp.payment.PaymentVO;

@Mapper
public interface ReferenceDAO {
	
	//참조자 추가
	public int referenceInsert(ReferenceVO referenceVO)throws Exception;
	
	//해당문서의 참조자 보기
	public List<ReferenceVO> referenceList(PaymentVO paymentVO)throws Exception;
}
