<%@page import="java.sql.*"%>
<%!
String login,password;
Connection con;
Statement stmt;
ResultSet rs;
%>
<%
login=request.getParameter("uname");
password=request.getParameter("pwd");
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
stmt=con.createStatement();
String str="select * from register where name='"+login+"' and pass='"+password+"'"; 
rs=stmt.executeQuery(str);
if(rs.next())
{
    session.setAttribute("user",login);
%>
<jsp:forward page="userpage.jsp"/>
<%
}
else
{
out.println("<br><br>Invalid Login and Password");
%>
<jsp:include page="user.html"/> 
<%
}
stmt.close();
con.close();
%>
