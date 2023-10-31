package com.hospital.erp.member;

import java.sql.Date;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
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
	private String codeName; // memberListJoin 
	
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
		// TODO Auto-generated method stub
		return null;
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
