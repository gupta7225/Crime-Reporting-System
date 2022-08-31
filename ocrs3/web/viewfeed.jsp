<html>
 <%@page import="java.sql.*"%>
 <%!
                
                Connection con;
                Statement stmt;
                ResultSet rs;
                %>
                <%
                String loc=(String)session.getAttribute("location");
                Class.forName("com.mysql.cj.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
                stmt=con.createStatement();
                String str="select * from feedback where toadd='"+loc+"'";
                rs=stmt.executeQuery(str);    
    
  %>  
    
    
    
<head>
       
<script language="javascript" src="./menu.js"></script>
<script language="javascript" src="./police_items.js"></script>
<script language="javascript" src="./menu_tpl.js"></script>
<script language="javascript">
  new menu (MENU_ITEMS, MENU_POS, MENU_STYLES);
</script>
<link rel="stylesheet" href="elegant.css" type="text/css">
<style type="text/css">
body {
          background-image:  url('back2.jpg');
          background-repeat: repeat;
          background-position:  center 50%;
          background-height:100px;
         
          }

</style></head>    
<body>
    <h2 align=center>FEEDBACK</h2>
    <hr width="100%" color="#C0E1FF">
               
                <%
                while(rs.next())
                {
                %>
 <div id="section">     
      <h1>FROM :</h1>
      <p1><%=rs.getString(1)%></p1>
      
         
      <h1>SUBJECT :</h1>
      <p1><%=rs.getString(3)%></p1>
      
        
      <h1>DESCRIPTION :</h1>
      <p1><%=rs.getString(4)%></p1><a href=cmesg.jsp align="right">REPLY</a>
 
 </div>
                
                <%
                }
                %>
         
        
    </body>
</html>

