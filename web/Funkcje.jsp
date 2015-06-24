<%-- 
    Document   : Funkcje
    Created on : 2015-06-24, 22:35:20
    Author     : Wojtek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript">
// <![CDATA[
    function sprawdz(formularz)
    {
        for (i = 0; i < formularz.length; i++)
        {
            var pole = formularz.elements[i];
            if (!pole.disabled && !pole.readonly && (pole.type == "text" || pole.type == "password" || pole.type == "textarea") && pole.value == "")
            {
                alert("Aby dodać film należy wprowadzić wszystkie wartości");
                return false;
            }
        }
        return true;
    }
// ]]>
</script>

<script type="text/javascript">
// <![CDATA[
    function rej(formularz)
    {

        for (i = 0; i < formularz.length; i++)
        {
            var pole = formularz.elements[i];
            if (!pole.disabled && !pole.readonly && (pole.type == "text" || pole.type == "password" || pole.type == "textarea") && pole.value == "")
            {
                alert("Wymagane jest wypełnienie wszystkich pól!");
                return false;
            }
        }
        if (formularz.elements[1].value != formularz.elements[2].value)
        {
            alert("Hasła muszą być takie same.");
            return false;
        }
        return true;
    }
// ]]>
</script>

<script type="text/javascript">
    // <![CDATA[
    function haslo(dane, user)
    {
        if (dane.oldPassword.value === user) {
            if (!rej(dane))
                return false;
            alert('W celu wprowadenia zmian użytkownik zostanie wylogowany.');
            return true;
        } else {
            alert('Hasło nieprawidłowe.');
            return false;
        }
    }
// ]]>
</script>