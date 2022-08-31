
<%@page import="java.sql.*"%>
<%!
Connection con;
Statement st;
ResultSet rs;
%>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
st=con.createStatement();
rs=st.executeQuery("select distinct(location) from admin");
%>
<head>
<title>COMPLAINT FORM</title>
<script>
function fun()
{
var no1=f.sub.value;
if(no1.length==0 )
{
alert("Please enter valid subject");
f.sub.focus();
return false;
}
var no2=f.loc.value;
if(no2.length==0)
{
alert("Please enter valid location");
f.loc.focus();
return false;
}
var no3=f.dat.value;
if(no3.length==0)
{
alert("Please enter valid date");
f.dat.focus();
return false;
}
var no4=f.desc.value;
if(no4.length==0 )
{
alert("Please enter valid description");
f.desc.focus();
return false;
}
if(f.desg.value=="Select")
{
alert("Please select valid police station name");
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

<link rel="stylesheet" href="elegant-aero.css" type="text/css">
<style type="text/css">
body {
          background-image:  url('back2.jpg');
          background-repeat: repeat;
          background-position:  center 50%;
          background-height:100px
         
          }

</style>
</head>
<body>


    <form name="f" action="complaint.jsp" method="post" class="elegant-aero" onsubmit="return fun()">
    <h1>COMPLAINT FORM
        <span>Please fill all the texts in the fields.</span>
    </h1>
    <label>
        <span>Subject :</span>
        <input id="sub" type="text" name="sub" placeholder="Subject" />
    </label>

     <label>
        <span>Location :</span>
        <input id="loca" type="text" name="loc" placeholder="Location" />
    </label>
   
    <label>
        <span>Date :</span>
        <input id="date" type="text" name="dat" placeholder="00-MON-0000" />
    </label>

     <label>
        <span>Description :</span>
        <textarea id="description" name="desc" placeholder="Description"></textarea>
    </label>

    <label>
        <span>Send To :</span><select name="desg">
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