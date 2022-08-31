<%@page import="java.sql.*"%>
<%!
String location,descr;
Connection con;
Statement stmt;
%>
<%
location=request.getParameter("loc");
descr=request.getParameter("desc");
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
stmt=con.createStatement();
String str="insert into message values('"+location+"','"+descr+"',sysdate())";
stmt.execute(str);
out.println("<style>");
out.println("h1{color:#3B1DD;}");
out.println("</style>");
out.println("<h1 align=center>Successfully Entered");
out.println("</h1>");
%>
<jsp:include page="adcau.jsp"/> 
<%
stmt.close();
con.close();
%>
