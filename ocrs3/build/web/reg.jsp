<%@page import="java.sql.*"%>

<%!
String uname,pword,gender,address,email,tno,user;
int age;
Connection con;
Statement stmt;

%>
<%
uname=request.getParameter("name");
user=request.getParameter("user");
pword=request.getParameter("pwd");
age=Integer.parseInt(request.getParameter("age"));
gender=request.getParameter("gender");
address=request.getParameter("address");
tno=request.getParameter("pno");
email=request.getParameter("mail");

Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
stmt=con.createStatement();
String str="insert into register values('"+uname+"','"+user+"','"+pword+"',"+age+",'"+gender+"','"+address+"','"+tno+"','"+email+"')";
String str1="insert into login values('"+user+"','"+pword+"')";
//String str2="insert into branch(cname) values('"+uname+"')";
stmt.execute(str);
stmt.execute(str1);
//stmt.execute(str2);
out.println("<h2 align=center color=3EB1DD>");
out.println("Successfully registered");
out.println("</h2>");
%>
<jsp:include page="user.html"/> 
<%
stmt.close();
con.close();

 
%>
