package com.hospital.erp.payment.confirm;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hospital.erp.payment.PaymentVO;

@Mapper
public interface ConfirmDAO {

	public int confirmInsert(ConfirmVO confirmVO)throws Exception;
	
	//해당문서의 결재자정보 리스트
	public List<ConfirmVO> confirmList(ConfirmVO confirmVO) throws Exception;
}
