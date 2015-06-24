<%@page import="Beans.FILM"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<jsp:useBean id="sql" scope="session" class="Beans.SQL" />

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista filmów</title>
    </head>
    <body>
        <jsp:include page="Status.jsp" />
        <%  ArrayList<FILM> Filmy;
            Filmy = sql.PokażFilmy();
        %>
        <%for (FILM Film : Filmy){%>
            <%=Film.GetTytuł()%>
        <%}%>
        <p><A HREF="Panel.jsp">Panel Głowny</A></p>
    </body>
</html>
