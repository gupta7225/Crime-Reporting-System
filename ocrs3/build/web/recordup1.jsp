<%@page import="java.sql.*"%>
<%!
int id;
Connection con;
Statement stmt;
ResultSet rs;
%>
<%
id=Integer.parseInt(request.getParameter("id"));
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
stmt=con.createStatement();
String str="select id,status from records where id="+id+"";
rs=stmt.executeQuery(str);
rs.next();
%>
<html>
    <head>
        <title>Update status</title>
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
     }

 </style>
 </head>
 <body>
        
<form action="recordup2.jsp" method="post" class="elegant-aero">
    
<label><span>Criminal id :</span></label>
<input type="text" name="id" value="<%=rs.getInt(1)%>">
                    
<label><span>Previous Status :</span></label>
<input type="text" name="prest" value="<%=rs.getString(2)%>">

<label><span>Present Status :</span></label>
<textarea name="upst"></textarea>
                
 <label>
        <span>&nbsp;</span>
        <input type="submit" class="button" value="SUBMIT" />&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="CLEAR" />
        
        </label>
        </form>
    </body>
</html>