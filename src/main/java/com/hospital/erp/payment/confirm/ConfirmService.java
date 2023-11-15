package com.hospital.erp.payment.confirm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hospital.erp.payment.PaymentVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ConfirmService {

	@Autowired
	private ConfirmDAO confirmDAO;
	
	public int confirmInsert(PaymentVO confirmVO, String [] conMemCd, String [] conMemName, String [] conStep)throws Exception{
		int result=0;
		for(int i=0;i<conMemCd.length;i++) {
			ConfirmVO c = new ConfirmVO();
			c.setMemCd(conMemCd[i]);
			c.setMemName(conMemName[i]);
			c.setConStep(Integer.parseInt(conStep[i]));
			c.setEpCd(confirmVO.getEpCd());
			result=confirmDAO.confirmInsert(c);
		}
		
		return result;
	}
	
	public List<ConfirmVO> confirmList(ConfirmVO confirmVO) throws Exception{
		
		return confirmDAO.confirmList(confirmVO);
	}
}
