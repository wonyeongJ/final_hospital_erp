package com.hospital.erp.member;

import javax.validation.Valid;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.validation.annotation.Validated;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PasswordVO {
	
	@Size(min = 8, max = 16, message = "비밀번호는 8자에서 16자 사이어야 합니다.")
	@Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,16}$", message = "비밀번호는 영어, 특수문자 조합이어야 하며 8자에서 16자 사이어야 합니다.")
	private String newPassword;
	
	private String newPasswordConfirm;
	
	
	

}
