import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

public class RSendMail
{
	public static void send(String to, String sub, String mesg)
	{
		Properties p = new Properties();
		
		final String user = "kdgp1111@gmail.com";
		final String pass = "polytechnic11112";
		
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "587");		
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.starttls.enable", "true");
		
		Session session = Session.getInstance(p,new javax.mail.Authenticator()
		{
			protected PasswordAuthentication getPasswordAuthentication() 
			{
				return new PasswordAuthentication(user,pass);
			}
		});
		
		try
		{
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
			message.setSubject(sub);
			//message.setText(mesg);
			message.setContent(mesg,"text/html");
			
			/*message.setContent("<html>\n" +
                    "<body>\n" +
                    "\n" +
                    "<a href=\"http://www.eventplanner.com\">Goto EventPlanner</a>\n" +
                    "This mail is generated to inform you that your registration is confirm\n" +
                    "\n" +
                    "</body>\n" +
                    "</html>", "text/html"); */	
			Transport.send(message); 		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
}