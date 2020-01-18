package kr.co.thenet.fapee.common.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MailUtils {
	
	public static void sendMail(String receiverEmail, String subject, String content) {

		// Sender's email ID needs to be mentioned
		String from = "webmaster@fapee.co.kr";
		
		// Recipient's email ID needs to be mentioned.
		String to = receiverEmail;

		// Assuming you are sending email from localhost
		String host = "localhost";

		// Get system properties
		Properties properties = System.getProperties();

		// Setup mail server
		properties.setProperty("mail.smtp.host", host);

		// Get the default Session object.
		Session session = Session.getDefaultInstance(properties);

		try {
			log.info("Mail send start...{}", receiverEmail);
			log.info(content);
			
			// Create a default MimeMessage object.
			MimeMessage message = new MimeMessage(session);

			// Set From: header field of the header.
			message.setFrom(new InternetAddress(from));

			// Set To: header field of the header.
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// Set Subject: header field
			message.setSubject(subject);

			// Send the actual HTML message, as big as you like
			message.setContent(content, "text/html; charset=UTF-8");

			// Send message
			Transport.send(message);
			
			log.info("Mail send sucessfully...receiver={}", receiverEmail);
			
		} catch (MessagingException mex) {
			log.error("[ERROR] Mail send failed...{}", mex);
		}
	}
	
	public static String getContent(String mailType) {
		StringBuilder mailContent = new StringBuilder("");
		try {
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			
			String filePath = "";
			if("join".equals(mailType)) {
				filePath = request.getServletContext().getRealPath("/resources/forms/email/join.html");
			}
			else if("join_seller".equals(mailType)) {
				filePath = request.getServletContext().getRealPath("/resources/forms/email/join_seller.html");
			}
			else if("join_seller_return".equals(mailType)) {
				filePath = request.getServletContext().getRealPath("/resources/forms/email/join_seller_return.html");
			}

			if( (new File(filePath)).exists() ) {
			    BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(filePath), "UTF-8"));
			    String line = null;
			    while ((line = br.readLine()) != null) {
			        mailContent.append(line).append("\n");
			    }
			    br.close();
			}
				   
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mailContent.toString();
	}

}
