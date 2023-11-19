package com.hospital.erp.payment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hospital.erp.member.MemberVO;

@Mapper
public interface PaymentDAO {
	
	//결재추가(기안상신)
	public int paymentInsert(PaymentVO paymentVO)throws Exception;
	
	//문서전체보기
	public List<PaymentVO> paymentAllList1(MemberVO memberVO) throws Exception;
	
	//로그인 한 사람의 문서 리스트
	public List<PaymentVO> paymentList1(MemberVO memberVO) throws Exception;
	//로그인 한 사람의 문서 리스트
	public List<PaymentVO> paymentList2(MemberVO memberVO) throws Exception;
	//로그인 한 사람의 문서 리스트
	public List<PaymentVO> paymentList3(MemberVO memberVO) throws Exception;
	//로그인 한 사람의 문서 리스트
	public List<PaymentVO> paymentList4(MemberVO memberVO) throws Exception;
	//로그인 한 사람의 문서 리스트
	public List<PaymentVO> paymentList5(MemberVO memberVO) throws Exception;
	//로그인 한 사람의 문서 리스트
	public List<PaymentVO> paymentList6(MemberVO memberVO) throws Exception;
	
	//문서보기 data
	public PaymentVO paymentData(PaymentVO paymentVO) throws Exception;
	
	//문서상태 update
	public int paymentUpdate(PaymentVO paymentVO)throws Exception;

	
	

}
