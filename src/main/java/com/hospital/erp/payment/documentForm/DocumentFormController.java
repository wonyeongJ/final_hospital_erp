package com.hospital.erp.payment.documentForm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
		List<DocumentFormVO> ar = documentFormService.documentFormList();
		model.addAttribute("list", ar);
		return "payment/formList";
	}
	
	@GetMapping("insert")
	public String documentFormInsert()throws Exception{
		
		
		return "payment/formInsert";
	}
	
	@PostMapping("insert")
	public String documentFormInsert(DocumentFormVO documentFormVO)throws Exception{
		
		int result = documentFormService.documentFormInsert(documentFormVO);
		
		return "redirect:./list";
	}
	
	/*
	 * @GetMapping("data") 
	 * public String documentFormData(Model model,DocumentFormVO documentFormVO)throws Exception{
	 * 	documentFormService.documentFormData(documentFormVO);
	 * 	model.addAttribute("documentFormVO", documentFormVO); 
	 * 	return "payment/formData"; 
	 * }
	 */
	
}
