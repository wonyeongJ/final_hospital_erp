package com.hospital.erp.payment.confirm;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ConfirmDAO {

	public int confirmInsert(ConfirmVO confirmVO)throws Exception;
}
