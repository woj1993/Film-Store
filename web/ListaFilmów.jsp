<%@page import="Beans.FILM"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Beans.UŻYTKOWNIK"%>
<jsp:useBean id="Użytkownik" scope="session" class="Beans.UŻYTKOWNIK" />
<%Użytkownik = (UŻYTKOWNIK) session.getAttribute("Użytkownik");%>
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
        <table border="1">
            <thead>
                <tr>
                    <th>Autor</th>
                    <th>Tytuł</th>
                    <th>Szczegóły</th>
                </tr>
            </thead>
            <tbody>
                <%  for (FILM Film : Filmy) {%>
                <tr>
                    <td><%=Film.GetAutor()%></td>
                    <td><%=Film.GetTytuł()%></td>
                    <td>
                        <form action="FilmDetails.jsp" method="POST">
                            <input type="hidden" name="tytuł" value="<%=Film.GetTytuł()%>" />
                            <input type="submit" value="Szczegóły" />
                        </form>
                        <% if (Użytkownik.JestAdminem()) {%>
                        <form action="DeleteFilm.do">
                            <input type="hidden" name="tytuł" value="<%=Film.GetTytuł()%>" />
                            <input type="submit" value="Usuń" />
                        </form>
                        <%}%>

                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>

        <p><A HREF="Main.jsp">Panel Głowny</A></p>
    </body>
</html>
