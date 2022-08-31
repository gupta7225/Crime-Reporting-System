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
String str="select distinct(cid) from branch where station='"+place+"'"; 
rs=stmt.executeQuery(str);
        %>
        <head>
            <title> 
                complaint id's
            </title>
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
          background-repeat: repeat;
          background-position:  center 50%;
          background-height:100px;
         
          }
  h2
  {
   margin-top: 2em;   
   color:#3EB1DD;
   font: 30px "Trebuchet MS", Arial, Helvetica, sans-serif;
  }

</style>       
</head>
<body>
           
           
<form action="upstatus.jsp" method=post class="elegant-aero">
  <h1>Update Complaint Status
        <span>Select the complaint ID to update</span> </h1>   
<label><span>Complaint Id :</span>
<select name="complaintid">
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
        <input type="submit" class="button" value="SUBMIT" /></label>
        </form>
      
   </body>
</html>

        

    