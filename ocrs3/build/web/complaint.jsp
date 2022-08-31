<html>
<head>
<script language="javascript" src="./menu.js"></script>
<script language="javascript" src="./user_items.js"></script>
<script language="javascript" src="./menu_tpl.js"></script>
<script language="javascript">
  new menu (MENU_ITEMS, MENU_POS, MENU_STYLES);
</script>

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
<%@page import="java.sql.*"%>
<%!
String uname,sub,loc,dat,desc,station,name;
int uid;
Connection con;
Statement stmt,st;
ResultSet rs,rs1;
%>
<%
sub=request.getParameter("sub");
loc=request.getParameter("loc");
dat=request.getParameter("dat");
desc=request.getParameter("desc");
station=request.getParameter("desg");
uname=(String)session.getAttribute("usr");
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
stmt=con.createStatement();
st=con.createStatement();
String str1="select branch_seq.NEXTVAL from DUAL";
String str2="select name from register where id='"+uname+"'";
rs1=stmt.executeQuery(str1);
rs1.next();
uid=rs1.getInt(1);

rs=st.executeQuery(str2);
rs.next();
name=rs.getString(1);

String str="insert into branch(cid,cname,sub,loca,da,descri,station) values('"+uid+"','"+name+"','"+sub+"','"+loc+"','"+dat+"','"+desc+"','"+station+"')";
stmt.execute(str);
session.setAttribute("cname", name);



%>
<center><br><br><br><br><h2 style="color:#3EB1DD;">Your Complaint ID is <%=uid%></h2></center><%
stmt.close();
st.close();
con.close();

%>
</body>
</html>