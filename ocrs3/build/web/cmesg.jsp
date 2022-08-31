<%@page import="java.sql.*"%>
<%!

Connection con;
Statement stmt;
ResultSet rs;
%>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
stmt=con.createStatement();
rs=stmt.executeQuery("select distinct(location) from admin");

%>
<html>
<head>
<title></title>
<script>
function fun()
{
    
if(f.desg.value=="Select")
{
alert("Please select valid police station name");
return false;
}    
var no1=f.txt.value;
if(no1.length==0)
{
alert("Subject can not be empty");
f.txt.focus();
return false;
}
var no2=f.msg.value;
if(no2.length==0)
{
alert("Message can not be empty");
f.msg.focus();
return false;
}

}
</script>
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

</style>
</head>
  <body>
      
 <form method="post" action=cmesg1.jsp class="elegant-aero" name="f" onsubmit="return fun()">
<h1>Message To Department</h1>
<label><span>To :</span>
    <select name="desg">
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

<label><span>Subject :</span>
<input name="txt" type="text"></label>

<label><span>Message :</span>
<textarea  name="mesg"></textarea></label>

<label>
        <span>&nbsp;</span>
        <input type="submit" class="button" value="SUBMIT" />&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="CLEAR" />
        
        </label>
</form> 
  
  </body>
</html>
