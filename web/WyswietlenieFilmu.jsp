<%-- 
    Document   : WyświetlenieFilmu
    Created on : 2015-06-24, 14:45:24
    Author     : Wojtek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <IFRAME SRC="<%=request.getParameter("Film")%>" allowfullscreen="true" FRAMEBORDER=0 MARGINWIDTH=0 MARGINHEIGHT=0 SCROLLING=NO WIDTH=640 HEIGHT=360></IFRAME>
        <form action="Main.jsp">
            <input type="submit" value="Powrót" />
        </form>
    </body>
</html>
