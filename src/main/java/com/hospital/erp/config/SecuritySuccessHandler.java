package com.hospital.erp.config;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.hospital.erp.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class SecuritySuccessHandler implements AuthenticationSuccessHandler{
	
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	


	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		log.info("==========authentication : {} ============", authentication);
		log.info("==========pathinfo : {} ============", request.getPathInfo());
		log.info("==========RequestURI : {} ============", request.getRequestURI());
		log.info("==========RequestURL : {} ============", request.getRequestURL());
		
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
	    UserDetails userDetails = (UserDetails)principal;
	    MemberVO memberVO = (MemberVO)userDetails;
	    if(memberVO != null) {
	    	if(memberVO.getMemIspwch()<1) {
	    		new DefaultRedirectStrategy().sendRedirect(request, response, "/member/mypage");
	    		return;
	    	}else {
	    		// 권한에 따라 리디렉션 URL 설정
	    		for (GrantedAuthority authority : authorities) {
	    			if (authority.getAuthority().equals("ROLE_ADMIN")) {
	    				// ADMIN 권한이 있는 경우
	    				new DefaultRedirectStrategy().sendRedirect(request, response, "/member/list");
	    				return;
	    			} else if (authority.getAuthority().equals("ROLE_DOCTOR")) {
	    				// DOCTOR 권한이 있는 경우
	    				new DefaultRedirectStrategy().sendRedirect(request, response, "/schedule/personalList");
	    				return;
	    			} else if (authority.getAuthority().equals("ROLE_NURSE")) {
	    				// NURSE 권한이 있는 경우
	    				new DefaultRedirectStrategy().sendRedirect(request, response, "/patient/list");
	    			}
	    		}
	    	}
	    }

		response.sendRedirect("/");
	}
	
	

}
