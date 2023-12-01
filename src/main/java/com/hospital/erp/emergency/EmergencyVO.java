package com.hospital.erp.emergency;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmergencyVO {
    //기관코드
    private String hpid;

    //응급실
    private String hvec;

    //구급차 가용 여부
    private String hvamyn;

    //병원명
    private String dutyname;

    //응급실 전화
    private String dutytel3;

    //병원 주소
    private String dutyAddr;
}
