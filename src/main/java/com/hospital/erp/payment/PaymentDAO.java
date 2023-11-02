package com.hospital.erp.payment;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentDAO {

	public int paymentInsert(PaymentVO paymentVO)throws Exception;
}
