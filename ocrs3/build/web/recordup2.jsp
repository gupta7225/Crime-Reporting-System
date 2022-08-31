<%@page import="java.sql.*"%>
<%!
String prst;
int id;
Connection con;
Statement stmt;
%>
<%
prst=request.getParameter("upst");
id=Integer.parseInt(request.getParameter("id"));
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
stmt=con.createStatement();
String str="update records set status='"+prst+"' where id="+id+""; 
stmt.execute(str);
out.println("<center><font color='#3EB1DD'><h3><br><br>Status Updated</font></center></h3>");
%>
<jsp:include page="recordup.jsp"/>
