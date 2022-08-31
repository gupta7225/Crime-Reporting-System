<%@page import="java.sql.*"%>

<%!
String id,name,desg,loc,tno,pass;

Connection con;
Statement stmt;

%>
<%
id=request.getParameter("pid");
name=request.getParameter("pname");
desg=request.getParameter("designation");
loc=request.getParameter("location");
tno=request.getParameter("pno");
pass=request.getParameter("pass");

Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
stmt=con.createStatement();
String str="insert into addepartment values('"+id+"','"+name+"','"+desg+"','"+loc+"','"+tno+"','"+pass+"')";
//String str1="insert into login values('"+user+"','"+pword+"')";

stmt.execute(str);
//stmt.execute(str1);

out.println("<h1 align=center>");
out.println("<Record Added<br>");
out.println("</h1>");
%>
<jsp:include page="polacc.jsp"/> 
<%
stmt.close();
con.close();

 
%>
