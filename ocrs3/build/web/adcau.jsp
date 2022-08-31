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
String str="select distinct(location) from admin";
rs=stmt.executeQuery(str);
%>
<html>

<head>
<title></title>

<script>
function fun()
{
    
if(f.loc.value=="Select")
{
alert("Please select valid police station name");
return false;
}    

var no2=f.desc.value;
if(no2.length==0)
{
alert("Message can not be empty");
f.desc.focus();
return false;
}

}
</script>
<script language="javascript" src="./menu.js"></script>
<script language="javascript" src="./admin_items.js"></script>
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
    <form action="adcautions.jsp" method="post" class="elegant-aero" name="f" onsubmit="return fun()">
    
<h1>MESSAGE TO POLICE DEPARTMENT</h1>    
<label><span>Message :</span>
<textarea  name="desc" ></textarea></label>
<label><span>Send To :</span>
<select name="loc">
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
</body>
</form>
</html>