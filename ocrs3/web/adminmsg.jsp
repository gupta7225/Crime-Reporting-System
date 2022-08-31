<%@page import="java.sql.*"%>
<%!
String frm,sub,desc;
Connection con;
Statement stmt;
%>
<%
frm=(String)session.getAttribute("location");

sub=request.getParameter("txt");
desc=request.getParameter("mesg");
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
stmt=con.createStatement();



String str="insert into admessages(frm,subject,description,date1) values('"+frm+"','"+sub+"','"+desc+"',sysdate())";
stmt.execute(str);
stmt.close();

out.println("<h1 align=center>Successfully Sent");
out.println("</h1>");
con.close();

%>
<jsp:include page="adminmsg.html"/>

