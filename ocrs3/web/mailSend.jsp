<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<%
String host="", user="", pass="";

host ="smtp.gmail.com"; 

user ="ocrsindore@gmail.com"; 

pass ="odeya-12";

String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";

String to =request.getParameter("email"); 

String from ="ocrsindore@gmail.com"; 

String subject =request.getParameter("subject");

String messageText =request.getParameter("message");

boolean sessionDebug = true;

Properties props = System.getProperties();
props.put("mail.host", host);
props.put("mail.transport.protocol.", "smtp");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.", "true");
props.put("mail.smtp.port", "465");
props.put("mail.smtp.socketFactory.fallback", "false");
props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
Session mailSession = Session.getDefaultInstance(props, null);
mailSession.setDebug(sessionDebug);
Message msg = new MimeMessage(mailSession);
msg.setFrom(new InternetAddress(from));
InternetAddress[] address = {new InternetAddress(to)};
msg.setRecipients(Message.RecipientType.TO, address);
msg.setSubject(subject);
msg.setContent(messageText, "text/html"); 
Transport transport = mailSession.getTransport("smtp");
transport.connect(host,from,pass);
try {
transport.sendMessage(msg, msg.getAllRecipients());

out.println("<h2 align='center'>Successfully sent</h2>"); 
}
catch (Exception err) {

out.println("message not successfully sended"); 
}
transport.close();


%>
<jsp:include page="adminis.html"/> 