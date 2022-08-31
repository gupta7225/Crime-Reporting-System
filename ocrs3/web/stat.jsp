<%@page import="java.sql.*"%>
<%!
int id,id1;
String status,user,sub;
Connection con;
Statement stmt;
ResultSet rs;
%>
<%
id=Integer.parseInt(request.getParameter("id"));
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
stmt=con.createStatement();
String str="select cid,cname,sub,status from branch where cid="+id+""; 

rs=stmt.executeQuery(str);
if(rs.next())
{
id1=rs.getInt(1);
user=rs.getString(2);
sub=rs.getString(3);
status=rs.getString(4);
%>
<jsp:include page="viewstatus.html"/>
<%
out.println("<center><table cellspacing=0 cellpadding=0><tr><th><span>Complaint ID</span></th><th><span>Complainant Name</span></th><th><span>Subject<span></th><th><span>Status</span></th></tr><tr><td>"+id1+"</td><td>"+user+"</td><td>"+sub+"</td><td>"+status+"</td></tr></table></center>");
}
else
{
    out.println("<center><br><br><br><br><br><br><br><br><h3>NOT VALID</h3></center>");   
%>
<jsp:include page="viewstatus.html"/>
<%
}
stmt.close();
con.close();
%>
