package com.hospital.erp.member;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hospital.erp.department.DepartmentVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO implements UserDetails {
	
	private String memCd;
	private Integer jobCd;
	private Integer depCd;
	private Integer posCd;
	private Integer codeCd;
	private String memName;
	private String memRnum;
	private String memPw;
	private String memPnum;
	private String memAddress;
	private String memEmail;
	private Date memHdate;
	private Integer memSalary;
	private Integer memAnnual;
	private Date memQdate;
	private Integer memDelete;
	private Date memRdate;
	
	private String depName; // memberListJoin 
	private String codeName; // memberListJoin 성별 
	private String jobName; //meberLoginJoin 직무
	private String posName; // meberLoginJoin 직책
	
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return memCd;
	}
	
	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return memPw;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<>();
		if (this.jobCd != null) {
			if(this.jobCd == 3) {
				authorities.add(new SimpleGrantedAuthority("ROLE_DOCTOR"));
			}else if(this.jobCd == 4) {
				authorities.add(new SimpleGrantedAuthority("ROLE_NURSE"));
			}else if(this.jobCd == 5) {
				authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
			}

		}
				
		return authorities;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
}
