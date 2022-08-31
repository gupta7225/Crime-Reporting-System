<html>
    <head>

        <style type="text/css">
body {
          background-image:  url('back2.jpg');
          background-repeat: repeat;
          background-position:  center 50%;
          background-height:100px
          }

</style>
    </head>
    <body>

    </body>
</html>
<%@page import="java.sql.*"%>
<%!
String name,password,station;
Connection con;
Statement stmt;
ResultSet rs;
%>
<%
name=request.getParameter("uname");
password=request.getParameter("pwd");
station=request.getParameter("desg");
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
stmt=con.createStatement();
String str="select * from department where pid='"+name+"' and password='"+password+"' and location='"+station+"'";
rs=stmt.executeQuery(str);

if(rs.next())
    {
    session.setAttribute("location",station);
 %>
<jsp:forward page="policedept.jsp"/>
<%
}
else
{
out.println("<html><body><br><br><br><br>Invalid Login and Password</body></html>");

%>
<jsp:include page="policelogin.jsp"/> 
<%
}
stmt.close();
con.close();
%>
