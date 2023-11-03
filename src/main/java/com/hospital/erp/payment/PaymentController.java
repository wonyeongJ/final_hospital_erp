package com.hospital.erp.payment;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hospital.erp.member.MemberService;
import com.hospital.erp.member.MemberVO;
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
	
	@Autowired
	private MemberService memberService;
	
	//결재문서 전체보기 -> 인사과만 가능
	@GetMapping("allList")
	public String paymentAllList(Model model)throws Exception{
		
		List<PaymentVO> ar = paymentService.paymentAllList();
		model.addAttribute("list", ar);
		
		return "payment/allList";
	}
	
	//개인별 문서보기 -> 문서상태에 따라서도 보기
	@GetMapping("list")
	public String paymentList(Model model)throws Exception{
		
		//로그인 한 사람 데이터 가져오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
	    UserDetails userDetails = (UserDetails)principal;
	    MemberVO memberVO = (MemberVO)userDetails;
		model.addAttribute("memberVO", memberVO);
		
		List<PaymentVO> ar = paymentService.paymentAllList();
		model.addAttribute("list", ar);
		
		return "payment/list";
	}
	
	//이름은 insert지만 정확히는 문서폼 data
	@GetMapping("insert")
	public String paymentInsert(DocumentFormVO documentFormVO, Model model)throws Exception{
		//문서양식 폼 가져오기
		documentFormVO = documentFormService.documentFormData(documentFormVO);
		model.addAttribute("documentFormVO", documentFormVO);
		
		//로그인 한 사람 데이터 가져오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
	    UserDetails userDetails = (UserDetails)principal;
	    MemberVO memberVO = (MemberVO)userDetails;
		model.addAttribute("memberVO", memberVO);
	    

		return "ajax.payment/insert";
	}
	
	//실제로 결재문서 insert//결재추가(기안상신)
	@PostMapping("insert")
	public String paymentInsert(PaymentVO paymentVO)throws Exception{
		
		int result = paymentService.paymentInsert(paymentVO);
		
		return "redirect:./list";
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
