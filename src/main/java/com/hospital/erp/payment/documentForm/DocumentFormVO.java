package com.hospital.erp.payment.documentForm;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Getter
@Setter
@Slf4j
public class DocumentFormVO {

	private Integer dfCd;
	private String dfKind;
	private String dfVTab;
	private String dfOTab;
	private String dfDTab;
	private String dfPTab;
	private String dfLTab;
	private String dfIn1Tab;
	private String dfIn2Tab;
	private String dfIn3Tab;
	private String dfContents;
	
}
