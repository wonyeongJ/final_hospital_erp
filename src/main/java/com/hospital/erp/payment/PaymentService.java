package com.hospital.erp.payment;

import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hospital.erp.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PaymentService {
	
	@Autowired
	private PaymentDAO paymentDAO;
	
	//결재추가(기안상신)
	public int paymentInsert(PaymentVO paymentVO)throws Exception {
		
		return paymentDAO.paymentInsert(paymentVO);
	}
	
	//문서전체보기
	public List<PaymentVO> paymentAllList1(MemberVO memberVO) throws Exception{
		List<PaymentVO> paymentAr = paymentDAO.paymentAllList1(memberVO);
		for(PaymentVO paymentVO : paymentAr) {
			  
			paymentVO.setEpRDate(paymentVO.getEpRDate().substring(0,10));
					  
			}
		return paymentAr;
	}
	
	//로그인 한 사람의 전재결재문서
	public List<PaymentVO> paymentList1(MemberVO memberVO) throws Exception{
		List<PaymentVO> paymentAr = paymentDAO.paymentList1(memberVO);
		for(PaymentVO paymentVO : paymentAr) {
			  
			paymentVO.setEpRDate(paymentVO.getEpRDate().substring(0,10));
					  
			}
		return paymentAr;
	}
	//로그인 한 사람의 승인대기문서
	public List<PaymentVO> paymentList2(MemberVO memberVO) throws Exception{
		List<PaymentVO> paymentAr = paymentDAO.paymentList2(memberVO);
		System.out.println("========list2 service======");
		for(PaymentVO paymentVO : paymentAr) {
			  
			paymentVO.setEpRDate(paymentVO.getEpRDate().substring(0,10));
					  
			}
		return paymentAr;
	}
	//로그인 한 사람의 결재수신문서
	public List<PaymentVO> paymentList3(MemberVO memberVO) throws Exception{
		List<PaymentVO> paymentAr = paymentDAO.paymentList3(memberVO);
		for(PaymentVO paymentVO : paymentAr) {
			  
			paymentVO.setEpRDate(paymentVO.getEpRDate().substring(0,10));
					  
			}
		return paymentAr;
	}
	//로그인 한 사람의 참조문서
	public List<PaymentVO> paymentList4(MemberVO memberVO) throws Exception{
		List<PaymentVO> paymentAr = paymentDAO.paymentList4(memberVO);
		for(PaymentVO paymentVO : paymentAr) {
			  
			paymentVO.setEpRDate(paymentVO.getEpRDate().substring(0,10));
					  
			}
		return paymentAr;
	}
	//로그인 한 사람의 기안문서
	public List<PaymentVO> paymentList5(MemberVO memberVO) throws Exception{
		List<PaymentVO> paymentAr = paymentDAO.paymentList5(memberVO);
		for(PaymentVO paymentVO : paymentAr) {
			  
			paymentVO.setEpRDate(paymentVO.getEpRDate().substring(0,10));
					  
			}
		return paymentAr;
	}
	//로그인 한 사람의 임시저장
	public List<PaymentVO> paymentList6(MemberVO memberVO) throws Exception{
		List<PaymentVO> paymentAr = paymentDAO.paymentList6(memberVO);
		for(PaymentVO paymentVO : paymentAr) {
			  
			paymentVO.setEpRDate(paymentVO.getEpRDate().substring(0,10));
					  
			}
		return paymentAr;
	}
	

	//문서보기 data
	public PaymentVO paymentData(PaymentVO paymentVO) throws Exception{
		paymentVO = paymentDAO.paymentData(paymentVO);
		
		if (paymentVO.getEpEDate() != null) {
			paymentVO.setEpEDate(paymentVO.getEpEDate().substring(0,10));
		}
		if (paymentVO.getEpSDate() != null) {
			paymentVO.setEpSDate(paymentVO.getEpSDate().substring(0,10));
		}
		//DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		//String test = paymentVO.getEpRDate().format(dateTimeFormatter);
		paymentVO.setEpRDate(paymentVO.getEpRDate().substring(0,10));
		
		return paymentVO;
	}
	
	//문서상태 update
	public int paymentUpdate(PaymentVO paymentVO)throws Exception{

		
		return paymentDAO.paymentUpdate(paymentVO);
	}
	
	
}
