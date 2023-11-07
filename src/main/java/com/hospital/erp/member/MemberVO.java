package com.hospital.erp.member;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

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
	@NotNull
	private Integer jobCd;
	private Integer depCd;
	private Integer posCd;
	@NotNull
	private Integer codeCd;
	@Pattern(regexp = "^[가-힣]*$", message = "이름은 한글만 입력 가능합니다.")
	private String memName;
	@Pattern(regexp = "^\\d{6}-(1|2|3|4)\\d{6}$", message = "주민등록번호 형식이 올바르지 않습니다.")
	private String memRnum;
	private String memPw;
	@Pattern(regexp = "^01[0-9]-\\d{4}-\\d{4}$", message = "휴대폰 번호 형식이 올바르지 않습니다.")
	private String memPnum;
	private String memAddress;
	@Pattern(regexp = "^[A-Za-z0-9+_.-]+@(.+)$", message = "올바른 이메일 형식이 아닙니다.")
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
