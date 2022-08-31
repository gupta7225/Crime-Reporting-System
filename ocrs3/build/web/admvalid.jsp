<%@page import="java.sql.*"%>
<%!
String username,password;
Connection con;
Statement stmt;
ResultSet rs;
%>
<%
username=request.getParameter("uname");
password=request.getParameter("pwd");
try{
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
stmt=con.createStatement();
String str="select * from admin where userName='"+username+"' and password='"+password+"'";
rs=stmt.executeQuery(str);
if(rs.next())
{
%>
<jsp:forward page="adminis.html"/>
<%
}
else
{
out.println("<h3 align='center'>Invalid ID or Password!!!!</h3>");
%>
<jsp:include page="adminlogin.html"/> 
<%
}
stmt.close();
con.close();
}
catch(SQLException e){e.printStackTrace();}
%>
