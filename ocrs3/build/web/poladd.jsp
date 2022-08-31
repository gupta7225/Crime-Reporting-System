<html>
<head>
<title></title>

<link rel="stylesheet" href="elegant-aero.css" type="text/css">
<style type="text/css">
body {
          background-image:  url('back2.jpg');
          background-repeat: repeat;
          background-position:  center 50%;
          background-height:100px
         
          }

</style>
<script>
function fun()
{
var no1=f.pid.value;
if(no1.length==0)
{
alert("Please enter valid id");
f.pid.focus();
return false;
}
var no2=f.pass.value;
if(no2.length==0)
{
alert("Please enter password");
f.pass.focus();
return false;
}
var no3=f.pname.value;
if(no3.length==0)
{
alert("Please enter Name");
f.pname.focus();
return false;
}
var no5=f.pno.value;
if(no5.length==0 )
{
alert("Please enter valid phone no");
f.pno.focus();
return false;
}
var no6=f.designation.value;
if(no6.length==0)
{
alert("Please specify designation");
f.designation.focus();
return false;
}
var no7=f.location.value;
if(no7.length==0 )
{
alert("Please specify location");
f.location.focus();
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

</head>
<body>
    <form name="f" action="poladdValid.jsp" method="post" class="elegant-aero" onsubmit="return fun()">
    <h1>ADD DEPARTMENT
        
    </h1>
    <label>
        <span>ID :</span>
        <input id="id" type="text" name="pid" placeholder="ID" />
    </label>
        
         <label>
        <span>PASSWORD :</span>
        <input id="password" type="text" name="pass" placeholder="PASSWORD" />
    </label>

     <label>
        <span>NAME :</span>
        <input id="name" type="text" name="pname" placeholder="NAME" />
    </label>
   
    <label>
        <span>DESIGNATION :</span>
        <input id="desg" type="text" name="designation" placeholder="DESIGNATION" />
    </label>

    <label>
        <span>LOCATION :</span>
        <input id="loc" type="text" name="location" placeholder="LOCATION" />
    </label>

    <label>
        <span>CONTACT :</span>
        <input id="age" type="text" name="pno" placeholder="CONTACT NO" />
    </label>
 

  
       
       <label>
        <span>&nbsp;</span>
        <input type="submit" class="button" value="ADD" />&nbsp;&nbsp;&nbsp;<input type="reset" class="button" value="CLEAR" />
        
        </label>
</form>
</body>
</html>