
package user;

import java.util.Properties;
import javax.ejb.Stateless;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author ALEEMUDDIN
 */
@Stateless
public class MailSenderBean {

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    public int sendEmail(String fromEmail,final String username, String password,
            String toEmail,String subject,String message){
        try{
            
      // Get system properties
      Properties properties = System.getProperties();

      // Setup mail server
      properties.put("mail.smtp.starttls.enable", "true");
      properties.setProperty("mail.smtp.ssl.enable", "true");
      properties.setProperty("mail.smtp.auth", "true");
      properties.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory" );
      properties.setProperty("mail.smtp.host", "smtp.gmail.com");
      properties.setProperty("mail.smtp.port", "465");
      properties.setProperty("mail.smtp.socketFactory.port", "465");
      // properties.put("mail.smtp.socketFactory.fallback", "true");
        Session mailSession = Session.getInstance(properties, 
                          new Authenticator(){
                             protected PasswordAuthentication getPasswordAuthentication() {
                                return new PasswordAuthentication(username, "sweety@sweety");
                             }});
        mailSession.setDebug(true);
        
        Message mailMessage= new MimeMessage(mailSession);
        mailMessage.setFrom(new InternetAddress(fromEmail));
        mailMessage.setRecipient(Message.RecipientType.TO,new InternetAddress(toEmail));
        mailMessage.setContent(message,"text/html");
        mailMessage.setSubject(subject);
        
        Transport transport= mailSession.getTransport("smtp");
        transport.connect("smtp.gmail.com",username,password);
        transport.sendMessage(mailMessage,mailMessage.getAllRecipients());
        
        
        }catch(Exception e){
            System.out.println(e);
        }
        
        return 5;
        
    }
}
