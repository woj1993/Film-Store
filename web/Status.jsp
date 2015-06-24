<%-- 
    Document   : Status
    Created on : 2015-06-24, 20:40:01
    Author     : Wojtek
--%>


<% request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    request.getSession();%>


<% if (session.getAttribute("Użytkownik") == null) { %>
<jsp:forward page="Logowanie.jsp" />
<% } %>

<%@page import="Beans.UŻYTKOWNIK"%>
<jsp:useBean id="Użytkownik" scope="session" class="Beans.UŻYTKOWNIK" />
<%  Użytkownik = (UŻYTKOWNIK) session.getAttribute("Użytkownik");%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>


<table border="0" cellpadding="4">
    <thead>

    </thead>
    <tbody>
        <tr>
            <td>Zalogowany:  <%=Użytkownik.GetLogin()%>  </td>
            <td>
                <form action="Main.jsp" method="POST"><input type="submit" value="Panel Główny" />
                </form>
            </td>
            <% if (Użytkownik.JestAdminem()) {%>
            <td><form action="Administracja.jsp"><input type="submit" value="Panel Admina" />
                </form></td>

            <%}%>
            <td><form action="ZmieńDane.jsp">
                    <input type="submit" value="Profil" /> 
                </form></td>
            <td><form action="Logowanie.jsp">
                    <input type="submit" value="Wyloguj" /></form></td>

        </tr>
    </tbody>
</table>


