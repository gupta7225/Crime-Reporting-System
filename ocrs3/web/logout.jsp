<%@ page errorPage="errorPage.jsp"%>
<html>
<head>
<script language="javascript" src="./menu.js"></script>
<script language="javascript" src="./menu_items.js"></script>
<script language="javascript" src="./menu_tpl.js"></script>
<script language="javascript">
  new menu (MENU_ITEMS, MENU_POS, MENU_STYLES);
</script>

<style type="text/css">
body {
          background-image:  url('back2.jpg');
          background-repeat: no-repeat;
          background-position:  center 50%;
          background-height:100px
         
          }

</style>
</head><body>

<%
session.invalidate();
%>

    <jsp:include page="home1.html"/>
</body>
</html>
