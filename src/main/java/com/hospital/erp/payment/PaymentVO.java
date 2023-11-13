package com.hospital.erp.payment;


import java.time.LocalDateTime;
import java.util.List;

import com.hospital.erp.department.DepartmentVO;
import com.hospital.erp.member.MemberVO;
import com.hospital.erp.payment.confirm.ConfirmVO;
import com.hospital.erp.payment.documentForm.DocumentFormVO;
import com.hospital.erp.payment.reference.ReferenceVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Getter
@Setter
@ToString
public class PaymentVO {
	
	private DocumentFormVO documentFormVOs;
	private MemberVO memberVOs;
	private List<ConfirmVO> confirmVOs;
	private List<ReferenceVO> referenceVOs;
	private DepartmentVO departmentVOs;
	
	private Integer epCd;
	private String memCd;
	private Integer dfCd;
	private String epTitle;
	private String epVType;
	private String epOType;
	private String epSDate;
	private String epEDate;
	private Integer epDays;
	private Integer epPrice;
	private String epLocation;
	private String epInput1;
	private String epInput2;
	private String epInput3;
	private String epReason;
	private String epContents;
	private String epDStatus;
	private LocalDateTime epFDate;
	private LocalDateTime epRDate;
	
	//JOIN해서 가져오는 DATA
	private String dfKind;
	private Integer conStep;
	private String conPStatus;
	private String memName;
	private String conmemName;
	private String refmemName;
	
	

}
