<html>
<%@page import="java.sql.*"%>
<%!
int id;
Connection con;
Statement st;
ResultSet rs;
%>
<%
id=Integer.parseInt(request.getParameter("no"));
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
st=con.createStatement();
rs=st.executeQuery("select cname,sub,loca,da,discri from branch where cid="+id+"");
%>
<head>
<title>COMPLAINTS </title>

<script language="javascript" src="./menu.js"></script>
<script language="javascript" src="./police_items.js"></script>
<script language="javascript" src="./menu_tpl.js"></script>
<script language="javascript">
  new menu (MENU_ITEMS, MENU_POS, MENU_STYLES);
</script>

<link rel="stylesheet" href="elegant.css" type="text/css">
</head>
<body>
 
     <div id="header">
<h2 align="center">COMPLAINT DETAILS</h2>
</div>
        <%
        while(rs.next())
        {
        %>
                
<div id="section">
<h1>COMPLAINANT</h1><p><%=rs.getString(1)%></p>

<h1>COMPLAINT ID</h1>
<p><%=id%></p>


<h1>SUBJECT</h1>
<p><%=rs.getString(2)%></p>

<h1>LOCATION</h1>
<p><%=rs.getString(3)%></p>

<h1>DATE</h1>
<p><%=rs.getString(4)%></p>

<h1>DESCRIPTION</h1>
<p1><%=rs.getString(5)%></p1>

</div>
        <%
        }
        
        %>  
        
</body>
</html>