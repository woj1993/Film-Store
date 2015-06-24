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
        <table border="1">
            <thead>
                <tr>
                    <th><select name="choose">
                            <option></option>
                            <option>Autor</option>
                            <option>Tytuł</option>
                        </select></th>
                    <th><input type="text" name="phase" value="" /></th>
                    <th><input type="submit" value="Wyświetl" /></th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>

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
                        <form action="UpdateFilm.do">
                            <input type="hidden" name="action" value="delete" />
                            <input type="hidden" name="title" value="<%=Film.GetTytuł()%>" />
                            <input type="submit" value="Usuń" />
                        </form>

                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>

        <p><A HREF="Main.jsp">Panel Głowny</A></p>
    </body>
</html>
