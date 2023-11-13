package com.hospital.erp;

import javax.mail.internet.MimeMessage;

import org.junit.jupiter.api.Test;
import org.junit.platform.commons.annotation.Testable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;


public class MailTest {
	
	@Autowired
	JavaMailSender mailSender;
	
	@Value("${spring.mail.username}")
	String sendFrom;
		
	@Autowired 
	Environment env;
	
	@Test
	public boolean sendMail(){
		
		String sendTo = "akrhkdx@naver.com";
		String mailTitle = "mail테스트";
		String mailContent = "mailcontent 테스트";
			
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
				
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper message = new MimeMessageHelper(mimeMessage,true,"UTF-8");

				message.setTo(sendTo);
				message.setFrom(sendFrom);	//env.getProperty("spring.mail.username")
				message.setSubject(mailTitle);
				message.setText(mailContent, true); //ture : html 형식 사용
				
					
//				//Mail에 img 삽입
//				ClassPathResource resource = new ClassPathResource("img 주소/img 이름.png");
//				message.addInline("img", resource.getFile());
			}
		};
			
		try{
			mailSender.send(preparator);
		} catch (MailException e){
			return false;
		}
		return true;
	    
	}
}
