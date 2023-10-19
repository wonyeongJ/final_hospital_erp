package com.hospital.erp.config;

import java.io.IOException;
import java.net.URLEncoder;

import javax.security.auth.login.AccountLockedException;
import javax.security.auth.login.CredentialExpiredException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class SecurityFailHandler implements AuthenticationFailureHandler{
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// TODO Auto-generated method stub
		log.info("========= Exception : {} =======", exception);
		
		String message = "로그인 실패";
		
		if(exception instanceof InternalAuthenticationServiceException) {
			message="Id가 없다";
		}
		
		if(exception instanceof BadCredentialsException) {
			message="비번이 틀렸다";
		}
		
		if(exception instanceof AccountExpiredException) {
			message="계정 유효기간 만료, 관리자에게 문의";
		}
		
		if(exception instanceof LockedException) {
			message="계정이 잠김, 관리자에게 문의";  //5회이상 틀리면?
		}
		
		if(exception instanceof CredentialsExpiredException) {
			message="비밀번호 유효기간 완료, 변경요청";
		}
		
		if(exception instanceof DisabledException) {
			message="휴먼계정";   //접속 1년지나면?
		}
		
		
		message = URLEncoder.encode(message, "UTF-8");
		response.sendRedirect("/member/login?message=" + message);
		
		
		
		
		
	}

	
}
