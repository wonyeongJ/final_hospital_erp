package com.hospital.erp.payment.documentForm;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DocumentFormDAO {

	public List<DocumentFormVO> documentFormList()throws Exception;
	
	public int documentFormInsert(DocumentFormVO documentFormVO)throws Exception;
	
	public DocumentFormVO documentFormData(DocumentFormVO documentFormVO)throws Exception;
	
	public int documentFormDelete(DocumentFormVO documentFormVO)throws Exception;
}
