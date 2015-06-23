<%-- 
    Document   : Rejesetracja
    Created on : 2015-06-23, 22:12:31
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
        <form action="AddUser.do" method="POST">
            Login
            <input type="text" name="login" value="" />
            Hasło
            <input type="password" name="hasło" value="" />
            Powturz Hasło
            <input type="password" name="rehasło" value="">
            Imie
            <input type="text" name="imie" value="">
            <input type="submit" value="Zarejestruj" />
        </form>
    </body>
</html>
