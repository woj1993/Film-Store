<%-- 
    Document   : Film
    Created on : 2015-06-24, 22:31:44
    Author     : Wojtek
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<% request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");%>
<jsp:include page="Funkcje.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formularz nowego filmu</title>
    </head>
    <body>
        <jsp:include page="Status.jsp" />
        <form action="AddFilm.do" method="POST" onsubmit="if (sprawdz(this))
                    return true;
                return false">
            <table border="1">
                <thead>
                    <tr>
                        <th>FORMULARZ</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Tytuł</td>
                        <td><input type="text" name="Tytuł" value="" maxlength="20" /></td>
                    </tr>
                    <tr>
                        <td>Autor</td>
                        <td><input type="text" name="Autor" value="" maxlength="20" /></td>
                    </tr>
                    <tr>
                        <td>Rok</td>
                        <td><input type="text" name="Rok" value="" maxlength="20" /></td>
                    </tr>
                    <tr>
                        <td>Link do filmu</td>
                        <td><input type="url" name="Film" value="" maxlength="100" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Dodaj" /></td>
                    </tr>
                </tbody>
            </table>

        </form>
        <p><A HREF="Panel.jsp">Powrót do Menu głównego</A></p> 
    </body>
</html>
