<%@page import="java.sql.*"%>
//<%@page import="java.util.Date" %>>
<%!
String location,sub,descr;
Connection con;
Statement stmt;

%>
<%
sub=request.getParameter("sub");
location=request.getParameter("loc");
descr=request.getParameter("desc");
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
stmt=con.createStatement();
String str="insert into alerts values('"+location+"','"+sub+"','"+descr+"',sysdate())";
stmt.execute(str);
out.println("<br><br><top>POSTED</top>");
%>
<jsp:include page="adminis.html"/> 
<%
stmt.close();
con.close();
%>
