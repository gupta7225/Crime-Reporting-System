<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<script language="javascript" src="./menu.js"></script>
<script language="javascript" src="./admin_items.js"></script>
<script language="javascript" src="./menu_tpl.js"></script>
<script language="javascript">
  new menu (MENU_ITEMS, MENU_POS, MENU_STYLES);
</script>

</head>
<%
String id[] = new String[10];
for (int i = 0; i < 10; i++) {
id[i] = request.getParameter("check" + i);
}
%>
<body bgcolor="beige">
<%
try {
Connection conn = null;
Class.forName("com.mysql.cj.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
ResultSet rs = null;
Statement st = null;
st = conn.createStatement();
for (int a = 0; a < 10; a++) {
st.executeUpdate("delete from admin where pid='" + id[a]+ "'");
if(id[a] != null){%>
<h3><font color="blue">Record : <%= id[a]%> Deleted Successfully</font></h3>
<% }}
} catch (SQLException e) {
System.out.println(e.getMessage());
}

%>

<a href="/ips1/adminis.jsp">Click here to go to Home</a>
</body>

</html>