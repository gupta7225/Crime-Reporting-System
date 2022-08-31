
<html> <head><script language="javascript" src="./menu.js"></script>
<script language="javascript" src="./police_items.js"></script>
<script language="javascript" src="./menu_tpl.js"></script>
<script language="javascript">
  new menu (MENU_ITEMS, MENU_POS, MENU_STYLES);
</script>

<style type="text/css">
body {
          background-image:  url('back2.jpg');
          background-repeat: repeat;
          background-position:  center 50%;
          background-height:100px;
          text-decoration: none;
         
          }
          
          h2
  {
   margin-top: 1em;   
   color:#3EB1DD;
   font: 30px "Trebuchet MS", Arial, Helvetica, sans-serif;
      
      }

</style></head>   <body>
  <br><br>         <%@page import="java.sql.*"%>
        <%!
        String place;
        int cid;
        Connection con;
        Statement st;
        ResultSet rs;
        %>
        <%
        place=(String)session.getAttribute("location");
        Class.forName("com.mysql.cj.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
        st=con.createStatement();
        rs=st.executeQuery("select cid from branch where station='"+place+"'");%><h2><CENTER><%=place%>  Complaints </CENTER></h2>
        
        <%while(rs.next())
        {
        cid=rs.getInt(1);
        out.println("<center><br><br><a href=viewcomp.jsp?no="+cid+">"+cid+" </a></center>");
        }
     %>  
    </body>
</html>
    