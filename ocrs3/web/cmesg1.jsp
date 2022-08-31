<%@page import="java.sql.*"%>
<%!
String frm,toadd,sub,desc;
Connection con;
Statement stmt;
%>
<%
frm=(String)session.getAttribute("location");
toadd=request.getParameter("desg");
sub=request.getParameter("txt");
desc=request.getParameter("mesg");
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
stmt=con.createStatement();



String str="insert into pmessage(frm,subject,description,toadd,date1) values('"+frm+"','"+sub+"','"+desc+"','"+toadd+"',sysdate())";
stmt.execute(str);
stmt.close();
out.println("<style>");
out.println("h1{color:#3B1DD;}");
out.println("</style>");
out.println("<h1 align=center>Successfully Sent");
out.println("</h1>");
con.close();

%>
<jsp:include page="policedept.jsp"/>

