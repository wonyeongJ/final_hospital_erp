package com.hospital.erp.payment;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/payment/*")
public class PaymentController {
	
	@GetMapping("allList")
	public String paymentAllList()throws Exception{
		
		return "payment/allList";
	}
	
	@GetMapping("list")
	public String paymentList()throws Exception{
		
		return "payment/list";
	}
	
	@GetMapping("insert")
	public String paymentInsert()throws Exception{
		
		return "payment/insert";
	}
	
	@GetMapping("formInsert")
	public String paymentFormAdd()throws Exception{
		
		return "payment/formInsert";
	}
	
	@GetMapping("formList")
	public String paymentFormList()throws Exception{
		
		return "payment/formList";
	}
	

}
