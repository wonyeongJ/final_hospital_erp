package com.hospital.erp.payment;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@GetMapping("formList")
	public String paymentFormList()throws Exception{
		
		return "payment/formList";
	}
	
	@GetMapping("formInsert")
	public String paymentFormAdd()throws Exception{
		
		return "payment/formInsert";
	}
	
	@GetMapping("formTest")
	public String paymentFormTest()throws Exception{
		
		return "payment/formTest";
	}
	
	@PostMapping("formTest")
	public void postPaymentFormTest(@RequestBody Map<String, Object> data)throws Exception{
		log.info("error");
		log.info((String)data.get("check"));
	}
	

}
