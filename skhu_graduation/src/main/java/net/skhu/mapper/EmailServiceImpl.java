package net.skhu.mapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceImpl {

	@Autowired
	private JavaMailSender javaMailSender;

	public void sendMessage(String to, String subject, String text){

		SimpleMailMessage message = new SimpleMailMessage();

		message.setTo(to); // 보낼 대상
		message.setSubject(subject);//제목
		message.setText(text);// 내용

		try {
			javaMailSender.send(message);
		}catch(MailException e) {
			e.printStackTrace();
		}
	}


}
