<%@page import="java.sql.*"%>
<%!
Connection con;
Statement st;
ResultSet rs;
%>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
st=con.createStatement();
rs=st.executeQuery("select cid,cname,da,descri,station,status from branch");
%>
<html>

<head>
<title>Complaints</title>
<script language="javascript" src="./menu.js"></script>
<script language="javascript" src="./admin_items.js"></script>
<script language="javascript" src="./menu_tpl.js"></script>
<script language="javascript">
  new menu (MENU_ITEMS, MENU_POS, MENU_STYLES);
</script>
<link rel="stylesheet" href="elegant.css" type="text/css">
</head>

<body style="background-color:aliceblue">
  
   <h2 align=center>COMPLAINTS</h2>
    <hr width="100%" color="#C0E1FF">

        <%
        while(rs.next())
        {
        %>
                
<div id="section">
<h1>COMPLAINT ID</h1><p1><%=rs.getString(1)%></p1>

<h1>COMPLAINANT</h1>
<p1><%=rs.getString(2)%></p1>


<h1>DATE</h1>
<p1><%=rs.getString(3)%></p1>

<h1>DESCRIPTION</h1>
<p1><%=rs.getString(4)%></p1>

<h1>STATION</h1>
<p1><%=rs.getString(5)%></p1>

<h1>STATUS</h1>
<p1><%=rs.getString(6)%></p1>

</div>
<hr width="90%" color="#C0E1FF"> 
        <%
        }
        
        %>  
       
</body>
</html>