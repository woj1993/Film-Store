<%-- 
    Document   : Main
    Created on : 2015-06-23, 22:01:05
    Author     : Wojtek
--%>
<%@page import="Beans.UŻYTKOWNIK"%>
<jsp:useBean id="Użytkownik" scope="session" class="Beans.UŻYTKOWNIK" />
<%Użytkownik = (UŻYTKOWNIK) session.getAttribute("Użytkownik");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="Status.jsp" />
        <form action="ListaFilmów.jsp" method="POST">

            <input type="hidden" name="choose" value="" disabled="disabled" />
            <input type="hidden" name="phase" value="" disabled="disabled" />
            <input type="submit" value="ListaFilmów" />
        </form>
        <% if (Użytkownik.JestAdminem()) {%>
        <form action="Film.jsp"><input type="submit" value="Dodaj Film" />
        </form>
        <%}%>
    </body>
</html>
