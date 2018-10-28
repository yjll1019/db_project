package net.skhu.mapper;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class Config {

	@Value("${email.host}")
	private String host;

	@Value("${email.port}")
	private Integer port;

	@Value("${email.username}")
	private String username;

	@Value("${email.password}")
	private String password;

	@Bean
	public JavaMailSender javaMailService() {
		JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();

		javaMailSender.setHost(host);
		javaMailSender.setUsername(username);
		javaMailSender.setPassword(password);
		javaMailSender.setPort(port);

		javaMailSender.setJavaMailProperties(getMailProperties());
		javaMailSender.setDefaultEncoding("UTF-8");

		return javaMailSender;
	}
	private Properties getMailProperties() {
		Properties pt = new Properties();

		pt.setProperty("mail.transport.protocol","smtp");
		pt.setProperty("mail.smtp.auth","true");
		pt.setProperty("mail.smtp.starttls.enable","true");
		pt.setProperty("mail.debug","false");
		return pt;
	}

}
