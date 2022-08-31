<%@page import="oracle.net.aso.i"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*,java.sql.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page errorPage="errorpage.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<%!
Connection con;
Statement st;
ResultSet rs;

%>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
st=con.createStatement();
rs=st.executeQuery("select email from register");
%>
<%
String host="", user="", pass="";
int i=-1;
String records[] = new String[100];
while(rs.next())
{
i++; 
records[i]=rs.getString(1);
}
host ="smtp.gmail.com"; 

user ="ocrsindore@gmail.com"; 

pass ="odeya-12";

String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";

 
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

for(String email:records)
{
 
InternetAddress[] address = {new InternetAddress(email)};

msg.setRecipients(Message.RecipientType.TO, address);
msg.setSubject(subject);
msg.setContent(messageText, "text/html"); 

Transport transport = mailSession.getTransport("smtp");
transport.connect(host,from,pass);
try {
transport.sendMessage(msg, msg.getAllRecipients());

out.println("<h2 align='center'>Message successfully sent</h2>"); 
}
catch (Exception e) {

out.println("Unsuccessful"); 
}

transport.close();
}
st.close();
con.close();

%>
<jsp:forward page="errorpage.jsp"/> 