<html>
<head>
<title>police department</title>
<script language="javascript" src="./menu.js"></script><script language="javascript" src="./police_items.js"></script>
<script language="javascript" src="./menu_tpl.js"></script>
<script language="javascript">
  new menu (MENU_ITEMS, MENU_POS, MENU_STYLES);
</script>

<style type="text/css">
body 
{
          background-image:  url('back2.jpg');
          background-repeat: no-repeat;
          background-position:  center 50%;
       
         
 }
 h2
 {
             
   margin-top: 2em;   
   color:#3EB1DD;
   font: 30px "Trebuchet MS", Arial, Helvetica, sans-serif;
      
      
 }       

</style>

</head>
<body> <br><br><br><br><br><br>
<center><h2><b><u><%=(String)session.getAttribute("location")%>  Police Station</u>
</b></font></h2></center>
</font>
</body>
</html>