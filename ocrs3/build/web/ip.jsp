<html>
<head><title>Hello World</title></head>
<body>
    Hello World!<br/>
    <%
        out.println("Your Host IP address is " + request.getRemoteHost()+"</br>");
        out.println("Your Addr address is " + request.getRemoteAddr()+"</br>");
        out.println("Your Port Post address is " + request.getRemotePort()+"</br>");
    %>
</body>
</html>