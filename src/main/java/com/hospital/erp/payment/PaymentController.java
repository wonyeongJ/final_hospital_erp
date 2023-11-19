package com.hospital.erp.payment;

import java.time.LocalDateTime;
import java.util.Date;
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

import com.hospital.erp.department.DepartmentService;
import com.hospital.erp.department.DepartmentVO;
import com.hospital.erp.member.MemberService;
import com.hospital.erp.member.MemberVO;
import com.hospital.erp.payment.confirm.ConfirmService;
import com.hospital.erp.payment.confirm.ConfirmVO;
import com.hospital.erp.payment.documentForm.DocumentFormService;
import com.hospital.erp.payment.documentForm.DocumentFormVO;
import com.hospital.erp.payment.reference.ReferenceService;
import com.hospital.erp.util.TimeSetter;

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
	private ConfirmService confirmService;
	
	@Autowired
	private ReferenceService referenceService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private DepartmentService departmentService;
	
	@Autowired
	private TimeSetter timeSetter;
	
	//결재문서 전체보기 -> 인사과만 가능
	@GetMapping("allList")
	public String paymentAllList(Model model)throws Exception{
		
		List<PaymentVO> ar = paymentService.paymentAllList1();
		model.addAttribute("list", ar);
		
		return "payment/allList";
	}
	
	//개인별 문서보기 -> 문서상태에 따라서도 보기
	@GetMapping("list")
	public String paymentList(Model model)throws Exception{
		

		
		return "payment/list";
	}
	
	//문서리스트 ajax
	@GetMapping("listResult")
	public String paymentListResult(Model model, String dfCodeResult)throws Exception{
		
		//로그인 한 사람 데이터 가져오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
	    UserDetails userDetails = (UserDetails)principal;
	    MemberVO memberVO = (MemberVO)userDetails;
		model.addAttribute("memberVO", memberVO);
		
		if("listResult1".equals(dfCodeResult)) {
			List<PaymentVO> ar = paymentService.paymentList1(memberVO);
			model.addAttribute("list", ar);
			log.info("==============departmentAr={} ===========", ar);
			log.info("==============departmentAr={} ===========", memberVO);
		}else if("listResult2".equals(dfCodeResult)){
			List<PaymentVO> ar = paymentService.paymentList2(memberVO);
			model.addAttribute("list", ar);
			log.info("==============departmentAr={} ===========", ar);
			log.info("==============departmentAr={} ===========", memberVO);
		}else if("listResult3".equals(dfCodeResult)){
			List<PaymentVO> ar = paymentService.paymentList3(memberVO);
			model.addAttribute("list", ar);
		}else if("listResult4".equals(dfCodeResult)){
			List<PaymentVO> ar = paymentService.paymentList4(memberVO);
			model.addAttribute("list", ar);
		}else if("listResult5".equals(dfCodeResult)){
			List<PaymentVO> ar = paymentService.paymentList5(memberVO);
			model.addAttribute("list", ar);
		}else if("listResult6".equals(dfCodeResult)){
			List<PaymentVO> ar = paymentService.paymentList6(memberVO);
			model.addAttribute("list", ar);
		}

		
		return "ajax.payment/listResult";
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
		
		//결재선지정에 필요한 부서, 사람 정보
		List<DepartmentVO> departmentAr = departmentService.departmentList();
		model.addAttribute("departmentList", departmentAr);
		log.info("==============departmentAr={} ===========", departmentAr);
		
		List<MemberVO> memberAr = memberService.memberListChart();
		model.addAttribute("memberList", memberAr);
	    

		return "ajax.payment/insert";
	}
	
	//실제로 결재문서 insert//결재추가(기안상신)
	@PostMapping("insert")
	public String paymentInsert(PaymentVO paymentVO, String [] conMemCd, String [] conMemName, String [] conStep, String [] refMemCd, String [] refMemName)throws Exception{
		
		 int result = paymentService.paymentInsert(paymentVO); 
		 int conMemResult = confirmService.cofirmMemInsert(paymentVO);
		 int conResult = confirmService.confirmInsert(paymentVO, conMemCd, conMemName, conStep);
		 if(refMemCd != null) {			 
			 int refResult = referenceService.referenceInsert(paymentVO, refMemCd, refMemName);
		 }
		
		return "redirect:./list";
	}
	
	//문서보기 data
	@GetMapping("data")
	public String paymentData(PaymentVO paymentVO,ConfirmVO confirmVO, Model model) throws Exception{
		paymentVO = paymentService.paymentData(paymentVO);
		model.addAttribute("paymentVO", paymentVO);
		
		List<ConfirmVO> conAr = confirmService.confirmList(confirmVO);
		model.addAttribute("conList", conAr);
		
		log.info("=======paymentVO : {}========",paymentVO);
		
		List<MemberVO> memberAllList = memberService.memberList();
		model.addAttribute("memberAllList", memberAllList);
		
		//로그인 한 사람 데이터 가져오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
	    UserDetails userDetails = (UserDetails)principal;
	    MemberVO memberVO = (MemberVO)userDetails;
		model.addAttribute("memberVO", memberVO);
		
		return "payment/data";
	}
	
	@PostMapping("data")
	public String paymentData(ConfirmVO confirmVO, PaymentVO paymentVO, MemberVO memberVO)throws Exception{
		
		//결재한 사람의 결재상태 update
		//1은 반려 2는 승인
		if("1".equals(confirmVO.getConPStatus())) {
			int conResult = confirmService.confirmUpdate(confirmVO);
			
			//문서상태 update (최종 결재 완료 시 종결처리)
			int paymenRresult = paymentService.paymentUpdate(paymentVO);
		}else if("2".equals(confirmVO.getConPStatus())){
			if(confirmVO.getConStep()==4) {
				int conResult = confirmService.confirmUpdate(confirmVO);
				
				//문서상태 update (최종 결재 완료 시 종결처리)
				int paymenResult = paymentService.paymentUpdate(paymentVO);
				
				//휴가계일 경우 연차 감소
				int annualResult = memberService.memberAnnualUpdate(memberVO);
			}else {
				int conResult = confirmService.confirmUpdate(confirmVO);
			}
		}
		
		
		
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
