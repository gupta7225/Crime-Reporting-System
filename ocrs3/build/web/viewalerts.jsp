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
rs=st.executeQuery("select * from alerts order by date1");
%>
<html>

<head>
<title>ALERT MESSAGES</title>
<script language="javascript" src="./menu.js"></script>
<script language="javascript" src="./menu_items.js"></script>
<script language="javascript" src="./menu_tpl.js"></script>
<script language="javascript">
  new menu (MENU_ITEMS, MENU_POS, MENU_STYLES);
</script>

<style type="text/css">
body {
         
          background-repeat: no-repeat;
          background-position:  center 50%;
      
          }
          
table {
    
    table-layout: fixed;
    border-collapse: collapse;
    width:80%;
    
}

td
{
    
    color: #888;
    padding: 6px 4px 4px 6px;
    margin: 2px 6px 6px 2px;
    font-family: Helvetica, sans-serif;
    height:available;
    text-align:justify;
    
}

th {
    text-align:justify;
   padding: 10px 10px 10px 10px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #3EB1DD;
    color: white;
    text-align: justify;
    font-size: 22px;
}

</style></head>

<body>
 <center><br><br><br><br><table>
                    <tr><th>Area</th>
                    <th>Subject</th>
                    <th>Description</th>
                   </tr>
                    <%
            while(rs.next())
            {
            %>
            
            <tr><td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td> 
              <td><%=rs.getString(3)%></td> 
            </tr>
                     
            
            <%
            }
            
            %>   
        </table>
    </center>
</body>
</html>