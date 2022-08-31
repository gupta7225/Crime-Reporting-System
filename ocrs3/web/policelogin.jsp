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
String str="select distinct(location) from admin";
rs=stmt.executeQuery(str);
}
catch(Exception e)
{}
%>
<html>
<head>
<title>POLICE DEPT LOGIN</title>
<script>
    
function fun()
{
var no1=f.uname.value;
if(no1.length==0 )
{
alert("plz enter valid user id");
f.uname.focus();
return false;
}
var no2=f.pwd.value;
if(no2.length==0)
{
alert("plz enter  password");
f.pwd.focus();
return false;
}
if(f.desg.value=="Select")
{
alert("Please select valid location");
return false;
}    
}
    </script>
 <script language="javascript" src="menu.js" charset="UTF-8"></script>
<script language="javascript" src="menu_items.js"></script>
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
 

<form method="post" name="f" action="validpol.jsp" class="elegant-aero" onsubmit="return fun()">
<h1>Police Department Login</h1>

<label>
    <span>ID :</span>
    <input id="name" name="uname" type="text" placeholder="ID" >
    </label>
<label>
    <span>Password :</span>
    <input id="password" name="pwd" type="password" placeholder="Password">
</label>
<label>
    <span>Log on To :</span><select name="desg">
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

</form>

</body>
</html>