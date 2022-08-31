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
String str="update branch set status='"+prst+"' where cid="+id+""; 
stmt.execute(str);
out.println("<h2 align='center'>Status Updated</h2>");
%>
<jsp:include page="cid.jsp"/>
