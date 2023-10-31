package com.hospital.erp.payment.documentForm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/payment/documentForm/*")
@Slf4j
public class DocumentFormController {
	
	@Autowired
	private DocumentFormService documentFormService;

	@GetMapping("list")
	public String documentFormList(Model model)throws Exception{
		List<DocumentFormVO> ar = documentFormService.documentFormormList();
		model.addAttribute("list", ar);
		return "payment/formList";
	}
}
