<%-- 
    Document   : ZmieńDane
    Created on : 2015-06-25, 00:10:38
    Author     : Wojtek
--%>
<%@page import="Beans.UŻYTKOWNIK"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  UŻYTKOWNIK Użytkownik = (UŻYTKOWNIK) session.getAttribute("Użytkownik");
    if (Użytkownik == null) {
%>
<jsp:forward page="Logowanie.jsp" />
<%
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profil Użytkownika : <%=Użytkownik.GetLogin()%></title>

    </head>
    <body>
        <jsp:include page="Funkcje.jsp" />
        <jsp:include page="Status.jsp" />

        <h1>Profil Użytkownika <%=Użytkownik.GetLogin()%></h1>
        <p></p>

        <form action="UpdateUser.do" method="POST" onsubmit="if (haslo(this, '<%=Użytkownik.GetHasło()%>'))
                    return true;
                return false">
            <table border="1">
                <thead>
                    <tr>
                        <th>ZMIEN HASŁO</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Aktualne Hasło</td>
                        <td><input type="password" name="oldPassword" value="" /></td>
                    </tr>
                    <tr>
                        <td>Nowe Hasło</td>
                        <td><input type="password" name="password" value="" /></td>
                    </tr>
                    <tr>
                        <td>Powtórz Hasło</td>
                        <td><input type="password" name="rPassword" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="hidden" name="akcja" value="haslo" />
                            <input type="hidden" name="login" value="<%=Użytkownik.GetLogin()%>" />
                            <input type="reset" value="RESET" /></td>
                        <td><input type="submit" value="ZMIEŃ" /></td>
                    </tr>
                </tbody>
            </table>
        </form>
        <h1></h1>
        <form action="UpdateUser.do" onsubmit="if (sprawdz(this)) {
                    alert('W celu utrwalenia danych użytkownik zostanie WYLOGOWANY !!!!');
                    return true;
                }
                return false">
            <table border="1">
                <thead>
                    <tr>
                        <th>Personalia</th>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Imię</td>
                        <td><input type="text" name="name" value="<%=Użytkownik.GetImie()%>" /></td>
                    </tr>
                    <tr>
                        <td><input type="hidden" name="akcja" value="person" />
                            <input type="hidden" name="login" value="<%=Użytkownik.GetLogin()%>" />
                            <input type="reset" value="Reset" /></td>
                        <td><input type="submit" value="Zmień" /></td>
                    </tr>
                </tbody>
            </table>

        </form>
    </body>
</html>