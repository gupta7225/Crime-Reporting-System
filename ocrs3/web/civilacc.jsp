<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
Connection con;
Statement st;
ResultSet rs;
%>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
st=con.createStatement();
rs=st.executeQuery("select * from register order by name asc");
int i=0;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
<script language="javascript" src="./menu.js"></script>
<script language="javascript" src="./admin_items.js"></script>
<script language="javascript" src="./menu_tpl.js"></script>
<script language="javascript">
  new menu (MENU_ITEMS, MENU_POS, MENU_STYLES);
</script>

<style>
body {
          
          background-repeat: no-repeat;
          background-position:  center 50%;
      
          }
          
table {
    border-collapse: collapse;
    width: 100%;
    margin-top: 5em;
    table-layout: fixed;
    position: fixed;
}

td
{
    color: #888;
     margin: 2px 6px 16px 0px; 
    padding: 10px 10px 10px 10px;
     margin: 2px 6px 16px 0px; 
    font-family: Helvetica, sans-serif;
    height:available;
    text-align: match-parent;  
}

th {
    text-align: left;
   padding: 10px 10px 10px 10px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #3EB1DD;
    color: white;
}
.button{
    padding: 10px 30px 10px 30px;
    background: #66C1E4;
    border: none;
    color: #FFF;
    box-shadow: 1px 1px 1px #4C6E91;
    -webkit-box-shadow: 1px 1px 1px #4C6E91;
    -moz-box-shadow: 1px 1px 1px #4C6E91;
    text-shadow: 1px 1px 1px #5079A3;
   margin-top: 20px;
   margin-left: 47em;
    border-radius: 25px;
   
   
}
 h3
  {
   margin-top: 2em;   
   color:#3EB1DD;
   font: 30px "Trebuchet MS", Arial, Helvetica, sans-serif;
      
      }

</style>
</head>
    <body>
   <form name=myname method=post
action="civildelete.jsp">
  
  <table cellspacing="0" cellpadding="0">
   
      <tr>
        <th><span>Select</span></th>  
        <th><span>Name</span></th>
        <th><span>ID</span></th>
        <th><span>Password</span></th>
        <th><span>Age</span></th>
        <th><span>Gen</span></th>
        <th><span>Address</span></th>
        <th><span>Contact No</span></th>
        <th><span>E-mail</span></th>
      </tr>
    <%
            while(rs.next())
            {
            %>
      <tr>
        <td><input type="checkbox" name="check<%=i%>" value="<%=rs.getString(2)%>"></td>   
        <td><%=rs.getString(1)%></td>
        <td><%=rs.getString(2)%></td>
        <td><%=rs.getString(3)%></td>
        <td><%=rs.getString(4)%></td>
        <td><%=rs.getString(5)%></td>
        <td><%=rs.getString(6)%></td>
        <td><%=rs.getString(7)%></td>
        <td><%=rs.getString(8)%></td>
      </tr>
       <%
            }
            
            %>  
    </table>
    <input type="submit" class="button" value="Delete">
    </form>
    </body>
</html>
