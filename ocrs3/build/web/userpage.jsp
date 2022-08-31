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
var no2=f.mesg.value;
if(no2.length==0)
{
alert("Message can not be empty");
f.mesg.focus();
return false;
}
var no3=f.from.value;
if(no3.length==0)
{
alert("Enter your name");
f.from.focus();
return false;
}

}
</script>
<script language="javascript" src="./menu.js"></script>
<script language="javascript" src="./user_items.js"></script>
<script language="javascript" src="./menu_tpl.js"></script>
<script language="javascript">
  new menu (MENU_ITEMS, MENU_POS, MENU_STYLES);
</script>
<link rel="stylesheet" href="elegant-aero1.css" type="text/css">
<style type="text/css">
body {
          background-image:  url('back2.jpg');
          background-repeat: repeat;
          background-position:  center 50%;
          background-height:100px;
         
          }
  h2
  {
   margin-top: 1em;
   margin-left:1em;
   color:#3EB1DD;
   font: 50px "Trebuchet MS", Arial, Helvetica, sans-serif;
      
      }        

</style>
</head>
  <body>
 <hr style="width: 0px;height: 100%;position:absolute;margin-left:31em;margin-top:1em; color: #D2E9FF">  
 <hr style="width: 0px;height: 100%;position:absolute;margin-left: 57em;margin-top:1em;color: #D2E9FF">
 <h2 align="center">WELCOME</h2>
 
       <!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/56fa9dbd1d1573a2295869f9/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->
   
      
<form method="post" action=feedback1.jsp class="elegant-aero1" name="f" onsubmit="return fun()">
     <h1 align="center">Feedback</h1>
<label><span>From :</span>
<input name="from" type="text"></label>
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