<%@page import="java.util.ArrayList"%>
<%@page import="Beans.UŻYTKOWNIK"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    UŻYTKOWNIK zalogowany = (UŻYTKOWNIK) session.getAttribute("Użytkownik");
    if (zalogowany == null || zalogowany.JestAdminem() == false) {
%>
<jsp:forward page="Logowanie.jsp" />
<%}%>
<jsp:useBean id="sql" scope="session" class="Beans.SQL" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Panel Administratora</title>
    </head>
    <body>
        <jsp:include page="Status.jsp" />
        <%  ArrayList<UŻYTKOWNIK> Użytkownicy;
            Użytkownicy = sql.WybierzWszystkich();
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>Login</th>
                    <th>Imię</th>
                    <th>Admin</th>
                    <th>Zapłacił abonament</th>
                    <th>Usuwanie</th>
                    <th>Zapłacił</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (UŻYTKOWNIK Użytkownik : Użytkownicy) {%>
                <tr>
                    <td><%=Użytkownik.GetLogin()%></td>
                    <td><%=Użytkownik.GetImie()%></td>
                    <td><%=Użytkownik.JestAdminem()%></td>
                    <td><%=Użytkownik.Zapłacił()%></td>
                    <td><form action="Delete.do" method="POST">
                            <input type="hidden" name="Login" value="<%=Użytkownik.GetLogin()%>" />
                            <input type="submit" value="Usuń" />
                        </form>
                    </td>
                    <td><form action="HasPayed.do" method="POST">
                            <input type="hidden" name="akcja" value="delete" />
                            <input type="hidden" name="Login" value="<%=Użytkownik.GetLogin()%>" />
                            <input type="submit" value="Zmień" />
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
