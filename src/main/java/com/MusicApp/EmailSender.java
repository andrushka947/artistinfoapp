package com.MusicApp;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class EmailSender {

    private String username;
    private String password;
    private Properties props;

    public EmailSender (String username, String password) {
        this.username = username;
        this.password = password;

        props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
    }

    public void send(String subject, String text, String fromEmail, String toEmail){
        Session session = Session.getDefaultInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));                                         //from
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));        //to
            message.setSubject(subject);                                                            //subject
            message.setText(text);                                                                  //text

            Transport.send(message);                                                                //to
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
