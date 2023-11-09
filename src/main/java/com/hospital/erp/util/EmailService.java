package com.hospital.erp.util;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
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

    // 실제 메일 전송
    public String sendEmail(String userId) {
        // 메일 전송에 필요한 정보 설정
        MimeMessage message = createMail(userId);
        // 실제 메일 전송
        javaMailSender.send(message);

        // 임시 비밀 번호 반환
        System.out.println(temporaryPassword+"       임시비밀번호 전송하기전");
        return this.temporaryPassword;
    }
		
	
}
