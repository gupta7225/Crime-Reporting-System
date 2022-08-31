<%@page import="java.sql.*"%>
<%!

Connection con;
Statement stmt;
ResultSet rs;
%>
<%
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
stmt=con.createStatement();
String str="select distinct(location) from records";
rs=stmt.executeQuery(str);
}
catch(Exception e)
               {}
%>
<html>
<head>
<title></title>
<script>
function fun()
{

if(f.location.value=="Select")
{
alert("Please select valid location");
return false;
}    
}
    </script>
 <script language="javascript" src="menu.js" charset="UTF-8"></script>
<script language="javascript" src="user_items.js"></script>
<script language="javascript" src="menu_tpl.js"></script>
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

</style>
</head>
<body>
 

    <form method="get" name="f" action="list" class="elegant-aero" onsubmit=" return fun()">
<h1>CHOOSE LOCATION</h1>
<label><span>Station :</span>
    <select name="location">
        <option selected>Select</option>
        <%
        while(rs.next())
        {
        %>
        
        <option><%=rs.getString(1)%></option>
        <%
        }
        %>  
</select></label>


       <label>
        <span>&nbsp;</span>
        <input type="submit" class="button" value="SUBMIT" />&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="CLEAR" />
        
        </label>

</table>
</form>
</center>
</body>
</html>