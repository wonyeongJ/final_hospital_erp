package com.hospital.erp.payment;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hospital.erp.payment.documentForm.DocumentFormService;
import com.hospital.erp.payment.documentForm.DocumentFormVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/payment/*")
public class PaymentController {
	
	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private DocumentFormService documentFormService;
	
	@GetMapping("allList")
	public String paymentAllList()throws Exception{
		
		return "payment/allList";
	}
	
	@GetMapping("list")
	public String paymentList()throws Exception{
		
		return "payment/list";
	}
	
	@GetMapping("insert")
	public String paymentInsert(HttpSession session, DocumentFormVO documentFormVO, Model model)throws Exception{
		documentFormVO = documentFormService.documentFormData(documentFormVO);
		model.addAttribute("documentFormVO", documentFormVO);
		return "ajax.payment/insert";
	}
	
	@PostMapping("insert")
	public String paymentInsert(PaymentVO paymentVO)throws Exception{
		
		int result = paymentService.paymentInsert(paymentVO);
		
		return "";
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
