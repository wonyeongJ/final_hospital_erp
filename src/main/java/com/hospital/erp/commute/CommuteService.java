package com.hospital.erp.commute;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CommuteService {
	
	@Autowired
	private CommuteDAO commuteDAO;
	
	public int commuteInsert(CommuteVO commuteVO) throws Exception {
		int result = commuteDAO.commuteInsert(commuteVO);
		return result;
	}

}
