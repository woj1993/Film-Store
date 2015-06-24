<%-- 
    Document   : Rejesetracja
    Created on : 2015-06-23, 22:12:31
    Author     : Wojtek
--%>
<% request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");%>
<jsp:include page="Funkcje.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="AddUser.do" method="POST">
            <table border="1">
                <thead>
                    <tr>
                        <th>FORMULARZ</th>
                    </tr>
                </thead>
                <tr><td>Login</td>
                    <td><input type="text" name="login" value="" /></td></tr>
                <tr><td>Hasło</td>
                    <td><input type="password" name="hasło" value="" /></td></tr>
                <tr><td>Powtórz Hasło</td>
                    <td><input type="password" name="rehasło" value=""></td></tr>
                <tr><td>Imie</td>
                    <td><input type="text" name="imie" value=""></td></tr>
                <tr><td></td><td><input type="submit" value="Zarejestruj" /></td></tr>
            </table>
        </form>
        <form action="Logowanie.jsp" method="POST">
            <input type="submit" value="Anuluj" />
        </form>
    </body>
</html>
