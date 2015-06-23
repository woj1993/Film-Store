<%-- 
    Document   : Logowanie
    Created on : 2015-06-23, 21:18:40
    Author     : Wojtek
--%>
<%
    session.invalidate();
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    request.getSession();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Verification.do" method="POST">
            Login
            <input type="text" name="login" value="" />
            Hasło
            <input type="password" name="hasło" value="" />
            <input type="submit" value="Zaloguj" />
        </form>
        <form action="Rejestracja.jsp" method="POST">
              <input type="submit" value="Rejestruj" />
        </form>
    </body>
</html>
