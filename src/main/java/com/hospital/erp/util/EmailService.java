package com.hospital.erp.util;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmailService {
	// 위에 requiredArgsConstructor 덕분에 autowired 어노테이션 없이 의존성 주입이 가능하다 
	private final JavaMailSender javaMailSender;
	
	@Value("${spring.mail.username}")
	private String senderEmail;
	private String temporaryPassword;
	
	
	// 랜덤 비밀번호 생성
	public void passwordCreate() {
		
		 String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	        int length = 8;
	        StringBuilder password = new StringBuilder();
	        Random random = new Random();

	        for (int i = 0; i < length; i++) {
	            password.append(chars.charAt(random.nextInt(chars.length())));
	        }

	        this.temporaryPassword = password+"";
	        System.out.println(temporaryPassword+"       여기는 임시비밀번호 만든곳");
	
	}

    // 메일 양식 작성
    public MimeMessage createMail(String mail){
    	passwordCreate();  // 임시 비밀번호 생성
        MimeMessage message = javaMailSender.createMimeMessage();

        try {
            message.setFrom(senderEmail);   // 보내는 이메일
            message.setRecipients(MimeMessage.RecipientType.TO, mail); // 보낼 이메일 설정
            message.setSubject("[ERP_Hospital] 임시비밀번호 설정");  // 제목 설정
            String body = "";
            body += "<h1>" + "안녕하세요." + "</h1>";
            body += "<h1>" + "ERP_Hospital 입니다." + "</h1>";
            body += "<h3>" + "임시비밀번호를 전달 드립니다." + "</h3><br>";
            body += "<h2>" + "로그인 ID와 함께 아래 비밀번호를 입력해주세요." + "</h2>";

            body += "<div align='center' style='border:1px solid black; font-family:verdana;'>";
            body += "<h2>" + "임시 비밀번호 코드입니다." + "</h2>";
            body += "<h1 style='color:blue'>" + this.temporaryPassword + "</h1>";
            System.out.println(temporaryPassword+"       인증코드메일안에 임시비밀번호 입력한 곳");
            body += "</div><br>";
            body += "<h3>" + "감사합니다." + "</h3>";
            message.setText(body,"UTF-8", "html");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return message;
    }
    
    public MimeMessage createMail(String mail, String memCd){
    	
        MimeMessage message = javaMailSender.createMimeMessage();

        try {
            message.setFrom(senderEmail);   // 보내는 이메일
            message.setRecipients(MimeMessage.RecipientType.TO, mail); // 보낼 이메일 설정
            message.setSubject("[ERP_Hospital] 신규 입사자 계정 정보 전달 메일");  // 제목 설정
            String body = "";
            body += "<h1>" + "안녕하세요." + "</h1>";
            body += "<h1>" + "ERP_Hospital 입니다." + "</h1>";
            body += "<h3>" + "귀하의 입사를 진심으로 축하드립니다." + "</h3><br>";
            body += "<h2>" + "사번을 전달드리며 초기 비밀번호는 귀하의 생년월일입니다." + "</h2>";

            body += "<div align='center' style='border:1px solid black; font-family:verdana;'>";
            body += "<h2>" + "사번입니다." + "</h2>";
            body += "<h1 style='color:blue'>" + memCd + "</h1>";
            body += "</div><br>";
            body += "<h3>" + "감사합니다." + "</h3>";
            message.setText(body,"UTF-8", "html");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return message;
    }

    // 실제 메일 전송
    public String sendEmail(String email) {
        // 메일 전송에 필요한 정보 설정
    	// 실제 메일 전송
		MimeMessage message = createMail(email);
		javaMailSender.send(message);   
 		
        // 임시 비밀 번호 반환
        System.out.println(temporaryPassword+"       임시비밀번호 전송하기전");
        return this.temporaryPassword;
    }
    
    public String sendEmail(String email,String memCd) {
        // 메일 전송에 필요한 정보 설정
    	// 실제 메일 전송
		MimeMessage message = createMail(email,memCd);
		javaMailSender.send(message);   
 		
        // 임시 비밀 번호 반환
        log.info("신규 입사자 메일 전송 메서드");
        return this.temporaryPassword;
    }
    
    
    
    
		
	
}
