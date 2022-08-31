<%@page import="java.sql.*"%>
<%!
String place;
Connection con;
Statement stmt;


ResultSet rs;
%>
<%
place=(String)session.getAttribute("location");
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
stmt=con.createStatement();
String str="select distinct(id) from records where location='"+place+"' order by id asc"; 
rs=stmt.executeQuery(str);
%>
<head>
<title></title>
 <script language="javascript" src="./menu.js"></script>
<script language="javascript" src="./police_items.js"></script>
<script language="javascript" src="./menu_tpl.js"></script>
<script language="javascript">
  new menu (MENU_ITEMS, MENU_POS, MENU_STYLES);
</script>
<link rel="stylesheet" href="elegant-aero.css" type="text/css">
<style type="text/css">
body {
          background-image:  url('back2.jpg');
          background-repeat: no-repeat;
          background-position:  center 50%;
          background-height:100px
         
          }

</style></head>
<body>
 
             
 <form action="recordup1.jsp" method="post" class="elegant-aero">
 <h1>Update Status of Criminal</h1>    
 <label><span>Select ID :</span>
       <select name="id">
       <option selected>Select</option>    
          <%
        while(rs.next())
        {
        %>
        <option><%=rs.getInt(1)%></option>
    <% 
        }
       %>
        </select></label>
  
 <label>
        <span>&nbsp;</span>
        <input type="submit" class="button" value="SUBMIT" />&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="CLEAR" />
        
        </label>
        </form>
       
   </body>
</html>

        

    