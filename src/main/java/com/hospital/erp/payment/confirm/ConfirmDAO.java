package com.hospital.erp.payment.confirm;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hospital.erp.payment.PaymentVO;

@Mapper
public interface ConfirmDAO {

	//문서 상신 시 기안자 insert
	public int cofirmMemInsert(ConfirmVO confirmVO)throws Exception;
	
	//문서 상신 시 결재자 insert
	public int confirmInsert(ConfirmVO confirmVO)throws Exception;
	
	//해당문서의 결재자정보 리스트
	public List<ConfirmVO> confirmList(ConfirmVO confirmVO) throws Exception;
	
	//결재시 결재상태 update
	public int confirmUpdate(ConfirmVO confirmVO) throws Exception;
	
}
