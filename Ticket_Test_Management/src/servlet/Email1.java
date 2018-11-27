/*package servlet;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.AddressException;
import userbean.Userbean;



public class Email1 {

	*//**
	   Outgoing Mail (SMTP) Server
	   requires TLS or SSL: smtp.gmail.com (use authentication)
	   Use Authentication: Yes
	   Port for TLS/STARTTLS: 587
	 * @throws MessagingException 
	 * @throws AddressException 
	
	 *//*

	public static void mail(Userbean user) throws ClassNotFoundException, AddressException, MessagingException {
		
		
		final String fromEmail = "rgvbatch@gmail.com"; //requires valid gmail id
		final String password = "rgv@4699"; // correct password for gmail id
		final String toEmail = user.getEmail(); // can be any email id 
		
		System.out.println("TLSEmail Start");
		Properties props = new Properties();
		
		props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
		props.put("mail.debug", "true"); 
		props.put("mail.smtp.port", "548"); //TLS Port
		props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
		props.put("mail.smtp.auth", "true"); //enable authentication
		props.put("mail.smtp.starttls.required", "true"); //enable STARTTLS
		props.put("mail.smtp.EnableSSL.enable","true");

		props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
		props.setProperty("mail.smtp.socketFactory.fallbac k", "false"); 
		props.setProperty("mail.smtp.port", "548"); 
		props.setProperty("mail.smtp.socketFactory.port", "548"); 
		
                //create Authenticator object to pass in Session.getInstance argument
		Authenticator auth = new Authenticator() {
			//override the getPasswordAuthentication method
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, password);
			}
		};
		Session session = Session.getInstance(props, auth);
		System.out.println("okkkk");
		String subject="username and password";
		
		
		String body= "your username is ::"+user.getUsername()+"  , "+"password is::::"+user.getPassword();
	
		Email.sendEmail(session, toEmail, subject, body);
		System.out.println("gooo");
		
		
		
	

	

		

		    // Get a Properties object
		    Properties props = System.getProperties();

		    // ******************** FOR PROXY ******************

		    // props.setProperty("proxySet","true");
		    // props.setProperty("socksProxyHost","9.10.11.12");
		    // props.setProperty("socksProxyPort","80");
		    // props.setProperty("socksProxyVersion","5");

		    props.setProperty("mail.smtp.host", "smtp.gmail.com");

		    // ******************** FOR SSL ******************
		    //final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		    //props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
		    //props.setProperty("mail.smtp.socketFactory.fallback", "false");
		    //props.setProperty("mail.smtp.port", "548");
		    //props.setProperty("mail.smtp.socketFactory.port", "548");

		    props.put("mail.smtp.starttls.enable", "true");
		    props.put("mail.smtp.auth", "true");
		    props.put("mail.debug", "true");
		    props.put("mail.store.protocol", "pop3");
		    props.put("mail.transport.protocol", "smtp");
		    final String username = "rgvbatch@gmail.com";
		    final String password = "rgv@4699";
		    Session session = Session.getDefaultInstance(props,
		            new Authenticator() {
		                protected PasswordAuthentication getPasswordAuthentication() {
		                    return new PasswordAuthentication(username, password);
		                }
		            });

		    // -- Create a new message --
		    Message msg = new MimeMessage(session);
		    msg.setFrom(new InternetAddress("rgvbatch@gmail.com"));
		    msg.setRecipients(Message.RecipientType.TO,
		            InternetAddress.parse(user.getEmail(), false));
		    msg.setSubject("Hi  "+user.getName());
		    msg.setSentDate(new Date());

		    // **************** Without Attachments ******************
		    msg.setText("your username is ::"+user.getUsername()+"  , "+"password is::::"+user.getPassword());


		    Transport.send(msg);
		    System.out.println("Message sent.");

		}


}	
	
*/


package servlet;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import userbean.Userbean;



public class Email1 {

	/**
	   Outgoing Mail (SMTP) Server
	   requires TLS or SSL: smtp.gmail.com (use authentication)
	   Use Authentication: Yes
	   Port for TLS/STARTTLS: 587
	 */

	public static void mail(Userbean user) throws ClassNotFoundException {
		
		
		final String fromEmail = "rgvbatch@gmail.com"; //requires valid gmail id
		final String password = "rgv@4699"; // correct password for gmail id
		final String toEmail = user.getEmail(); // can be any email id 
		
		System.out.println("TLSEmail Start");
		Properties props = new Properties();
		
		props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
		props.put("mail.debug", "true"); 
		props.put("mail.smtp.port", "465"); //TLS Port
		props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
		props.put("mail.smtp.auth", "true"); //enable authentication
		props.put("mail.smtp.starttls.required", "true"); //enable STARTTLS
		props.put("mail.smtp.EnableSSL.enable","true");

		props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
		props.setProperty("mail.smtp.socketFactory.fallbac k", "false"); 
		props.setProperty("mail.smtp.port", "465"); 
		props.setProperty("mail.smtp.socketFactory.port", "465"); 
		
                //create Authenticator object to pass in Session.getInstance argument
		Authenticator auth = new Authenticator() {
			//override the getPasswordAuthentication method
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, password);
			}
		};
		Session session = Session.getInstance(props, auth);
		
		String subject="username&password";
		
		
		//String body= "your username is ::"+user.getUsername()+"  , "+"password is::::"+user.getPassword();
	
		String body="<table border=1><tr><th>USERNAME</th><th>PASSWORD</th></tr><tr><td>"+user.getUsername()+"</td><td>"+user.getPassword()+"</td></tr></table>";
		
		
		Email.sendEmail(session, toEmail,subject, body);
		
		
	

	}

	
}



