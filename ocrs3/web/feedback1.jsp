<%@page import="java.sql.*"%>
<%!
String frm,toadd,sub,desc;
Connection con;
Statement stmt;
%>
<%
frm=request.getParameter("from");
toadd=request.getParameter("desg");
sub=request.getParameter("txt");
desc=request.getParameter("mesg");
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
stmt=con.createStatement();


String str="insert into feedback values('"+frm+"','"+toadd+"','"+sub+"','"+desc+"')";
stmt.execute(str);
stmt.close();

out.println("<h2 align=center>Successfully Sent");
out.println("</h2>");
con.close();

%>
<jsp:include page="feedback.jsp"/>

