
<%@page import="java.sql.*"%>
<%!
String place;
Connection con;
Statement st;
ResultSet rs;
%>
<%
place=(String)session.getAttribute("location");
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
st=con.createStatement();
rs=st.executeQuery("select des,date1 from message where location='"+place+"'");
        %>
        <head>
<title>Cautions </title>

<script language="javascript" src="./menu.js"></script>
<script language="javascript" src="./police_items.js"></script>
<script language="javascript" src="./menu_tpl.js"></script>
<script language="javascript">
  new menu (MENU_ITEMS, MENU_POS, MENU_STYLES);
</script>
<link rel="stylesheet" href="elegant.css" type="text/css">
</head>
<body>    
    
    <h2 align=center>MESSAGES FROM ADMIN</h2>
    <hr width="100%" color="#C0E1FF">
    
        <%
        while(rs.next())
        {
        %>
        
       
      <div id="section">     
      <h1>DATE :</h1>
      <p1><%=rs.getString(2)%></p1>

      <h1>DESCRIPTION :</h1>
      <p1><%=rs.getString(1)%></p1>      
        </div>     
            
                <%
        }
        
        %>  
        </table>
</body>
</html>
           
            
       
        
        
        
        

    