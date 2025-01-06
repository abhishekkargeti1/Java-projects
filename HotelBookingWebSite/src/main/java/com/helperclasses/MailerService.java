package com.helperclasses;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
@Async
public class MailerService {
	
    public static boolean mailSender(String message,String subject,String to,String from) {
    	String host ="smtp.gmail.com";
    	Properties properties =System.getProperties();
    	//System.out.println("System Properties "+properties);
    	
    	properties.put("mail.smtp.host", host);
    	properties.put("mail.smtp.port", "465");
    	properties.put("mail.smtp.ssl.enable", "true");
    	properties.put("mail.smtp.auth", "true");
    	
    	Session session =Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("customerservices1808@gmail.com", "uhzi kprw pyaj jvxq");
			}
    	});
    	
    	//session.setDebug(true);
 
    	MimeMessage messageClass = new MimeMessage(session);
    	try {
			messageClass.setFrom(from);
			messageClass.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			messageClass.setSubject(subject);
			messageClass.setText(message);
			
			Transport.send(messageClass);
			System.out.println("Send Successfully ");
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return false;
    	
    }
    
    
}
