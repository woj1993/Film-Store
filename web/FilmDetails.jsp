<%-- 
    Document   : FilmDetails
    Created on : 2015-06-24, 21:53:26
    Author     : Wojtek
--%>

<% request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="sql" scope="session" class="Beans.SQL" />
<jsp:useBean id="Film" scope="session" class="Beans.FILM" />
<!DOCTYPE html>
<%
    Film = sql.WybierzJedenFilm(request.getParameter("tytuł"));
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%out.println(Film.GetAutor()+ " " + Film.GetTytuł());%></title>
    </head>
    <body>
        <jsp:include page="Status.jsp" />
            <p>Tytuł: <%=Film.GetTytuł()%></p>
            <p>Autor: <%=Film.GetAutor()%></p>
            <p>Czas powstania: <%=Film.GetRok()%></p>
            <form action="Watch.do">
                <input type="submit" value="Oglądaj" />
            </form>
        <p><A HREF="Main.jsp">Panel Główny</A></p>
        <p><A HREF="ListaFilmów.jsp">Powrót do listy</A></p>
    </body>
</html>
